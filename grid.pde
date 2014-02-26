//
// generate grid lines --> ./|\. training wheels 
//

void makeGrid(){ 
 for(int i=0; i<verticalCount+2; i++){
   line(0,i*grid, width, i*grid);
 } 
  for(int i=0; i<horizontalCount+2; i++){
   line(i*grid, 0 , i*grid, height); 
  }
}
