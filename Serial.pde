void serialEvent(Serial p) {
  
  String message = p.readStringUntil('\n'); // read aline of serial data
  
 // println(message);
  
  if (message != null) {
    
    
    String [] SerialDataArr  = splitTokens(message, "\t"); // Split the message at '\t' or '\n'
    //println("SerialDataArr.length: " + SerialDataArr.length);
    
    if(SerialDataArr.length > 2) {
      
      for (int i = 0; i<5; i++) {
        float input = float(SerialDataArr[i]);
        if(fingerMin[i] > input) {
          fingerMin[i] = input;
        }
        if(fingerMax[i] < input) {
          fingerMax[i] = input;
        }
        finger[i] = (float)( map(input, fingerMin[i], fingerMax[i], 1.6, 0.0) );
      }
      
      fingerJoynt1[0] = finger[0];
      fingerJoynt2and3[0] = finger[0];
      
      fingerJoynt1[1] = finger[1];
      fingerJoynt2and3[1] = finger[1];
      
      fingerJoynt1[2] = finger[2];
      fingerJoynt2and3[2] = finger[2];
      
      fingerJoynt1[3] = finger[3];
      fingerJoynt2and3[3] = finger[3];
      
      fingerJoynt1[4] = finger[4];
      fingerJoynt2and3[4] = finger[4];
      
      println(fingerJoynt1[0]);
    }
    
    loop();
  }
}