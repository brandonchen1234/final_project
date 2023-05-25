public class Blocks{
  //attritubes
  color c; 
  PVector[][] positions;
  PVector[] currentPosition;
  int positionIndex;
  
  public Blocks(color c, PVector[][] positions){
    this.c = c; 
    this.positions = positions; 
    currentPosition = positions[0];
    positionIndex = 0;
  }
  
  public PVector[] getPositions(){
    return currentPosition;
  }
  
  public color getColor(){
    return c;
  }
  
  public void Rotate(){
    currentPosition = positions[positionIndex++];
    if (positionIndex > 3)
      positionIndex = 0;
  }
  
  public void Left(){
    for (int i = 0; i < positions.length; i++){
      for (int f = 0; f < positions[i].length; f++){
        positions[i][f].x -= 40;
      }
    }
  }
  
  public void Right(){
    for (int i = 0; i < positions.length; i++){
      for (int f = 0; f < positions[i].length; f++){
        positions[i][f].x += 40;
      }
    }
  }
  
  public void Down(){
    for (int i = 0; i < positions.length; i++){
      for (int f = 0; f < positions[i].length; f++){
        positions[i][f].y += 40;
      }
    }
  }
}
