int size = 0; 
int x = 0;
int y = 0;

//square
PVector[][] positions = { {new PVector(x, y), new PVector(x + size, y), new PVector(x, y + size), new PVector(x + size, y + size)}, 
                          {new PVector(x, y), new PVector(x + size, y), new PVector(x, y + size), new PVector(x + size, y + size)},
                          {new PVector(x, y), new PVector(x + size, y), new PVector(x, y + size), new PVector(x + size, y + size)},
                          {new PVector(x, y), new PVector(x + size, y), new PVector(x, y + size), new PVector(x + size, y + size)}
                        };
Blocks squareBlock = new Blocks(color(255,255,0), positions);
