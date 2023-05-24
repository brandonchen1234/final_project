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
  
  public void Rotate(Blocks block){
    currentPosition = positions[positionIndex++];
    if (positionIndex > 3)
      positionIndex = 0;
  }
  
  public void Left(){
    for (PVector[] position: positions)
      for (PVector pos: positions)
        pos.x -= size;
  }
  
  public void Right(){
    for (PVector[] position: positions)
      for (PVector pos: positions)
        pos.x -= size;
  }
}
