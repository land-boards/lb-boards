/*********************************************************************
  63 dB step attenuator using two ebay 31.5 dB modules in series with their
  control lines wired i  parallel

  using a OLED display
  I changed the adafruit SSD1306 to SH1106 for a 1.3 " instesd of a 0.96" display


Modified 1/20/20   To include relative or actual inmsertion loss
Changed by a long press on the rotary knob


*********************************************************************/


#include <Rotary.h>

#include <Adafruit_GFX.h>
#include <Adafruit_SH1106.h>

#define OLED_RESET 4
Adafruit_SH1106 display(OLED_RESET);



#define ylim  55                                //variables for drawing the graphics


// used by rotary encoder
#define SHORT_PRESS  1              // Button press < 800 ms
#define LONG_PRESS   2              // Button press > 800 ms
#define ENCODER_BTN  4              // Encoder push buttom pin
int encoder = 0;                   // flag and value from rotary encoder
int button = 0;                    // flag and value from  encoder button

Rotary r = Rotary(2, 3);            // polling instead of interrupt so use 6&7 instead of 2&3

// define pins used to contoll step attenuator mdules
#define DB_32  12
#define DB_16  11
#define DB_8   10
#define DB_4    9
#define DB_2    8
#define DB_1    7

int AttenValue = 0;                   // attenuation value
int AttenStep  = 1;                   // step size  1 or 10 dB
float InsertionLoss = 2.6;              // insertion loss in attenuator at 0 dB selected
int InLossMode  = 0;                  // actual insertion loss or relative
#define ActualLoss  0                 // display  value selected actual + insertion loss 
#define RelLoss     1                 // display just value selected without insertion loss
void setup()   {
  Serial.begin(115200);// Main menu variables and definitions
  Serial.println("ok");
  PCICR |= (1 << PCIE2);
  PCMSK2 |= (1 << PCINT18) | (1 << PCINT19);
  sei();

  display.begin(SH1106_SWITCHCAPVCC, 0x3C);  // initialize with the I2C addr 0x3D (for the 128x64)
  // init done
  // set control pins for attenuator modules
  pinMode(DB_32 , OUTPUT);
  pinMode(DB_16 , OUTPUT);
  pinMode(DB_8 , OUTPUT);
  pinMode(DB_4 , OUTPUT);
  pinMode(DB_2 , OUTPUT);
  pinMode(DB_1 , OUTPUT);
  pinMode(2 , INPUT_PULLUP);
  pinMode(3 , INPUT_PULLUP);

  display.clearDisplay();
  display.setTextColor(WHITE , BLACK  );
  display.setTextSize(1);
  display.setCursor(0, 20);
  display.println("     63 dB. Step");
  display.println("      Attenuator");
  display.println(" ");
  display.println("        KV4QB");
  display.display();
  delay(2000);
  display.clearDisplay();
  display.display();
  digitalWrite(DB_32, LOW);
  digitalWrite(DB_16, LOW);
  digitalWrite(DB_8, LOW);
  digitalWrite(DB_4, LOW);
  digitalWrite(DB_2, LOW);
  digitalWrite(DB_1, LOW);

}

void loop() {
  // show step value
  display.setTextSize(1);
  display.setCursor(20, 00);
  display.print("Step =  ");
  display.print(AttenStep);
  display.print(" dB.  ");
  display.display();

  // delay(10);

  //  chkEncoder();
  // delay(20);
  if (encoder) {
    if (   encoder < 0)    AttenValue -= AttenStep  ;      // because of mounting position invert selection
    if (   encoder > 0)    AttenValue += AttenStep  ;      // because of mounting position invert selection
    if ( AttenValue < 0 )  AttenValue = 0;
    if (AttenValue > 63 ) {  // limit max atten
      if (AttenStep == 1)
        AttenValue = 63;
      else AttenValue = 60;
    }
    setAtten();
    encoder = 0;
  }
  if (InLossMode == ActualLoss) {    // show actual insertion loss
    display.setTextSize(1);
    display.setCursor(20, 15);
    display.print("Actual  ");       // indicate type 
    display.setTextSize(3);
    display.setCursor(10, 30);       // clear last value
    display.print("       ");
    display.setCursor(10, 30);
    display.print( (AttenValue + InsertionLoss), 1) ;  // update display
  }
  else {
    display.setTextSize(1);
    display.setCursor(20, 15);
    display.print("Relative ");
    display.setTextSize(3);
    display.setCursor(10, 30);
    display.print("       ");
    display.setCursor(10, 30);
    display.print( AttenValue, 1);
  }
  display.print( " ");
  display.setTextSize(2);

  display.setCursor(80, 38);
  display.print( " dB.");
  display.display();


  // check button for display mode and step size
  read_btn();
  if (button) {
    if (button == SHORT_PRESS ) { //  toggle step size
      if (AttenStep == 1) AttenStep = 10;
      else AttenStep = 1;
      button = 0;
    }
    else {                        // toggle insertion loss display type
      if (InLossMode == ActualLoss) InLossMode = RelLoss ;
      else InLossMode = ActualLoss;
      button = 0;
    }
  }

  delay(50);

}

// interrupt service routine for encoder
ISR(PCINT2_vect) {
  unsigned char result = r.process();
  if (result) {
    if (result == DIR_CW) {
      encoder--;
    }
    else {
      encoder++;
    }
  }
}



void setAtten() {
  int atten = AttenValue;
  if (atten >= 32) {             // test each bit value to see if it needs to be set
    digitalWrite(DB_32, HIGH);
    atten = atten - 32;          // if set reduce value for nrxt test
  }
  else  digitalWrite(DB_32, LOW);
  if (atten >= 16) {
    digitalWrite(DB_16, HIGH);
    atten = atten - 16;
  }
  else  digitalWrite(DB_16, LOW);
  if (atten >= 8) {
    digitalWrite(DB_8, HIGH);
    atten = atten - 8;
  }
  else  digitalWrite(DB_8, LOW);
  if (atten >= 4) {
    digitalWrite(DB_4, HIGH);
    atten = atten - 4;
  }
  else  digitalWrite(DB_4, LOW);
  if (atten >= 2) {
    digitalWrite(DB_2, HIGH);
    atten = atten - 2;
  }
  else  digitalWrite(DB_2, LOW);
  if (atten >= 1) digitalWrite(DB_1, HIGH);
  else  digitalWrite(DB_1, LOW);
}
