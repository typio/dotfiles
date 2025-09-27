// "Just snow 2"

  float snow(vec2 uv, float scale) {
    float w = smoothstep(1.0, 0.0, -uv.y * (scale / 10.0));
    
    if (w < 0.1) {
      return 0.0;
    }
    
    float c = iTime / scale;
    
    uv += c;
    
    uv.y -= c;
    uv.x -= c;

    uv.y -= c * 2.0;
    uv.x += cos(uv.y + iTime * 0.5) / scale;
    uv   *= scale;

    vec2 s = floor(uv);
    vec2 f = fract(uv);
    vec2 p = vec2(0.0);

    float k = 3.0;
    float d = 0.0;
    
    p = 0.5 + 0.35 * sin(11.0 * fract(sin((s + p + scale) * mat2(7, 3, 6, 5)) * 5.0)) - f;
    d = length(p);
    k = min(d, k);

    k = smoothstep(0.0, k, sin(f.x + f.y) * 0.01);
    return k * w;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord.xy / iResolution.xy;


    vec4 terminalColor = texture(iChannel0, uv);

    vec3 c = terminalColor.rgb;

    c += snow(uv, 30.0) * 0.1;
    c += snow(uv, 20.0) * 0.2;
    c += snow(uv, 15.0) * 0.3;
    c += snow(uv, 10.0) * 0.5;
    c += snow(uv, 8.0) * 0.5;
    c += snow(uv, 6.0) * 0.75;
    c += snow(uv, 5.0) * 0.75;

    fragColor = vec4(vec3(c), terminalColor.a);
}
