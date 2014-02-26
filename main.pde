//
// main function call that sets up grid and calls all other "int main()" 
//  
void setup(){
   normalMath();
   size(hsize, vsize);
   generate();
}

void draw(){
 background(100);
 makeGrid();
 for(int i=0; i<objectCount; i++){
   qbi[i].update();
   qbi[i].display();
  }
}
