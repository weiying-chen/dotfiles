precision highp float;
varying vec2 v_texcoord;
uniform sampler2D tex;

void main() {
    vec4 c = texture2D(tex, v_texcoord);
    c.b *= 0.72;
    c.g *= 0.90;
    gl_FragColor = c;
}
