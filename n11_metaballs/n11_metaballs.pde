int blobCount = 5;
float metaRange = 110;
ArrayList<Point> points = new ArrayList<Point>();
int sampling = 8;
void setup(){
 size(800, 800, P2D);
 for(int i = 0; i < blobCount; i++){
    points.add(new Point(new PVector(random(0,width), random(0,height)), random(50, 150)));
 }
 frameRate(10);
}

void draw(){
  background(255);
  noStroke();
  for (int y = 0; y < height; y+=sampling){
    for (int x = 0; x < width; x+=sampling){
      float totaldist = 0;
      for (Point p : points){
        totaldist += metaRange * p.r / dist(p.pos.x, p.pos.y, x, y);
      }
      int index = x + y*width;
      if(totaldist < 255){
        fill(0);
      }
      else{
        fill(255);
      }
      fill(pow(10, totaldist/100));
      rect(x, y, sampling, sampling);
    }
  }
  fill(255);
  for (Point p : points){
    p.update();
  }
  
}

class Point{
  PVector pos;
  PVector vel = new PVector(random(-20, 20), random(-20, 20));
  float r;
  Point(PVector pos, float r){
    this.r = r;
    this.pos = pos;
  }
  
  void update(){
    pos.add(vel);
    if (this.pos.x > width || this.pos.x < 0) this.vel.x *= -1;
    if (this.pos.y > height || this.pos.y < 0) this.vel.y *= -1;
  }
}
