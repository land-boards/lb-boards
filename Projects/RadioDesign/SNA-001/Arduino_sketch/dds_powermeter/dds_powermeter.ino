//AD9850 DDS and AD8307 power meter
// sept 2013 RH

#define DDS_CLOCK 125000000

#define  CLOCK  A2  //pin connections for DDS
#define  LOAD A3 
#define  DATA  A5
#define  RESET A4

int AD8307 = A7;    // select the analog input pin for AD8307

#define arduinoLED 13   // Arduino LED on board

char inputcmd[100];  // serial data input
int cmdindex=0;
  
void setup()
{
  pinMode(arduinoLED, OUTPUT);      // Configure the onboard LED for output
  digitalWrite(arduinoLED, LOW);    // default to LED off
  analogReference(EXTERNAL);  // 3.3v regulator output used as reference - 3.38V on this NANO board
  Serial.begin(9600);
  
 // init dds 
  pinMode (DATA,  OUTPUT); 
  pinMode (CLOCK, OUTPUT); 
  pinMode (LOAD,  OUTPUT); 
  pinMode (RESET, OUTPUT); 
  AD9850_init();
  AD9850_reset();

  SetFrequency(1000000); // 1 mhz default

}

void loop()   // Arduino superloop - where everything gets done
{

  char ch;

  long int temp;
  
// serial command interpreter 
// enter a number to set the frequency, anything else shows power
  while (Serial.available()) {
    ch=(char)Serial.read();
    if (((ch >= '0') && (ch <= '9')) || ((ch >= 'A') && (ch <= 'Z'))) inputcmd[cmdindex++]=ch; // ignore everything other than numbers and uppercase letters, save to command string
    if (ch == '\n') {    // parse command if its a newline
      inputcmd[cmdindex]=0; // terminate the string
      if ((temp=atol(inputcmd)) > 0) {
        SetFrequency(temp);
      }
      else dBm_power();  
      //else raw_power();  // python has trouble with floats
      cmdindex=0; // reset command line      
    }
  }
}

// AD8307 outputs 25mv per db. 0db is 2.1v out
// if we use a 2.56v ref this works out to
// 2.5mv per bit, or 0.1dbm
// the NANO has only 1.1v internal ref or the 5V supply so I used the 3.3v regulator as a ref
// with the 3.38V ref the output will be 3.38V/.025V/1024 or 0.13203125db/bit

void dBm_power() {
  float dBm=0;
  int i;
  for (i=0;i<10;++i)  dBm+=(float)analogRead(AD8307); // average a few raw readings
  dBm=dBm/i;
//  0db = 2.1v = 636 with 3.38V ref
// -74dbm = .25v, 1dbm = .025v. if the AD8307 has an offset error we correct that here as well
   dBm = dBm - 667;
   dBm = dBm * 0.13203125 ;    
  Serial.print(" "); // may help Python parser
  Serial.print(dBm);
  Serial.println(" "); // may help Python parser
}

void raw_power() {
  Serial.print(" "); // may help Python parser
  Serial.print(analogRead(AD8307));
  Serial.println(" "); // may help Python parser
}

void SetFrequency(unsigned long frequency)
{
  unsigned long tuning_word;
  float tuneword=(frequency * pow(2, 32)) / (unsigned long) DDS_CLOCK; // hack to avoid overflow on top term
  tuning_word=(unsigned long) tuneword;
  digitalWrite (LOAD, LOW); 
/*  
  shiftOut(DATA, CLOCK, MSBFIRST, 0x0);
  shiftOut(DATA, CLOCK, MSBFIRST, tuning_word >> 24);
  shiftOut(DATA, CLOCK, MSBFIRST, tuning_word >> 16);
  shiftOut(DATA, CLOCK, MSBFIRST, tuning_word >> 8);
  shiftOut(DATA, CLOCK, MSBFIRST, tuning_word);
*/
 
  shiftOut(DATA, CLOCK, LSBFIRST, tuning_word);
  shiftOut(DATA, CLOCK, LSBFIRST, tuning_word >> 8);
  shiftOut(DATA, CLOCK, LSBFIRST, tuning_word >> 16);
  shiftOut(DATA, CLOCK, LSBFIRST, tuning_word >> 24);
  shiftOut(DATA, CLOCK, LSBFIRST, 0x0);

  
  digitalWrite (LOAD, HIGH); 
}

void AD9850_init()
{

  digitalWrite(RESET, LOW);
  digitalWrite(CLOCK, LOW);
  digitalWrite(LOAD, LOW);
  digitalWrite(DATA, LOW);
}

void AD9850_reset()
{
  //reset sequence is:
  // CLOCK & LOAD = LOW
  //  Pulse RESET high for a few uS (use 5 uS here)
  //  Pulse CLOCK high for a few uS (use 5 uS here)
  //  Set DATA to ZERO and pulse LOAD for a few uS (use 5 uS here)

  // data sheet diagrams show only RESET and CLOCK being used to reset the device, but I see no output unless I also
  // toggle the LOAD line here.

  digitalWrite(CLOCK, LOW);
  digitalWrite(LOAD, LOW);

  digitalWrite(RESET, LOW);
  delay(5);
  digitalWrite(RESET, HIGH);  //pulse RESET
  delay(5);
  digitalWrite(RESET, LOW);
  delay(5);

  digitalWrite(CLOCK, LOW);
  delay(5);
  digitalWrite(CLOCK, HIGH);  //pulse CLOCK
  delay(5);
  digitalWrite(CLOCK, LOW);
  delay(5);
  digitalWrite(DATA, LOW);    //make sure DATA pin is LOW

    digitalWrite(LOAD, LOW);
  delay(5);
  digitalWrite(LOAD, HIGH);  //pulse LOAD
  delay(5);
  digitalWrite(LOAD, LOW);
  // Chip is RESET now
}



