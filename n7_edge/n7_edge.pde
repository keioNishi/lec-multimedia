PImage img, img_mask;
size(1000, 500);
img_mask = createImage(500, 500, RGB);
img = loadImage("../apple.jpg");
img.filter(GRAY);
float gvs;
float ghs;
float g;
for (int y = 1; y < 500-1; y++) { 
  for (int x = 1; x < 500-1; x++) {
    ghs = - red(img.get(x-1, y-1)) - 2*red(img.get(x-1, y))
      - red(img.get(x-1, y+1)) + red(img.get(x+1, y-1))
      + 2*red(img.get(x+1, y)) + red(img.get(x+1, y+1));
    gvs = - red(img.get(x-1, y-1)) - 2*red(img.get(x, y-1))
      - red(img.get(x+1, y-1)) + red(img.get(x-1, y+1))
      + 2*red(img.get(x, y+1)) + red(img.get(x+1, y+1));
    g = sqrt(pow(ghs, 2) + pow(gvs, 2));
    img_mask.set(x, y, color(abs(g)));
  }
}
image(img, 0, 0);
image(img_mask, 500, 0);
