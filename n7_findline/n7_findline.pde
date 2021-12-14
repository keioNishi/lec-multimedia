import gab.opencv.*;
import controlP5.*;
ControlP5 cp5;
OpenCV cv;
PImage im;
ArrayList<Line> lines;
int th1 =20, th2 = 75;
int th=100, minLength=30, maxLineGap=20;
void setup() {
  size(500,500);
  im = loadImage("../keio.jpg");
  cp5 = new ControlP5(this);
  cp5.addSlider("th1",1,255,128,10,10,30,100);
  cp5.addSlider("th2",1,255,128,10,120,30,100);
  cp5.addSlider("th",1,255,128,60,10,30,100);
  cp5.addSlider("minLength",1,255,128,60,120,30,100);
  cp5.addSlider("maxLineGap",1,255,128,60,230,30,100);
}
void draw() {
  cv = new OpenCV(this, im);
  cv.findCannyEdges(th1, th2);
  lines = cv.findLines(th, minLength, maxLineGap);
  image(cv.getOutput(), 0, 0);
  strokeWeight(3);
  for (Line line : lines) {
      stroke(40, 200, 50);
      line(line.start.x, line.start.y, line.end.x, line.end.y);
  }
}
