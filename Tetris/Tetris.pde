public class Tetris
//temporary method for debugging
void grid() {
  if (y < height){
    for (int curRow = 0; curRow < h; curRow++){
      for (int curCol = 0; curCol < w; curCol++){
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
