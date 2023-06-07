import java.io.*;

//attributes 
private int mode = 0; 
private boolean isGameRunning = false;
private Blocks currentBlock;
private Blocks nextBlock;
private Blocks nextNextBlock;
private Blocks nextNextNextBlock;
private Blocks outlineBlock;
private Blocks currentBlock2;
private Blocks nextBlock2;
private Blocks nextNextBlock2;
private Blocks nextNextNextBlock2;
private int size = 40; 
private int x = 0;
private int y = 0;
private Grid TetrisGrid = new Grid();
private String playerWin; 

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
   nextBlock2 = Blocks.copy(blocks[(int)random(0, 7)]);
   nextNextBlock2 = Blocks.copy(blocks[(int)random(0, 7)]);
   nextNextNextBlock2 = Blocks.copy(blocks[(int)random(0, 7)]);
 }
 
 currentBlock = Blocks.copy(blocks[(int)random(0, 7)]);
 nextBlock = Blocks.copy(blocks[(int)random(0, 7)]);
 nextNextBlock = Blocks.copy(blocks[(int)random(0, 7)]);
 nextNextNextBlock = Blocks.copy(blocks[(int)random(0, 7)]);
 outlineBlock = Blocks.copy(currentBlock); 
}

void draw() {
  strokeWeight(2);
  if (isGameRunning == true){
    if (mode == 1)
      TetrisGrid.SinglePlayerGrid();
    
    if (mode == 2){
      TetrisGrid.MultiplayerGrid();
    }
    
    if (mode == 1){
      outlineBlock = Blocks.copy(currentBlock); 
      while (TetrisGrid.checkBelow(outlineBlock) == false){
        outlineBlock.down();
      }
      fill(0);
      strokeWeight(4);
      for (PVector position: outlineBlock.getPosition()){
       stroke(outlineBlock.getColor());
       square(position.x + 560, position.y + 80, 40);
      }
      stroke(255);
      strokeWeight(2);
      for (PVector position: currentBlock.getPosition()){
        fill(currentBlock.getColor());
        square(position.x + 560, position.y + 80, 40);
       }
       for (PVector position: nextBlock.getPosition()){
       fill(nextBlock.getColor());
       square(position.x + 120, position.y + 200, 40);
      }
      for (PVector position: nextNextBlock.getPosition()){
       fill(nextNextBlock.getColor());
       square(position.x + 120, position.y + 360, 40);
      }
      for (PVector position: nextNextNextBlock.getPosition()){
       fill(nextNextNextBlock.getColor());
       square(position.x + 120, position.y + 520, 40);
      }
    }
    
    if (mode == 2){
      outlineBlock = Blocks.copy(currentBlock); 
      while (TetrisGrid.checkBelow(outlineBlock) == false){
        outlineBlock.down();
      }
      fill(0);
      strokeWeight(4);
      for (PVector position: outlineBlock.getPosition()){
       stroke(outlineBlock.getColor());
       square(position.x + 160, position.y + 80, 40);
      }
      stroke(255);
      strokeWeight(2);
      for (PVector position: currentBlock.getPosition()){
        fill(currentBlock.getColor());
        square(position.x + 160, position.y + 80, 40);
      }
      for (PVector position: nextBlock.getPosition()){
       fill(nextBlock.getColor());
       square((position.x + 1000) / 2, (position.y + 350) / 2, 20);
      }
      for (PVector position: nextNextBlock.getPosition()){
       fill(nextNextBlock.getColor());
       square((position.x + 1000) / 2, (position.y + 500) /2, 20);
      }
      for (PVector position: nextNextNextBlock.getPosition()){
       fill(nextNextNextBlock.getColor());
       square((position.x + 1000) / 2, (position.y + 650) /2, 20);
      }
      
      outlineBlock = Blocks.copy(currentBlock2); 
      while (TetrisGrid.checkBelow2(outlineBlock) == false){
        outlineBlock.down();
      }
      fill(0);
      strokeWeight(4);
      for (PVector position: outlineBlock.getPosition()){
       stroke(outlineBlock.getColor());
       square(position.x + 960, position.y + 80, 40);
      }
      stroke(255);
      strokeWeight(2);
      for (PVector position: currentBlock2.getPosition()){
        fill(currentBlock2.getColor());
        square(position.x + 960, position.y + 80, 40);
      }
      for (PVector position: nextBlock2.getPosition()){
       fill(nextBlock2.getColor());
       square((position.x + 1000) / 2, (position.y + 1300) / 2, 20);
      }
      for (PVector position: nextNextBlock2.getPosition()){
       fill(nextNextBlock2.getColor());
       square((position.x + 1000) / 2, (position.y + 1450) /2, 20);
      }
      for (PVector position: nextNextNextBlock2.getPosition()){
       fill(nextNextNextBlock2.getColor());
       square((position.x + 1000) / 2, (position.y + 1600) /2, 20);
      }
    }
    
//    if (frameCount % 90 == 0){
//      currentBlock.down();    
//     if (mode == 2)
//      currentBlock2.down();
//    }
    
    if (mode == 1){
      if (TetrisGrid.check(currentBlock) == true){
        currentBlock = nextBlock;
        nextBlock = nextNextBlock;
        nextNextBlock = nextNextNextBlock;
        nextNextNextBlock = Blocks.copy(blocks[(int)random(0, 7)]); 
      }
      if (TetrisGrid.checkGameEnd() == true){
        reset();
        endScreen();
      }
    }
    
    if (mode == 2){
      if (TetrisGrid.check(currentBlock) == true){
        currentBlock = nextBlock;
        nextBlock = nextNextBlock;
        nextNextBlock = nextNextNextBlock;
        nextNextNextBlock = Blocks.copy(blocks[(int)random(0, 7)]); 
      }
      if (TetrisGrid.check2(currentBlock2) == true){
        currentBlock2 = nextBlock2;
        nextBlock2 = nextNextBlock2;
        nextNextBlock2 = nextNextNextBlock2;
        nextNextNextBlock2 = Blocks.copy(blocks[(int)random(0, 7)]); 
      }
    }
      if (TetrisGrid.checkGameEnd() == true){
        playerWin = "Player 2";
        reset();
        endScreenForMultiplayer();
      }
      if (TetrisGrid.checkGameEnd2() == true){
        playerWin = "Player 1";
        reset();
        endScreenForMultiplayer();
      }
  }
}

private boolean rotateBorder(Blocks block, int gridType, int lowerx, int upperx){
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
  if (gridType == 1){
    if (TetrisGrid.checkSurroundings(block) == false){
      block.rotate();
      block.rotate();
      block.rotate();
      return false;
    }
  }
  if (gridType == 2){
    if (TetrisGrid.checkSurroundings2(block) == false){
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

private boolean leftBorder(Blocks block, int gridType, int lowerx, int upperx){
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
  if (gridType == 1){
    if (TetrisGrid.checkSurroundings(block) == false){
      block.right();
      return false;
    }
  }
  if (gridType == 2){
    if (TetrisGrid.checkSurroundings2(block) == false){
      block.right();
      return false;
    }
  }
  block.right();
  return true;
}

private boolean rightBorder(Blocks block, int gridType, int lowerx, int upperx){
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
  if (gridType == 1){
    if (TetrisGrid.checkSurroundings(block) == false){
      block.left();
      return false;
    }
  }
  if (gridType == 2){
    if (TetrisGrid.checkSurroundings2(block) == false){
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
  
  if (key == '3' && isGameRunning == false){
    setup();
  }
  
  if ((key == 'q' || key == 'Q') && isGameRunning == true){
      while (downBorder(currentBlock) == true) {
        currentBlock.down();
      }
    }
  
  if ((key == 'n' || key == 'N') && isGameRunning == true){
    while (downBorder(currentBlock2) == true){
      currentBlock2.down();
    }
  }
  
  if (mode == 1){
    if ((key == 'w' || key == 'W') && isGameRunning == true && rotateBorder(currentBlock, 1, -160, 200)){
      currentBlock.rotate();
    }
    if ((key == 'd' || key == 'D') && isGameRunning == true && rightBorder(currentBlock, 1, -160, 200)){
      currentBlock.right();
    }
    if ((key == 'a' || key == 'A') && isGameRunning == true && leftBorder(currentBlock, 1, -160, 200)){
      currentBlock.left();
    }
    if ((key == 's' || key == 'S') && isGameRunning == true && downBorder(currentBlock)){
      currentBlock.down();
    }
  }
  
  if (mode == 2){
    if ((key == 'w' || key == 'W') && isGameRunning == true && rotateBorder(currentBlock, 1, -160, 200)){
      currentBlock.rotate();
    }
    if ((key == 'd' || key == 'D') && isGameRunning == true && rightBorder(currentBlock, 1, -160, 200)){
      currentBlock.right();
    }
    if ((key == 'a' || key == 'A') && isGameRunning == true && leftBorder(currentBlock, 1, -160, 200)){
      currentBlock.left();
    }
    if ((key == 's' || key == 'S') && isGameRunning == true && downBorder(currentBlock)){
      currentBlock.down();
    }
    if (keyCode == UP && isGameRunning == true && rotateBorder(currentBlock2, 2, -160, 200)){
      currentBlock2.rotate();
    }
    if (keyCode == RIGHT && isGameRunning == true && rightBorder(currentBlock2, 2, -160, 200)){
      currentBlock2.right();
    }
    if (keyCode == LEFT && isGameRunning == true && leftBorder(currentBlock2, 2, -160, 200)){
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
  TetrisGrid.reset();
  setup();
}

private void endScreen(){
  background(255);
  textSize(52);
  text("Game Over!", 440, 480);
  textSize(30);
  text("Highest Score: " + TetrisGrid.highestScore, 460, 530);
  text("To play again, press 1 for single player and 2 for multiplayer", 200, 580);
  text("To go back to the main menu, press 3", 330, 630);
}

private void endScreenForMultiplayer(){
  background(255);
  textSize(52);
  text(playerWin + " wins!", 440, 480);
  textSize(30);
  text("To play again, press 1 for single player and 2 for multiplayer", 260, 540);
  text("To go back to the main menu, press 3", 360, 590);
}
