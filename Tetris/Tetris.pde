import java.io.*;

//attributes 
private int mode = 0; 
private boolean isGameRunning = false;
private Blocks currentBlock;
private Blocks currentBlock2;
private int size = 40; 
private int x = 0;
private int y = 0;
private Grid TetrisGrid = new Grid();

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
   TetrisGrid.SinglePlayerGrid();
 }
 
 if (mode == 2){
   TetrisGrid.MultiplayerGrid();
   currentBlock2 = Blocks.copy(blocks[(int)random(0, 7)]);
 }
 
 currentBlock = Blocks.copy(blocks[(int)random(0, 7)]);
}

void draw() {
  if (isGameRunning == true){
    if (mode == 1)
      TetrisGrid.SinglePlayerGrid();
    
    if (mode == 2){
      TetrisGrid.MultiplayerGrid();
    }
    
    if (mode == 1){
      for (PVector position: currentBlock.getPosition()){
        fill(currentBlock.getColor());
        square(position.x + 560, position.y + 80, 40);
     }
    }
    
    if (mode == 2){
      for (PVector position: currentBlock.getPosition()){
        fill(currentBlock.getColor());
        square(position.x + 160, position.y + 80, 40);
      }
      for (PVector position: currentBlock2.getPosition()){
        fill(currentBlock2.getColor());
        square(position.x + 960, position.y + 80, 40);
      }
    }
    
//    if (frameCount % 90 == 0){
//      currentBlock.down();    
//     if (mode == 2)
//      currentBlock2.down();
//    }
    
    if (mode == 1){
      if (TetrisGrid.check(currentBlock) == true){
        currentBlock = Blocks.copy(blocks[(int)random(0, 7)]); 
      }
    }
  }
}

private boolean rotateBorder(Blocks block, int lowerx, int upperx){
  block.rotate();
  PVector[] position = block.getPosition();
  for (PVector square: position){
    if (square.x < lowerx){
      block.rotate();
      block.rotate();
      block.rotate();
      return false;
    }
    if (square.x > upperx){
      block.rotate();
      block.rotate();
      block.rotate();
      return false; 
    }
    if (square.y > 800){
      block.rotate();
      block.rotate();
      block.rotate();
      return false;
    }
  }
  block.rotate();
  block.rotate();
  block.rotate();
  return true;
}

private boolean leftBorder(Blocks block, int lowerx, int upperx){
  block.left();
  PVector[] position = block.getPosition();
  for (PVector square: position){
    if (square.x < lowerx){
      block.right();
      return false;
    }
    if (square.x > upperx){
      block.right();
      return false; 
    }
  }
  if (mode == 1){
    if (TetrisGrid.checkLeft(block) == false){
      block.right();
      return false;
    }
  }
  block.right();
  return true;
}

private boolean rightBorder(Blocks block, int lowerx, int upperx){
  block.right();
  PVector[] position = block.getPosition();
  for (PVector square: position){
    if (square.x < lowerx){
      block.left();
      return false;
    }
    if (square.x > upperx){
      block.left();
      return false; 
    }
  }
  if (mode == 1){
    if (TetrisGrid.checkRight(block) == false){
      block.left();
      return false;
    }
  }
  block.left();
  return true;
}

private boolean downBorder(Blocks block){
  PVector[] position = block.getPosition();
  for (PVector square: position){
    if (square.y > 800)
      return false;
  }
  return true;
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
  
  if (mode == 1){
    if ((key == 'w' || key == 'W') && isGameRunning == true && rotateBorder(currentBlock, -160, 200)){
      currentBlock.rotate();
    }
    if ((key == 'd' || key == 'D') && isGameRunning == true && rightBorder(currentBlock, -160, 200)){
      currentBlock.right();
    }
    if ((key == 'a' || key == 'A') && isGameRunning == true && leftBorder(currentBlock, -160, 200)){
      currentBlock.left();
    }
    if ((key == 's' || key == 'S') && isGameRunning == true && downBorder(currentBlock)){
      currentBlock.down();
    }
  }
  
  if (mode == 2){
    if ((key == 'w' || key == 'W') && isGameRunning == true && rotateBorder(currentBlock, -160, 200)){
      currentBlock.rotate();
    }
    if ((key == 'd' || key == 'D') && isGameRunning == true && rightBorder(currentBlock, -160, 200)){
      currentBlock.right();
    }
    if ((key == 'a' || key == 'A') && isGameRunning == true && leftBorder(currentBlock, -160, 200)){
      currentBlock.left();
    }
    if ((key == 's' || key == 'S') && isGameRunning == true && downBorder(currentBlock)){
      currentBlock.down();
    }
    if (keyCode == UP && isGameRunning == true && rotateBorder(currentBlock2, -160, 200)){
      currentBlock2.rotate();
    }
    if (keyCode == RIGHT && isGameRunning == true && rightBorder(currentBlock2, -160, 200)){
      currentBlock2.right();
    }
    if (keyCode == LEFT && isGameRunning == true && leftBorder(currentBlock2, -160, 200)){
      currentBlock2.left();
    }
    if (keyCode == DOWN && isGameRunning == true && downBorder(currentBlock2)){
      currentBlock2.down();
    }
  }
}

private void reset(){
  mode = 0;
  isGameRunning = false; 
  setup();
}
