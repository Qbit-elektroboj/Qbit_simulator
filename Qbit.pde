//
// add qbit logic on bottom of this page
//
// qbit class 
class Qbit{
 // class variables
 
 int xpos;
 int ypos;
 int id;
 int x;
 int y;
 boolean over;
 boolean move;
 boolean pressed;
 boolean moved;
 boolean live;
 int[] mapList = new int[4];
 // class constructor
 Qbit(int _xpos, int _ypos, int _id){
   xpos = _xpos;
   ypos = _ypos;
   id = _id; 
   over = false;
   move = false;
   pressed = false;
   moved = true;
   live = false;
   for(int i=0; i<4; i++)
     this.mapList[i] = -1;
 }
 
 // class basic methods
 
 void display(){
   if (live) fill (255,0,0,100);
   else fill(255,255,255,200);
  rect(xpos+padding/2, ypos+padding/2, size, size, 2); 
 }
 
 void update(){
   if(over){
     for(int i=0; i<4; i++)
       if(this.mapList[i] != -1) qbi[this.mapList[i]].live = true;
   }
   else
   {
    for(int i=0; i<4; i++)
     if(this.mapList[i] != -1) qbi[this.mapList[i]].live = false; 
   }
  if(move){
     releaseMap();
     xpos = mouseX-grid/2;
     ypos = mouseY-grid/2;
     wallColision();
     moved = true;
  } 
  else {
    
    snap();
    if(moved){
      setMap();
      moved = false;
    }
  }
  if((overThis() || move) && !overOther()){
    over = true; 
  }
  else over = false;
  
 }
 // mouse action methods
 void pressed(){
  pressed = true ;
  if(over) move = true;
  else move = false;
 }
 
 void released(){
   move = false;
   pressed = false;
 }
 
 // colision handlers
 void wallColision(){
    if(xpos < grid) xpos = grid;
    if(xpos > width-size*2) xpos = width - 2*size;
    if(ypos < grid) ypos = grid;
    if(ypos > height-size*2 ) ypos = height - 2*size; 
 }
 //mouse position methods
 boolean overThis(){
   float temp_xpos = mouseX-grid/2;
   float temp_ypos = mouseY-grid/2;
   // if mouse is inside defined box
   if ((temp_xpos > xpos-size/2) && (temp_xpos < xpos+size/2) && (temp_ypos > ypos-size/2) && (temp_ypos < ypos+size/2)) return true;
   // else it is not inside defined box
   else return false; 
 }
 
 boolean overOther(){
   for(int i=0; i<objectCount; i++){
    if(i != id)
      if(qbi[i].over == true)
        return true;
   }
  return false; 
 }
   // snap the qube to the grid defined in config file ( snap after positioning)
 void snap(){
   if(xpos%grid < grid/2) xpos -= xpos%grid;
   else xpos += grid-xpos%grid;
   if(ypos%grid < grid/2) ypos -= ypos%grid;
   else ypos += grid-ypos%grid;
 }
 // mapping methods
 void releaseMap(){
   map[this.x][this.y] = -1;
   for(int i=0; i<4; i++){
     if (this.mapList[i] != -1) qbi[this.mapList[i]].mapList[(i+2)%4] = -1;
     this.mapList[i] = -1;
   }
 }
 void setMap(){
   x = xpos/grid;
   y = ypos/grid;
   map[this.x][this.y] = id;
   if (map[this.x-1][this.y] != -1) this.mapList[3] = map[this.x-1][this.y];
   if (map[this.x+1][this.y] != -1) this.mapList[1] = map[this.x+1][this.y];
   if (map[this.x][this.y-1] != -1) this.mapList[0] = map[this.x][this.y-1];
   if (map[this.x][this.y+1] != -1) this.mapList[2] = map[this.x][this.y+1];
   
   for(int i=0; i<4; i++)
     if (this.mapList[i] != -1) qbi[this.mapList[i]].mapList[(i+2)%4] = -1;
     
 
 }
 // class logic methods
}
