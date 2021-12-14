size(400, 400);
rectMode(CENTER);
background(255);
translate(100, 100);

stroke(255, 150, 150, 127);
for (int x = 0; x <= 400; x += 20) {
  line(x, 0, x, 400);
}
for (int y = 0; y <= 400; y += 20) {
  line(0, y, 400, y);
}
 
fill(255, 0, 0, 127);
rect(0, 0, 40, 40);
