#version 310 es
#define attribute in

attribute vec4 vPosition;

void main() {
  gl_Position = vPosition;
}
