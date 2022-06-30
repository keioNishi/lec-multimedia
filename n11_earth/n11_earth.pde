PShape globe;
 
void setup() { 
  size(600, 600, P3D); 
  background(0); 
  PImage earth = loadImage("earth.jpg");
  globe = createShape(SPHERE, 200); 
  globe.setStroke(false);
  globe.setTexture(earth);
  noStroke();
}
 
void draw() {
  background(0);
  //環境光(光の色R, G, B)
  ambientLight(50, 50, 50);
  //ハイライト(鏡面反射色)(色R, G, B)
  lightSpecular(50, 50, 50);
  //直接光(光源の色R, G, B, 光源の位置x, y z)
  directionalLight(200, 200, 200, -0.5, 1, -1);
  translate(width/2, height/2);
  rotateY(map(mouseX,0,width,-PI,PI));
  rotateX(map(-mouseY,0,width,-PI,PI));
  shape(globe);
}
