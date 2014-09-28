//
// main function call that sets up grid and calls all other "int main()" 
//  
void setup(){
   normalMath();
   size(hsize, vsize);
   generate();
   for (int i=0; i<verticalCount+2; i++)
     for (int j=0; j<horizontalCount+2; j++)
       map[i][j] = -1;
}

void draw(){
 
 background(100);
 makeGrid();
 for(int i=0; i<objectCount; i++){
   qbi[i].update();
   qbi[i].display();
  }
}
