//pin 8 = direction
//pin 9 = enable

void setup() {
  pinMode(8, OUTPUT); //set direction pin as output
  pinMode(9, OUTPUT); //set enable pin as output
}

void loop() {

  //start off going forward at 50% throttle
  digitalWrite(8, HIGH); //forward
  analogWrite (9, 128); //50% PWM
  delay(4000);

  //full speed ahead!
  digitalWrite(9, HIGH); //full speed
  delay(2000);

  //and stop for a while
  digitalWrite(9, LOW); //turn enable pin off
  delay(1000);

  //now lets go backwards
  digitalWrite(8, LOW); //backward
  analogWrite(9, 128); //50% PWM
  delay(2000);

  //and stop for a while
  digitalWrite(9, LOW); //turn enable pin off
  delay(1000);

}
