//attributes 
int mode = 0; 
boolean isGameRunning = false;
Blocks currentBlock;
int size = 40; 
int x = 0;
int y = 0;

//square
PVector[][] OPositions = { {new PVector(x, y), new PVector(x + size, y), new PVector(x, y + size), new PVector(x + size, y + size)}, 
                          {new PVector(x, y), new PVector(x + size, y), new PVector(x, y + size), new PVector(x + size, y + size)},
                          {new PVector(x, y), new PVector(x + size, y), new PVector(x, y + size), new PVector(x + size, y + size)},
                          {new PVector(x, y), new PVector(x + size, y), new PVector(x, y + size), new PVector(x + size, y + size)}
                        };
Blocks squareBlock = new Blocks(color(255,255,0), OPositions);

//L block
PVector[][] Lpositions = { {new PVector(x - size, y), new PVector(x, y), new PVector(x + size, y), new PVector(x + size, y - size)}, 
                          {new PVector(x, y - size), new PVector(x, y), new PVector(x, y + size), new PVector(x + size, y + size)},
                          {new PVector(x - size, y + size), new PVector(x - size, y), new PVector(x, y), new PVector(x + size, y)},
                          {new PVector(x - size, y - size), new PVector(x, y - size), new PVector(x, y), new PVector(x, y + size)}
                        };
                        
Blocks LBlock = new Blocks(color(255,127,0), Lpositions);

//J block
PVector[][] Jpositions = { {new PVector(x - size, y), new PVector(x, y), new PVector(x + size, y), new PVector(x - size, y - size)}, 
                          {new PVector(x, y - size), new PVector(x, y), new PVector(x, y + size), new PVector(x + size, y - size)},
                          {new PVector(x - size, y  size), new PVector(x - size, y), new PVector(x, y), new PVector(x + size, y)},
                          {new PVector(x - size, y - size), new PVector(x, y - size), new PVector(x, y), new PVector(x, y + size)}
                        };

void setup() {
 size (1200,960);
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
 
 currentBlock = LBlock;
}

void draw() {
  if (isGameRunning == true){
    SinglePlayerGrid();
    
    for (PVector position: currentBlock.getPositions()){
        fill(currentBlock.getColor());
        square(position.x, position.y, 40);
    }
    
    if (frameCount % 90 == 0)
      currentBlock.Down();
    
  }
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
  if (key == '1' && isGameRunning == false){
    mode = 1; 
    isGameRunning = true;
    setup();
  }
  if (key == '2' && isGameRunning == false){
    mode = 2; 
    isGameRunning = true;
    setup();
  }
  if (key == 'w' || key == 'W' && isGameRunning == true){
    currentBlock.Rotate();
  }
  if (key == 'd' || key == 'D' && isGameRunning == true){
    currentBlock.Right();
  }
  if (key == 'a' || key == 'A' && isGameRunning == true){
    currentBlock.Left();
  }
  if (key == 's' || key == 'S' && isGameRunning == true){
    currentBlock.Down();
  }
}

void reset(){
  mode = 0;
  isGameRunning = false; 
  setup();
}
