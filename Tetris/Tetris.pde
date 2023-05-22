//attributes 
boolean mode; 

void setup() {
 size (880,960);
 background(255);
 fill(0);
 textSize(39);
 textAlign(LEFT);
 text("PRESS 1 FOR SINGLE-PLAYER OR 2 FOR MULTIPLAYER", 0, 480); 
}

//temporary method for debugging
int x = 0;
int y = 0;
int size = 40; 

void grid() {
  if (y < height){
    for (int curRow = 0; curRow < height / size; curRow++){
      for (int curCol = 0; curCol < width / size; curCol++){
        fill(0);
        stroke(255);
        square(x, y, size); 
        x += size;
      }
      x = 0;
      y += size;
    }
  }
}

void keyPressed(){
  if (key == "1")
    mode = true; 
  else 
    mode = false; 
}
