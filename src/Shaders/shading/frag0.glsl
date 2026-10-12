uniform float u_time;
uniform vec2 u_resolution;

float circleSDF(vec2 coords, float radius) {
  return length(coords) - radius;
}

void main() {
  vec2 coords = (gl_FragCoord.xy - u_resolution.xy * 0.5) / u_resolution.y;
  float cir = circleSDF(coords, 0.25);
  vec3 color;
  color = mix(vec3(1., abs(cos(u_time)), 0.), color, smoothstep(0., 0.2 * abs(sin(u_time)) + 0.1, cir));

  gl_FragColor = vec4(color, 1.);
}

