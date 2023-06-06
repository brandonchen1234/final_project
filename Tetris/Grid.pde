public class Grid{  
  private color[][] colorGrid = new color[24][10];
  private int[][] grid = new int[24][10];
  private color[][] colorGrid2 = new color[24][10];
  private int[][] grid2 = new int[24][10];
  private int score = 0;
  public int highestScore = 0; 
  private int score2 = 0;
  
  public Grid(){
    for (int i = 0; i < 24; i++){
      for (int f = 0; f < 10; f++){
        grid[i][f] = 0;
      }
    }
  }

  private void SinglePlayerGrid() {
    int x = 0;
    int y = 0;
    int size = 40; 
    background(255);
    if (y < height){
      for (int curRow = 0; curRow < 24; curRow++){
        for (int curCol = 0; curCol < 10; curCol++){
          fill(colorGrid[curRow][curCol]);
          stroke(255);
          square(size * 10  + x, y, size); 
          x += size;
        }
        x = 0;
        y += size;
      }
    }
    fill(0);
    textSize(30);
    text("Score: " + score, 10, 40);
    text("Next Blocks: ", 10, 100);
    fill(255);
    stroke(0);
    rect(20, 140, 200, 160); 
    rect(20, 300, 200, 160); 
    rect(20, 460, 200, 160); 
    fill(0);
    text("Highest Score: " + highestScore, 10, 700);
  }
  
  private void MultiplayerGrid() {
    int x = 0;
    int y = 0;
    int size = 40; 
    background(255);
    if (y < height){
      for (int curRow = 0; curRow < height/size; curRow++){
        for (int curCol = 0; curCol < 10; curCol++){
          fill(colorGrid[curRow][curCol]);
          stroke(255);
          square(x, y, size); 
          x += size;
        }
        x = 0;
        y += size;
      }
    }
    fill(255);
    stroke(0);
    rect(440, 140, 120, 80); 
    rect(440, 220, 120, 80); 
    rect(440, 300, 120, 80); 
    
    x = 0; 
    y = 0;
    if (y < height){
      for (int curRow = 0; curRow < height/size; curRow++){
        for (int curCol = 0; curCol < 10; curCol++){
          fill(colorGrid2[curRow][curCol]);
          stroke(255);
          square(size * 20 + x, y, size); 
          x += size;
        }
        x = 0;
        y += size;
      }
    }
    fill(255);
    stroke(0);
    rect(440, 615, 120, 80); 
    rect(440, 695, 120, 80); 
    rect(440, 775, 120, 80); 
    
    fill(0);
    rect(400, 478, 400, 4);
    textSize(52);
    text("Player 1: ", 500, 50);
    textSize(30);
    text("Score: " + score, 400, 90);
    text("Next Blocks: ", 400, 130);
    textSize(52);
    text("Player 2:", 500, 530);
    textSize(30);
    text("Score: " + score2, 400, 570);
    text("Next Blocks: ", 400, 610);
  }
  
  private boolean check(Blocks block){
    boolean stay = false; 
        
    for (PVector square: block.getPosition()){
      if (square.y > 800 && grid[(int)square.y / 40 + 2][(int)square.x / 40 + 4] == 0){
        stay = true;
        for (PVector position : block.getPosition()){
          grid[(int)position.y / 40 + 2][(int)position.x / 40 + 4] = 1;
          colorGrid[(int)position.y / 40 + 2][(int)position.x / 40 + 4] = block.getColor();
        }
        return stay;
      }
    }
      
    for (PVector position : block.getPosition()){
      if (grid[(int)position.y / 40 + 3][(int)position.x / 40 + 4] != 0){
        stay = true;
      }
    }
    
    if (stay == true){
      for (PVector position : block.getPosition()){
        grid[(int)position.y / 40 + 2][(int)position.x / 40 + 4] = 1;
        colorGrid[(int)position.y / 40 + 2][(int)position.x / 40 + 4] = block.getColor();
      }
    }
    
    boolean isThereRow = false;
    for (int i = 23; i > 0; i--){
      for (int f = 0; f < 10; f++){
        if (grid[i][f] == 0){
          isThereRow = true;
        }
      }
      if (isThereRow == false){
        score += 100;
        if (score > highestScore)
          highestScore = score; 
        for (int row = i; row > 0; row--){
          for (int col = 0; col < 10; col++){
            grid[row][col] = grid [row - 1][col];
            colorGrid[row][col] = colorGrid[row - 1][col];
          }
        }
      }
      isThereRow = false;
    }
    return stay; 
  }
  
  private boolean checkBelow(Blocks block){
    for (PVector square: block.getPosition()){
      if (square.y > 800 && grid[(int)square.y / 40 + 2][(int)square.x / 40 + 4] == 0){
        return true;
      }
    }
      
    for (PVector position : block.getPosition()){
      if (grid[(int)position.y / 40 + 3][(int)position.x / 40 + 4] != 0){
        return true;
      }
    }
    return false; 
  }
  
  private boolean checkGameEnd(){
    boolean gameEnd = false;
      for (int i = 3; i > 0; i--){
        for (int f = 0; f < 10; f++){
          if (grid[i][f] != 0){
            gameEnd = true;
          }
        }
      }
      if (gameEnd == true)
        return true;
      return false;
  }
      
  private boolean checkSurroundings(Blocks block){
    for (PVector square: block.getPosition()){
      if ((int)square.x / 40 + 4 < 10){
        if (grid[(int)square.y / 40 + 2][(int)square.x / 40 + 4] != 0){
          return false;
        }
      }
    }
    return true;
  }
  
  private boolean check2(Blocks block){
    boolean stay = false; 
        
    for (PVector square: block.getPosition()){
      if (square.y > 800 && grid2[(int)square.y / 40 + 2][(int)square.x / 40 + 4] == 0){
        stay = true;
        for (PVector position : block.getPosition()){
          grid2[(int)position.y / 40 + 2][(int)position.x / 40 + 4] = 1;
          colorGrid2[(int)position.y / 40 + 2][(int)position.x / 40 + 4] = block.getColor();
        }
        return stay;
      }
    }
      
    for (PVector position : block.getPosition()){
      if (grid2[(int)position.y / 40 + 3][(int)position.x / 40 + 4] != 0){
        stay = true;
      }
    }
    
    if (stay == true){
      for (PVector position : block.getPosition()){
        grid2[(int)position.y / 40 + 2][(int)position.x / 40 + 4] = 1;
        colorGrid2[(int)position.y / 40 + 2][(int)position.x / 40 + 4] = block.getColor();
      }
    }
    
    boolean isThereRow = false;
    for (int i = 23; i > 0; i--){
      for (int f = 0; f < 10; f++){
        if (grid2[i][f] == 0){
          isThereRow = true;
        }
      }
      if (isThereRow == false){
        score2 += 100;
        for (int row = i; row > 0; row--){
          for (int col = 0; col < 10; col++){
            grid2[row][col] = grid2 [row - 1][col];
            colorGrid2[row][col] = colorGrid2[row - 1][col];
          }
        }
      }
      isThereRow = false;
    }
    return stay; 
  }
  
  private boolean checkBelow2(Blocks block){
    for (PVector square: block.getPosition()){
      if (square.y > 800 && grid2[(int)square.y / 40 + 2][(int)square.x / 40 + 4] == 0){
        return true;
      }
    }
      
    for (PVector position : block.getPosition()){
      if (grid2[(int)position.y / 40 + 3][(int)position.x / 40 + 4] != 0){
        return true;
      }
    }
    return false; 
  }
  
  private boolean checkGameEnd2(){
    boolean gameEnd = false;
      for (int i = 3; i > 0; i--){
        for (int f = 0; f < 10; f++){
          if (grid2[i][f] != 0){
            gameEnd = true;
          }
        }
      }
      if (gameEnd == true)
        return true;
      return false;
  }
  
  private boolean checkSurroundings2(Blocks block){
    for (PVector square: block.getPosition()){
      if ((int)square.x / 40 + 4 < 10){
        if (grid2[(int)square.y / 40 + 2][(int)square.x / 40 + 4] != 0){
          return false;
        }
      }
    }
    return true;
  }
  
  private void reset(){
    for (int i = 0; i < 24; i++){
      for (int f = 0; f < 10; f++){
        grid[i][f] = 0;
        grid2[i][f] = 0;
        colorGrid[i][f] = 0;
        colorGrid2[i][f] = 0;
        score = 0; 
        score2 = 0;
      }
    }
  }
}
