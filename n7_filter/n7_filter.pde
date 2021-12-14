PImage img;
size(500,500);
img = loadImage("../apple.jpg");
img.filter(GRAY);
image(img, 0, 0);
