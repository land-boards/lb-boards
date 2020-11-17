
/********************************************************
**  Downloaded from:                                   **
**  http://www.arduino-projekte.de                     **
********************************************************/

#include <AH_AD9850.h>

//CLK - D6, FQUP - D7,  BitData - D8, RESET - D9
//AH_AD9850(int CLK, int FQUP, int BitData, int RESET);
AH_AD9850 AD9850(8,10, 9, 11);

void setup()
{
  //reset device
  AD9850.reset();                   //reset module
  delay(1000);
  AD9850.powerDown();               //set signal output to LOW
  
  // initialize serial communication
  Serial.begin(9600);
}

void loop(){

 //set_frequency(boolean PowerDown, byte Phase, double Freq); 
 //AD9850.set_frequency(0,0,1000);    //set power=UP, phase=0, 1kHz frequency
 //delay(1000); 
 double freq;
 if (Serial.available()) {
   freq=Serial.parseFloat();
   while(Serial.available()) Serial.read(); // eat extra characters
   Serial.println(freq);
   AD9850.set_frequency(freq);        //set frequency
 }
 
// AD9850 << 5000;                    //set 5kHz frequency in C++ style
// delay(1000);
 
 

 
}
