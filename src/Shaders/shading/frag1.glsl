uniform float u_time;
uniform vec2 u_resolution;

//Circle function
//The length function is a built in GLSL function that finds the Euclidean Distance from the center to each fragment
float circleSDF(vec2 coords, float radius) {
  return length(coords) - radius;
}

void main() {
  //Cartesian Coordinates of fragments
  //the center is (0, 0)
  vec2 coords = (gl_FragCoord.xy - u_resolution.xy * 0.5) / u_resolution.y;

  vec2 coords1 = vec2(coords.x + sin(u_time * 2.)/4., coords.y + cos(u_time * 2.)/4.);
  vec2 coords2 = vec2(coords.x + sin(u_time * 4.)/10., coords.y + cos(u_time * 4.)/10.);
  vec2 coords3 = vec2(coords.x + sin(u_time)/2.5, coords.y + cos(u_time)/2.5);
  //Color of fragments
  //(r, g, b) - vector 3
  vec3 color;

  //radius
  float radius = 0.025;

  //inside the circle is negative
  //outside the circle is positive
  //on the cirlce is 0
  float c1 = circleSDF(coords1, radius);
  float c2 = circleSDF(coords2, radius);
  float c3 = circleSDF(coords3, radius);

  //all fragments on the coordinate system that are 0 and negative will be colored green
  //all fragments on the coordinate system that are greater than 0 will be colored black
  color = mix(vec3(1., 0., 0.), color, smoothstep(0.0, 0.05, c1));
  color = mix(vec3(0., 1., 0.), color, smoothstep(0.0, 0.05, c2));
  color = mix(vec3(1., 1., 0.), color, smoothstep(0.0, 0.05, c3));


  gl_FragColor = vec4(color, 1.0);
}
