int cols, rows;
int scl = 20;
int w = 5000;
int h = 5000;

float flying = 0;

float[][] terrain;

void setup() {
  size(800,800, P3D);
  cols = w / scl;
  rows = h / scl;
  
  terrain = new float[cols][rows];
  
}

void draw() {
  
  flying += 0.02;
  
  float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
       terrain[x][y] = map(noise(xoff, yoff), 0, 1, -30, 30);
      // System.out.println(terrain[x][y]);
       xoff += 0.2; 
    }
    yoff += 0.2;
  }
  
  color bg = #670062;
  background(bg);
  stroke(#06AECE);
  fill(#035381);
  
  translate(width/2,height/2+100);
  rotateX(PI/3);
  
  translate(-w/2, -h/2);
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
      //rect(x*scl, y*scl, scl, scl);
    }
    endShape();
  }
  
  saveFrame("output/perlin_####.png");
}
