/*
    Rotary Encoder - Polling Example

    The circuit:
      encoder pin A to Arduino pin 2
      encoder pin B to Arduino pin 3
      encoder ground pin to ground (GND)

  Can also be used as a polled function instead of interrupt driven.
  just need to specify what pins are being used and have the function called
  where ever a encoder response is desired
*/

void chkEncoder() {
  unsigned char  result = r.process();
  if (result) {
    // Serial.print(result == DIR_CW ? "Right" : "Left");
    if (result == DIR_CW)
      encoder --;
    else encoder ++;
 Serial.print(" encoder= ");
    Serial.println(encoder);
  }
}

// function to read encoder button
//returns value depending on if it is a long or short press
// 0   false if no press

void read_btn() {
  if (digitalRead(ENCODER_BTN) == LOW) {
    delay(800);
    if (digitalRead(ENCODER_BTN) == LOW)
      button = LONG_PRESS;
    else button = SHORT_PRESS;
  }
  else
    button = false;
}


/* void  checkInvertVideo(char msel) {
  if (msel == mnuMainSel )
    display.setTextColor( BLACK ,  WHITE );  // inverted colors
  else
    display.setTextColor(WHITE , BLACK  );     // normal colors

}
*/

