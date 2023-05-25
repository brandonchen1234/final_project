public class Movement{
  //attributes
  int size = 0; 
  int x = 0;
  int y = 0;
  Blocks currentBlock;
  
  //square
  PVector[][] positions = { {new PVector(x, y), new PVector(x + size, y), new PVector(x, y + size), new PVector(x + size, y + size)}, 
                            {new PVector(x, y), new PVector(x + size, y), new PVector(x, y + size), new PVector(x + size, y + size)},
                            {new PVector(x, y), new PVector(x + size, y), new PVector(x, y + size), new PVector(x + size, y + size)},
                            {new PVector(x, y), new PVector(x + size, y), new PVector(x, y + size), new PVector(x + size, y + size)}
                          };
  Blocks squareBlock = new Blocks(color(255,255,0), positions);
  
  void setup() {
    currentBlock = squareBlock;
      for (PVector[] position: currentBlock.getPositions()){
        for (PVector pos: position){
          fill(currentBlock.getColor());
          square(pos.x, pos.y, 40);
        }
     }
  }
     
  void draw(){
   for (PVector[] position: currentBlock.getPositions()){
    for (PVector pos: position){
      fill(currentBlock.getColor());
      square(pos.x, pos.y, 40);
    }
   }
  }
  
  void keyPressed(){
    if (key == 'W' && isGameRunning == true){
       squareBlock.Rotate();
    }
  }
}
