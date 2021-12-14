PShader ps;
PImage img;
void setup() {
  size(500,500,P2D);
  ps = loadShader("gaussian-blur.glsl");
  img = loadImage("../apple.jpg");
  image(img, 0, 0);
}

void draw(){
  filter(ps);
}
