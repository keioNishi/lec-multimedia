int word[] = {0, 0, 0, 0}; // input vector (4bits)
int p = 3; // error position (0-6)

int G[][] =
  {{1, 0, 0, 0, 0, 1, 1}, 
  {0, 1, 0, 0, 1, 0, 1}, 
  {0, 0, 1, 0, 1, 1, 0}, 
  {0, 0, 0, 1, 1, 1, 1}};
int H[][] =
  {{0, 0, 0, 1, 1, 1, 1}, 
  {0, 1, 1, 0, 0, 1, 1}, 
  {1, 0, 1, 0, 1, 0, 1}};
int cw[] = new int[7]; // codeword
int sy[] = new int[3]; // syndrome
for (int j = 0; j < 7; j++) {
  cw[j] = 0;
  for (int i = 0; i < 4; i++)
    cw[j] += word[i] * G[i][j];
  cw[j] = cw[j] % 2;
}
println("code word is "+cw[0]+cw[1]+cw[2]+cw[3]+cw[4]+cw[5]+cw[6]);
if ((p >= 0) && (p < 7)) cw[p] = (cw[p] + 1) % 2;
println("word with an error is "+cw[0]+cw[1]+cw[2]+cw[3]+cw[4]+cw[5]+cw[6]);
for (int i = 0; i < 3; i++) {
  sy[i] = 0;
  for (int j = 0; j < 7; j++)
    sy[i] += cw[j] * H[i][j];
  sy[i] = sy[i] % 2;
}
println("syndrome is "+sy[0]+sy[1]+sy[2]);
int l = 0;
for (int i = 0; i < 3; i++) {
  l *= 2;
  l = l + sy[i];
}
if (l != 0) {
  println("error found at "+(l-1));
  cw[l-1] = (cw[l-1] + 1) % 2;
  println("the original word is "+cw[0]+cw[1]+cw[2]+cw[3]);
} else {
  println("No error");
}
