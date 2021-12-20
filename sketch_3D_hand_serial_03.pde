import processing.serial.*;
Serial port;

float[] fingerJoynt1 = new float[5];
float[] fingerJoynt1speed = new float[5];
float[] fingerJoynt2and3 = new float[5];
float[] fingerJoynt2and3speed = new float[5];

float gRotateX = 0.83;
float gRotateY = 0;
float gRotateZ = 3.48;

float gRotateXspeed = 0.0;
float gRotateYspeed = 0;
float gRotateZspeed = 0;


float[] finger = new float[5];
float[] fingerMin = new float[5];
float[] fingerMax = new float[5];


void setup() {
  printArray(Serial.list());
  port = new Serial(this, Serial.list()[3], 38400);

  fullScreen(P3D);
  noStroke();

  for (int i = 0; i<5; i++) {
    fingerJoynt1[i] = 0.0;
    fingerJoynt2and3[i] = 0.0;
    fingerJoynt1speed[i] = 0.0;
    fingerJoynt2and3speed[i] = 0.0;
  }
}

void draw() {
  background(0);
  ambientLight(50, 50, 50);
  directionalLight(255, 255, 255, .1, .17, -0.5);

  calculateJoynt();

  translate(width / 2, height / 2, 550);
  println(mouseX, mouseY, 1.0 * mouseX/width);
  drawHand();
}

void drawHand() {
  //Base
  fill(#D69A50);
  //rotateZ(mouseX/100.0);
  //rotateX(mouseY/100.0);
  rotateZ(gRotateZ);
  rotateX(gRotateX);
  box(60, 10, 50);

  //Lillefinger
  translate(30, 0, 20);
  drawFinger(fingerJoynt1[0], fingerJoynt2and3[0], 13, 12);

  //Ringfinger
  translate(0, 0, -13);
  drawFinger(fingerJoynt1[1], fingerJoynt2and3[1], 18, 15);

  //Langemann
  translate(0, 0, -14);
  drawFinger(fingerJoynt1[2], fingerJoynt2and3[2], 20, 16);

  //Pekeringer
  translate(0, 0, -13);
  drawFinger(fingerJoynt1[3], fingerJoynt2and3[3], 17, 14);

  //Tommel
  translate(-55, 0, -7);
  rotateY(1.83);
  rotateX(-mouseX/100.0);  //0.64
  rotateZ(mouseY/100.0);
  drawFinger(fingerJoynt1[4], fingerJoynt2and3[4], 30, 15);
}

void drawFinger(float Joynt1, float Joynt2and3, int fingerLength1, int fingerLength2) {
  pushMatrix();

  rotateZ(Joynt1);

  fill(#D69A50);
  sphere(6);

  translate(fingerLength1/2, 0, 0);
  fill(#D69A50);
  box(fingerLength1, 10, 10);

  translate(fingerLength1/2, 0, 0);
  rotateZ(Joynt2and3);

  fill(#D69A50);
  sphere(6);

  translate(fingerLength2/2, 0, 0);
  fill(#D69A50);
  box(fingerLength2, 10, 10);

  translate(fingerLength2/2, 0, 0);
  rotateZ(Joynt2and3);

  fill(#D69A50);
  sphere(6);

  translate(fingerLength2/2, 0, 0);
  fill(#D69A50);
  box(fingerLength2, 10, 10);

  popMatrix();
}