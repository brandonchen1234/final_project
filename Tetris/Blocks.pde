public static class Blocks{
  //attritubes
  private color c; 
  private PVector[][] positions;
  private PVector[] currentPosition;
  private int positionIndex;
  
  public Blocks(){}
  
  public Blocks(color c, PVector[][] positions){
    this.c = c; 
    this.positions = positions; 
    currentPosition = positions[0];
    positionIndex = 0;
  }
  
  private PVector[] getPosition(){
    return currentPosition;
  }
  
  private color getColor(){
    return c;
  }
  
  private void rotate(){
    positionIndex++;
    if (positionIndex > 3)
      positionIndex = 0;
    currentPosition = positions[positionIndex];
  }
  
  private void left(){
    for (int i = 0; i < positions.length; i++){
      for (int f = 0; f < positions[i].length; f++){
        positions[i][f].x -= 40;
      }
    }
  }
  
  private void right(){
    for (int i = 0; i < positions.length; i++){
      for (int f = 0; f < positions[i].length; f++){
        positions[i][f].x += 40;
      }
    }
  }
  
  private void down(){
    for (int i = 0; i < positions.length; i++){
      for (int f = 0; f < positions[i].length; f++){
        positions[i][f].y += 40;
      }
    }
  }
  
  private static Blocks copy(Blocks block){
      Blocks t = new Blocks();
      t.c = block.c;
      t.positions = copy(block.positions); 
      t.currentPosition = t.positions[0];
      t.positionIndex = block.positionIndex; 
    return t;
  }
  
  private static PVector[][] copy(PVector[][] positions){
    PVector[][] copy = new PVector[4][4];
    for (int i = 0; i < 4; i++){
      for (int f = 0; f < 4; f++){
        copy[i][f] = positions[i][f].copy();
      }
    }
    return copy;
  }
}
