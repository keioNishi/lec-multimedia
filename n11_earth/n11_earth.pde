PShape globe;
 
void setup() { 
  size(600, 600, P3D); 
  background(0); 
  PImage earth = loadImage("hoge.jpg");
  globe = createShape(SPHERE, 200); 
  globe.setStroke(false);
  globe.setTexture(earth);
  noStroke();
}
 
void draw() {
  background(0);
  translate(width/2, height/2);
  rotateY(map(mouseX,0,width,-PI,PI));
  rotateX(map(-mouseY,0,width,-PI,PI));
  shape(globe);
}
