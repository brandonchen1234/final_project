void setup() {
 size (880,960);
 grid(); 
}

//temporary method for debugging
int x = 0;
int y = 0;
int size = 40; 

void grid() {
  if (y < height){
    for (int curRow = 0; curRow < height / size; curRow++){
      for (int curCol = 0; curCol < width / size; curCol++){
        fill(255);
        stroke(0);
        square(x, y, size); 
        x += size;
      }
      x = 0;
      y += size;
    }
  }
}
