varying vec2 v_texcoord;

uniform sampler2D tex_screen;     // Screenshot
uniform sampler2D tex_cracks;     // Crack texture
uniform float u_time;             // Progress 0.0 → 1.0
uniform float u_strength;         // Force of explosion

void main()
{
    vec2 uv = v_texcoord;

    // Crack intensity from texture
    float crack = texture2D(tex_cracks, uv).r;

    // Displacement amount from cracks
    float disp = crack * u_strength * u_time;

    // Compute direction: radial from screen center
    vec2 dir = normalize(uv - vec2(0.5, 0.5));

    // Displace UV
    vec2 new_uv = uv + dir * disp;

    // Slight distortion
    new_uv += (crack * 0.025) * sin(u_time * 20.0);

    // Sample original screen
    vec4 col = texture2D(tex_screen, new_uv);

    // Fade out as the piece "flies away"
    col.a *= max(0.0, 1.0 - u_time * 1.2);

    gl_FragColor = col;
}