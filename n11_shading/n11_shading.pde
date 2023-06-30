float spin = 0.0;

void setup() {
  size(640, 360, P3D);
  noStroke();
  colorMode(RGB, 1);
  fill(0.4);
}

void draw() {
  background(0);
  if (!mousePressed) {
    lights();
  }
  spin += 0.01;
  lightSpecular(1, 1, 1);
  directionalLight(0.8, 0.8, 0.8, 0, 0, -1);
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateX(PI/9);
  rotateY(PI/5 + spin);
  box(150);
  popMatrix();
  float s = mouseX / float(width);
  specular(s, s, s);
}
