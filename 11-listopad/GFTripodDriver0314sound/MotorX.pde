class MotorX{
  String call = "x ";
  PApplet parent;
  int speed = 0;
  
  MotorX(PApplet _parent){
    parent=_parent;
  }

  void send(int kolik){
    String command = "";
    kolik=constrain(kolik,0,255);
    command = str(kolik)+" ";
    tripod.send(call+command); 
  }
  /*
  void setSpeed(int _speed){
    speed = _speed;
    send(speed);
  }*/
  
}



///---------------------------------------------------------------- >>

/**
 * arduino rizeni s L293D h-bridge
 * http://itp.nyu.edu/physcomp/Labs/DCMotorControl
 * 
 * 
 * int switchPin = 2;    // switch input
 * int motor1Pin = 3;    // H-bridge leg 1 
 * int motor2Pin = 4;    // H-bridge leg 2 
 * int speedPin = 9;     // H-bridge enable pin 
 * int ledPin = 13;      //LED 
 * 
 * void setup() {
 * // set the switch as an input:
 * pinMode(switchPin, INPUT); 
 * 
 * // set all the other pins you're using as outputs:
 * pinMode(motor1Pin, OUTPUT); 
 * pinMode(motor2Pin, OUTPUT); 
 * pinMode(speedPin, OUTPUT);
 * pinMode(ledPin, OUTPUT);
 * 
 * // set speedPin high so that motor can turn on:
 * digitalWrite(speedPin, HIGH); 
 * 
 * // blink the LED 3 times. This should happen only once.
 * // if you see the LED blink three times, it means that the module
 * // reset itself,. probably because the motor caused a brownout
 * // or a short.
 * blink(ledPin, 3, 100);
 * }
 * 
 * void loop() {
 * // if the switch is high, motor will turn on one direction:
 * if (digitalRead(switchPin) == HIGH) {
 * digitalWrite(motor1Pin, LOW);   // set leg 1 of the H-bridge low
 * digitalWrite(motor2Pin, HIGH);  // set leg 2 of the H-bridge high
 * } 
 * // if the switch is low, motor will turn in the other direction:
 * else {
 * digitalWrite(motor1Pin, HIGH);  // set leg 1 of the H-bridge high
 * digitalWrite(motor2Pin, LOW);   // set leg 2 of the H-bridge low
 * }
 * }
 * 
 * 
 * void blink(int whatPin, int howManyTimes, int milliSecs) {
 * int i = 0;
 * for ( i = 0; i < howManyTimes; i++) {
 * digitalWrite(whatPin, HIGH);
 * delay(milliSecs/2);
 * digitalWrite(whatPin, LOW);
 * delay(milliSecs/2);
 * }
 * }
 * 
 */











