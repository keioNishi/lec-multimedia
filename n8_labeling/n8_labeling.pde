PImage img, img_bin;
boolean bins[][];
float r_ratio=0.299;
float g_ratio=0.587;
float b_ratio=0.114;
int threshold=180;
int label=0;
int labels[][];
void setup() {
  size(1000, 500);
  img = loadImage("../apple.jpg");
  img_bin = new PImage(500, 500);
  labels = new int[500][500]; 
  bins = new boolean[500][500];
  image(img, 0, 0);
  binarize();
  for (int y=0; y < 500; y++) {
    for (int x=0; x < 500; x++) {
       if(bins[x][y] && (labels[x][y] == 0)){
         label++;
         search(x, y);
       }
    }
  }
}
void search(int x, int y){
  labels[x][y] = label;
  if(x < 500-1) if(bins[x+1][y] && (labels[x+1][y] == 0)) search(x+1, y);
  if(y < 500-1) if(bins[x][y+1] && (labels[x][y+1] == 0)) search(x, y+1);
  if(x > 0) if(bins[x-1][y] && (labels[x-1][y] == 0)) search(x-1, y);
  if(y > 0) if(bins[x][y-1] && (labels[x][y-1] == 0)) search(x, y-1);
  return;
}
void binarize() {
  for (int y=0; y < 500; y++) {
    for (int x=0; x < 500; x++) {
      color pix=img.pixels[x+y*500];
      int med=(int)(r_ratio*red(pix)+g_ratio*green(pix)+b_ratio*blue(pix)); 
      if (med>threshold) {
        bins[x][y]=true; 
        img_bin.pixels[x+y*500]=color(255);
      } else {
        bins[x][y]=false;
        img_bin.pixels[x+y*500]=color(0);
      }
    }
  }
  image(img_bin, 500, 0);
}
void draw() {
}
void mousePressed() {
  int x = mouseX-500;
  int y = mouseY;
  if (x>0) {
    int label=labels[x][y]; 
    println("label("+x+","+y+"):"+label);
  }
}
