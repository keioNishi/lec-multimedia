PImage img, imgr; 
img = loadImage("../apple.jpg");
imgr = createImage(500, 500, RGB);
size(1000, 500);
img.filter(GRAY);
int a[] = new int[9];
for (int y = 1; y < 500-1; y++) { 
  for (int x = 1; x < 500-1; x++) { 
    a[0] = (int)red(img.get(x-1, y-1));
    a[1] = (int)red(img.get(x, y-1));
    a[2] = (int)red(img.get(x+1, y-1)); 
    a[3] = (int)red(img.get(x-1, y  ));
    a[4] = (int)red(img.get(x, y  ));
    a[5] = (int)red(img.get(x+1, y  )); 
    a[6] = (int)red(img.get(x-1, y+1));
    a[7] = (int)red(img.get(x, y+1));
    a[8] = (int)red(img.get(x+1, y+1)); 
    a = sort(a);
    imgr.set(x, y, color(a[4]));
  }
}
image(img, 0, 0);
image(imgr, 500, 0);
