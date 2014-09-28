


// global arrays
int[] funct = new int[objectCount];

Qbit[] qbi = new Qbit[objectCount];

// set size constants
int spacing =  padding + size;
int hsize = horizontalCount*(size+padding)+2*size;
int vsize = verticalCount*(size+padding)+2*size;

// set grid origin point
int x = padding/2;
int y = padding/2;

// triger
boolean noGo = true;
// generate objects
void generate(){
   for(int i=0; i<objectCount ; i++){
      qbi[i] = new Qbit(x(i), y ,i );
   } 
}
// arange objects in grid
int x(int i){
  if ( ((i+1)%horizontalCount) == 1 ){
    x = padding/2;
    y += spacing;
  }
  x += spacing;
  return x;
}

void normalMath(){
  if (objectCount > horizontalCount * verticalCount) objectCount = horizontalCount*verticalCount;
}
