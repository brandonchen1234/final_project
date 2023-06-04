public class Grid{  
  private color[][] colorGrid = new color[24][10];
  private int[][] grid = new int[24][10];
  
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
  
  private boolean check(Blocks block){
    boolean stay = false; 
        
    for (PVector square: block.getPosition()){
      if (square.y > 800){
        stay = true;
      }
    }
      
    for (PVector position : block.getPosition()){
      if (grid[(int)position.y / 40 + 2][(int)position.x / 40 + 4] != 0){
        stay = true;
      }
    }
    
    if (stay == true){
      for (PVector position : block.getPosition()){
        grid[(int)position.y / 40 + 2][(int)position.x / 40 + 4] = 1;
        colorGrid[(int)position.y / 40 + 2][(int)position.x / 40 + 4] = block.getColor();
      }
    }
  return stay; 
  }
}
