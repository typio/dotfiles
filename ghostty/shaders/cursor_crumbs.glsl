float getSdfRectangle(in vec2 p, in vec2 xy, in vec2 b)
{
    vec2 d = abs(p - xy) - b;
    return length(max(d, 0.0)) + min(max(d.x, d.y), 0.0);
}

vec2 normalize(vec2 value, float isPosition) {
    return (value * 2.0 - (iResolution.xy * isPosition)) / iResolution.y;
}

float antialising(float distance) {
    return 1. - smoothstep(0., normalize(vec2(2., 2.), 0.).x, distance);
}

float hash11(float p)
{
    p = fract(p * .1031);
    p *= p + 33.33;
    p *= p + p;
    return fract(p);
}

// Use this site to convert from HEX to vec4
// https://enchanted.games/app/colour-converter/
const vec4 TRAIL_COLOR = vec4(0.976, 0.302, 1.0, 1.0); // cursor
const vec4 PARTICLE_COLOR = vec4(1, 0.7, 0.4, 1.0); // crumbs
const float CURSOR_OPACITY = 0.3; // Low for text behind cursor to be more visible (0.0 = fully visible text, no cursor fill)
const float PARTICLE_OPACITY = 1.0; // Starts fully visible
const float DURATION = 1.0; // IN SECONDS
const int NUM_PARTICLES = 20; // Increased for more crumbs
const float GRAVITY = 1.0; // Negative for downward pull after jump (y positive up)
const float BASE_VY = -0.1; // Initial upward velocity for jump
const float VX_RANGE = 0.5; // Horizontal spread range (increased for visibility)
const float PARTICLE_SIZE = 0.002; // Base size (increased for visibility)

void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    #if !defined(WEB)
    fragColor = texture(iChannel0, fragCoord.xy / iResolution.xy);
    #else
    fragColor = vec4(0.0);
    #endif
    
    // Normalization for fragCoord to a space of -1 to 1;
    vec2 vu = normalize(fragCoord, 1.);
    vec2 offsetFactor = vec2(-.5, 0.5);
    
    // Normalization for cursor position and size;
    vec4 currentCursor = vec4(normalize(iCurrentCursor.xy, 1.), normalize(iCurrentCursor.zw, 0.));
    vec4 previousCursor = vec4(normalize(iPreviousCursor.xy, 1.), normalize(iPreviousCursor.zw, 0.));
    
    float sdfCurrentCursor = getSdfRectangle(vu, currentCursor.xy - (currentCursor.zw * offsetFactor), currentCursor.zw * 0.5);
    
    // Draw the cursor
    float cursorAlpha = antialising(sdfCurrentCursor);
    fragColor = mix(fragColor, TRAIL_COLOR, cursorAlpha * CURSOR_OPACITY);
    
    // Calculate progress since cursor moved
    float progress = clamp((iTime - iTimeCursorChange) / DURATION, 0.0, 1.0);
    
    // Draw particles if cursor has moved
    float particle_sdf = 9999.0;
    if (distance(currentCursor.xy, previousCursor.xy) > 0.0001 && progress < 1.0) {
        vec2 bottom_left = vec2(previousCursor.x, previousCursor.y ); // From base/bottom
        
        for (int i = 0; i < NUM_PARTICLES; ++i) {
            float fi = float(i);
            float h_x = hash11(fi + 0.5);
            float h_vx = hash11(fi + 1.5);
            float h_vy = hash11(fi + 2.5);
            
            vec2 init_pos = bottom_left + vec2(previousCursor.z * h_x, 0.0);
            
            vec2 velocity = vec2((h_vx - 0.5) * VX_RANGE, BASE_VY + (h_vy - 0.5) * 0.02);
            
            float particle_t = progress * DURATION; // Actual elapsed time for physics
            
            vec2 pos = init_pos + velocity * particle_t + vec2(0.0, 0.5 * GRAVITY * particle_t * particle_t);
            
            float curr_size = PARTICLE_SIZE * (1.0 - progress);
            
            float pdist = length(vu - pos) - curr_size;
            
            particle_sdf = min(particle_sdf, pdist);
        }
    }
    
    float particle_alpha = antialising(particle_sdf) * (1.0 - progress) * PARTICLE_OPACITY;
    
    // Draw particles on top
    fragColor = mix(fragColor, PARTICLE_COLOR, particle_alpha);
}
