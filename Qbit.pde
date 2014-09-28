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
 int thisMap;
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
     mapList[i] = -1;
 }
 
 // class basic methods
 
 void display(){
   if(move) update = true;
    if(over){
      fill(0);
        text(mapList[0], mouseX, mouseY-20);
       text(mapList[1], mouseX+20, mouseY);
       text(mapList[2], mouseX, mouseY + 30);
       text(mapList[3], mouseX - 20, mouseY);
       text(x, mouseX+10, mouseY+10);
       text(y, mouseX + 10, mouseY-10);
       fill(255);  
    }
     if (live) fill (255,0,0,100);
     else fill(255,255,255,200);
     rect(xpos+padding/2, ypos+padding/2, size, size, 2); 
   
    
  
 }
 
 void update(){
   if(over){
     for(int i=0; i<4; i++)
       if(mapList[i] != -1) qbi[mapList[i]].live = true;
        
   
  
  }
   else
   {
    for(int i=0; i<4; i++)
     if(mapList[i] != -1) qbi[mapList[i]].live = false; 
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
   setMap();
 }
 // mapping methods
 void releaseMap(){
   map[x][y] = -1;
   for(int i=0; i<4; i++){
     if (mapList[i] != -1) qbi[mapList[i]].mapList[(i+2)%4] = -1;
     mapList[i] = -1;
   }
 }
 void setMap(){
   x = xpos/grid;
   y = ypos/grid;
   map[x][y] = id;
   thisMap = map[x][y];
   if (map[x-1][y] != -1) mapList[3] = map[x-1][y];
   if (map[x+1][y] != -1) mapList[1] = map[x+1][y];
   if (map[x][y-1] != -1) mapList[0] = map[x][y-1];
   if (map[x][y+1] != -1) mapList[2] = map[x][y+1];
   
   for(int i=0; i<4; i++)
     if (mapList[i] != -1) qbi[mapList[i]].mapList[(i+2)%4] = id;
     
 
 }
 // class logic methods
}
