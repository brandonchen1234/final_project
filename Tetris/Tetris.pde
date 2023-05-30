//attributes 
private int mode = 0; 
private boolean isGameRunning = false;
private Blocks currentBlock;
private Blocks currentBlock2;
private int size = 40; 
private int x = 0;
private int y = 0;

//square
PVector[][] OPositions = { {new PVector(x, y), new PVector(x + size, y), new PVector(x, y + size), new PVector(x + size, y + size)}, 
                          {new PVector(x, y), new PVector(x + size, y), new PVector(x, y + size), new PVector(x + size, y + size)},
                          {new PVector(x, y), new PVector(x + size, y), new PVector(x, y + size), new PVector(x + size, y + size)},
                          {new PVector(x, y), new PVector(x + size, y), new PVector(x, y + size), new PVector(x + size, y + size)}
                        };
Blocks OBlock = new Blocks(color(255,255,0), OPositions);

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
                          {new PVector(x - size, y), new PVector(x + size, y + size), new PVector(x, y), new PVector(x + size, y)},
                          {new PVector(x - size, y + size), new PVector(x, y - size), new PVector(x, y), new PVector(x, y + size)}
                        };
Blocks JBlock = new Blocks(color(0,0,255), Jpositions);

//S block
PVector[][] Spositions = { {new PVector(x + size, y), new PVector(x, y), new PVector(x, y + size), new PVector(x - size, y + size)}, 
                          {new PVector(x, y - size), new PVector(x, y), new PVector(x + size, y + size), new PVector(x + size, y)},
                          {new PVector(x + size, y - size), new PVector(x, y - size), new PVector(x, y), new PVector(x - size, y)},
                          {new PVector(x - size, y - size), new PVector(x - size, y), new PVector(x, y + size), new PVector(x , y)}
                        };
Blocks SBlock = new Blocks(color(0,255,0), Spositions);
                        
//Z block
PVector[][] Zpositions = { {new PVector(x + size, y), new PVector(x, y), new PVector(x, y - size), new PVector(x - size, y - size)}, 
                          {new PVector(x, y + size), new PVector(x, y), new PVector(x + size, y - size), new PVector(x + size, y)},
                          {new PVector(x + size, y + size), new PVector(x, y + size), new PVector(x, y), new PVector(x - size, y)},
                          {new PVector(x - size, y + size), new PVector(x - size, y), new PVector(x, y - size), new PVector(x , y)}
                        };  
Blocks ZBlock = new Blocks(color(255,0,0), Zpositions);

//I block
PVector[][] Ipositions = { {new PVector(x - 2 * size, y - size), new PVector(x - size, y - size), new PVector(x, y - size), new PVector(x + size, y - size)}, 
                          {new PVector(x, y - 2 * size), new PVector(x, y - size), new PVector(x, y), new PVector(x, y + size)},
                          {new PVector(x - 2 * size, y), new PVector(x - size, y), new PVector(x, y), new PVector(x + size, y)},
                          {new PVector(x - size, y - 2 * size), new PVector(x - size, y - size), new PVector(x - size, y), new PVector(x - size, y + size)}
                        };
Blocks IBlock = new Blocks(color(0,255,255), Ipositions);

//T block
PVector[][] Tpositions = { {new PVector(x - size, y), new PVector(x, y), new PVector(x + size, y), new PVector(x, y - size)}, 
                          {new PVector(x, y - size), new PVector(x, y), new PVector(x, y + size), new PVector(x + size, y)},
                          {new PVector(x, y + size), new PVector(x - size, y), new PVector(x, y), new PVector(x + size, y)},
                          {new PVector(x - size, y), new PVector(x, y - size), new PVector(x, y), new PVector(x, y + size)}
                        };
Blocks TBlock = new Blocks(color(128,0,128), Tpositions);

//create an array of blocks
Blocks[] blocks = {OBlock, LBlock, JBlock, SBlock, ZBlock, IBlock, TBlock};

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
   currentBlock2 = blocks[(int)random(0, 7)];
 }
 
 currentBlock = blocks[(int)random(0, 7)];
}

void draw() {
  if (isGameRunning == true){
    if (mode == 1)
      SinglePlayerGrid();
    
    if (mode == 2){
      MultiplayerGrid();
    }
    
    if (mode == 1){
      for (PVector position: currentBlock.getPositions()){
          fill(currentBlock.getColor());
          square(position.x + 600, position.y + 80, 40);
      }
    }
    
    if (mode == 2){
      for (PVector position: currentBlock.getPositions()){
          fill(currentBlock.getColor());
          square(position.x + 160, position.y + 80, 40);
      }
      for (PVector position: currentBlock2.getPositions()){
        fill(currentBlock2.getColor());
        square(position.x + 960, position.y + 80, 40);
      }
    }
    
    if (frameCount % 90 == 0){
     currentBlock.Down();    
     if (mode == 2)
       currentBlock2.Down();
    }
  }
}


//temporary method for debugging

private void SinglePlayerGrid() {
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

private void MultiplayerGrid() {
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
  
  if (mode == 2){
    if (keyCode == UP && isGameRunning == true){
      currentBlock2.Rotate();
    }
    if (keyCode == RIGHT && isGameRunning == true){
      currentBlock2.Right();
    }
    if (keyCode == LEFT && isGameRunning == true){
      currentBlock2.Left();
    }
    if (keyCode == DOWN && isGameRunning == true){
      currentBlock2.Down();
    }
  }
}

private void reset(){
  mode = 0;
  isGameRunning = false; 
  setup();
}
