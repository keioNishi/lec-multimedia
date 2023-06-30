void setup(){
  size(800, 700, P3D);
  background(0);
  noStroke();
}

void draw(){
  ambientLight(30, 15, 15);
  lightSpecular(100, 100, 210);
  directionalLight(126, 126, 126, 0, 0, -1);
  specular(255, 255, 255);
  translate(128, 200, 0);
  rotateY(PI/8);
  shininess(1.0);
  box(160);
  translate(200, 0, 0);
  sphere(120);
  translate(300, 0, 0);
  box(160);
  translate(200, 0, 0);
  sphere(120);
  translate(-700, 300, 0);
  shininess(80.0);
  box(160);
  translate(200, 0, 0);
  sphere(120);
  translate(300, 0, 0);
  box(160);
  translate(200, 0, 0);
  sphere(120);
}
