public class Blocks{
  //attritubes
  private color c; 
  private PVector[][] positions;
  private PVector[] currentPosition;
  private int positionIndex;
  
  public Blocks(color c, PVector[][] positions){
    this.c = c; 
    this.positions = positions; 
    currentPosition = positions[0];
    positionIndex = 0;
  }
  
  private PVector[] getPositions(){
    return currentPosition;
  }
  
  private PVector getPosition(){
    return currentPosition[positionIndex];
  }
  
  private color getColor(){
    return c;
  }
  
  private void Rotate(){
    currentPosition = positions[positionIndex++];
    if (positionIndex > 3)
      positionIndex = 0;
  }
  
  private void Left(){
    for (int i = 0; i < positions.length; i++){
      for (int f = 0; f < positions[i].length; f++){
        positions[i][f].x -= 40;
      }
    }
  }
  
  private void Right(){
    for (int i = 0; i < positions.length; i++){
      for (int f = 0; f < positions[i].length; f++){
        positions[i][f].x += 40;
      }
    }
  }
  
  private void Down(){
    for (int i = 0; i < positions.length; i++){
      for (int f = 0; f < positions[i].length; f++){
        positions[i][f].y += 40;
      }
    }
  }
}
