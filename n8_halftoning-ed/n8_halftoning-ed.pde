PImage img1, img2;
int th = 127;
void setup() {
  size(1000, 500);
  img1 = loadImage("test.jpg");
  img2 = createImage(500, 500, RGB);
  img1.filter(GRAY);
  int x, y;
  for (y = 0; y < 500; y++) {
    int e = 0;
    for (x = 0; x < 500; x++) {
      int a = (int)red(img1.get(x, y)) + e;
      if (a > th) {
        img2.set(x, y, color(255));
        e = a-255;
      } else {
        img2.set(x, y, 0);
        e = a;
      }
    }
  }
}
void draw() {
  image(img1, 0, 0);
  image(img2, 500, 0);
}
