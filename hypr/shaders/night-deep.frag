precision highp float;
varying vec2 v_texcoord;
uniform sampler2D tex;

void main() {
    vec4 c = texture2D(tex, v_texcoord);
    c.b *= 0.52;
    c.g *= 0.82;
    gl_FragColor = c;
}
