void calculateJoynt() {
  //fingerJoynt1[0] = mouseX/100.0;
  //fingerJoynt2and3[0] = mouseY/100.0;
  
  gRotateX += gRotateXspeed;
  gRotateZ += gRotateZspeed;
  
  for (int i = 0; i<5; i++) {
    fingerJoynt1[i] += fingerJoynt1speed[i];
    
    if(fingerJoynt1[i] < 0) {
      fingerJoynt1[i] = 0;
    }
    if(fingerJoynt1[i]>1.5) {
      fingerJoynt1[i] = 1.5;
    }
    
    fingerJoynt2and3[i] += fingerJoynt2and3speed[i];
    
    if(fingerJoynt2and3[i] < 0) {
      fingerJoynt2and3[i] = 0;
    }
    if(fingerJoynt2and3[i]>1.5) {
      fingerJoynt2and3[i] = 1.5;
    }
  }
}