//
// handle mouse button and keyboard input here
//

// mouse button presed event
void mousePressed(){
  for(int i=0; i<objectCount; i++){
    qbi[i].pressed();
  }
}

// mouse button release event
void mouseReleased(){
  for(int i=0; i<objectCount; i++){
     qbi[i].released(); 
  }
}
