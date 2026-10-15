uniform float u_time;
uniform vec2 u_resolution;

#define PI (3.1415926538)
#include ../includes/circleSDF.glsl

void main(){
    gl_FragColor = vec4(1., 0., 0., 1.);
}
