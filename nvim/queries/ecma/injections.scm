; extends

(call_expression 
    function: (identifier) @function (#eq? @function "wgsl")

  (template_string
    (string_fragment) @wgsl)
)

