//attributes 
int mode = 0; 

void setup() {
 size (1200,880);
 background(255);
 fill(0);
 textSize(52);
 textAlign(LEFT);
 text("PRESS 1 FOR SINGLE-PLAYER OR 2 FOR MULTIPLAYER", 10, 480); 
 
 if (mode == 1){
   SinglePlayerGrid();
 }
 
 if (mode == 2){
   MultiplayerGrid();
 }
 
}

void draw() {
  
}


//temporary method for debugging

void SinglePlayerGrid() {
  int x = 0;
  int y = 0;
  int size = 40; 
  background(255);
  if (y < height){
    for (int curRow = 0; curRow < height/size; curRow++){
      for (int curCol = 0; curCol < 10; curCol++){
        fill(0);
        stroke(255);
        square(size * 10  + x, y, size); 
        x += size;
      }
      x = 0;
      y += size;
    }
  }
}

void MultiplayerGrid() {
  int x = 0;
  int y = 0;
  int size = 40; 
  background(255);
  if (y < height){
    for (int curRow = 0; curRow < height/size; curRow++){
      for (int curCol = 0; curCol < 10; curCol++){
        fill(0);
        stroke(255);
        square(x, y, size); 
        x += size;
      }
      x = 0;
      y += size;
    }
  }
  
  x = 0; 
  y = 0;
  if (y < height){
    for (int curRow = 0; curRow < height/size; curRow++){
      for (int curCol = 0; curCol < 10; curCol++){
        fill(0);
        stroke(255);
        square(size * 20 + x, y, size); 
        x += size;
      }
      x = 0;
      y += size;
    }
  }
}

void keyPressed(){
  if (key == '1'){
    mode = 1; 
    setup();
  }
  if (key == '2'){
    mode = 2; 
    setup();
  }
}

void reset(){
  mode = 0;
  setup();
}
