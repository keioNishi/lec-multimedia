int tree_step;
float tree_angle;
float tree_length;
float tree_startx;
float tree_scale;

void setup() {
  size(800, 600);
  tree_step = 12;
  tree_angle = 20;
  tree_length = 100;
  tree_scale = 0.8;
  tree_startx = width/2;
  tree_angle = radians(tree_angle);
  newTree();
}

void draw() {
  background(255);
  newTree();
  noLoop();
}

void newTree() {
  translate(tree_startx, height);
  branch(tree_startx, tree_length, tree_step);
}

void branch(float x0, float h, int n) {
  float theta;
  line(0, 0, 0, -h);
  translate(0, -h);
  h *= tree_scale;
  if (n > 0) {
    theta = -tree_angle;
    pushMatrix();    
    rotate(theta);   
    branch(x0, h, n-1);
    popMatrix();     
    theta =  tree_angle;
    pushMatrix();
    rotate(theta);
    branch(x0, h, n-1);
    popMatrix();
  }
}
