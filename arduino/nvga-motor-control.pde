#include <Adafruit_CircuitPlayground.h>


bool leftButtonPressed;
bool rightButtonPressed;
bool slideSwitch;



void setup() {
  CircuitPlayground.begin();

  //motor lift - right
  pinMode(10, OUTPUT);  //direction
  pinMode(9 , OUTPUT);  //enable 

  //motor grip - left
  pinMode(3, OUTPUT);  //direction
  pinMode(2 , OUTPUT);  //enable 

  
}

void loop() {

  leftButtonPressed  = CircuitPlayground.leftButton();
  rightButtonPressed = CircuitPlayground.rightButton();
  slideSwitch = CircuitPlayground.slideSwitch();

//Control lift motor attached to pins 9 and 10, slide switch to the right
   if (leftButtonPressed && !slideSwitch) {
    digitalWrite(9, HIGH); //enable lift
  
    CircuitPlayground.setPixelColor(1, 0,   100,   100);
    } 

   if (rightButtonPressed && !slideSwitch) {
    digitalWrite(10, HIGH); //change direction
    digitalWrite(9, HIGH);  //enable lift
    CircuitPlayground.setPixelColor(8, 0,   100,   100);
    } 


   
  //Control grip motor attached to pins 2 and 3, slide switch to the left
   if (leftButtonPressed && slideSwitch) {
    digitalWrite(2, HIGH); //enable grip
    CircuitPlayground.setPixelColor(1, 200,   100,   100);
    } 

   if (rightButtonPressed && slideSwitch) {
    CircuitPlayground.setPixelColor(8, 200,   100,   100);
    digitalWrite(3, HIGH); //change direction
    delay(500);  // a little delay to let the relay catch up
    digitalWrite(2, HIGH);  //enable grip
    
    } 


  
  //If nothing pressed everything off
   if (!leftButtonPressed && !rightButtonPressed){
      //everything off
      digitalWrite(10,LOW); 
      digitalWrite(9, LOW);
      digitalWrite(3, LOW);
      digitalWrite(2, LOW);
      CircuitPlayground.clearPixels();
    }

  //LED side indicator with top LEDs
    if(slideSwitch){
      CircuitPlayground.setPixelColor(0, 200,   100,   100);
    }else if (!slideSwitch){
      CircuitPlayground.setPixelColor(9, 0,   100,  100);
      }
    
  
  
}
