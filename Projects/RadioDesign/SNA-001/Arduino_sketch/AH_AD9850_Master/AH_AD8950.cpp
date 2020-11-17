
/***************************************************
** 						  **
**  Controller Library for AD9850 Module/Shield   **
** 						  **
**  Downloaded from:				  **
**  www.arduino-projekte.de			  **
**						  **
***************************************************/

#include "AH_AD9850.h"

#include "Arduino.h"


//***************************************************************************

AH_AD9850::AH_AD9850(int CLK, int FQUP, int BitData, int RESET)
{
	  	
   	_CLK = CLK;
   	_FQUP= FQUP;
   	_RST= RESET;
   	_BitData = BitData;

	pinMode(_RST, OUTPUT);
   	pinMode(_FQUP, OUTPUT);
   	pinMode(_CLK , OUTPUT);
   	pinMode(_BitData, OUTPUT);

	digitalWrite(_RST, LOW);
   	digitalWrite(_FQUP, LOW);
   	digitalWrite(_CLK, LOW);
   	digitalWrite(_BitData, LOW);
}

//***************************************************************************

void AH_AD9850::reset()
	{
	  digitalWrite(_CLK, LOW);
	  digitalWrite(_FQUP, LOW);

	  //Reset signal
	  digitalWrite(_RST, HIGH);

          for(int i=0;i<5;i++)
            {clock_CLK();}

	  digitalWrite(_RST, LOW);

          for(int i=0;i<2;i++)
            {clock_CLK();}		

          clock_FQUP();		
	}

//***************************************************************************
	
void AH_AD9850::set_frequency(boolean PowerDown, byte Phase, double Freq)
{
  byte w,w0;
  long int y;
  double x;

  byte ConrolBits = 0x00;  //Bxxxxxx00 only allowed bits!!

  w0= (Phase & B00011111)<<3 | (PowerDown & 0x01)<<2 | ConrolBits;
	  
  //Calculate the frequency of the HEX value
  x=4294967295/125;		//Suitable for 125M Crystal 
  Freq=Freq/1000000;
  Freq=Freq*x;
  y=Freq;
	  
  clock_FQUP();

  //write w4
  w=(y>>=0);
  write(w);

  //write w3
  w=(y>>8);
  write(w);

  //write w2
  w=(y>>16);
  write(w);

  //write w1
  w=(y>>24);
  write(w);

  //write w0
//  w=w0;
  write(w0);

  clock_FQUP();
}


//***************************************************************************
	
void AH_AD9850::set_frequency(double Freq)
{
  byte w,w0;
  long int y;
  double x;

  w0= 0x00;    //Phase=0, PowerDown=LOW, ControlBits=00
	      
  x=4294967295/125;	//Calculate the frequency of the HEX value, Suitable for 125M Crystal 			
  Freq=Freq/1000000;
  Freq=Freq*x;
  y=Freq;

  clock_FQUP();
    
   w=(y>>=0);
   write(w);  	//write w4

   w=(y>>8);
   write(w);	//write w3

   w=(y>>16);
   write(w);	//write w2

   w=(y>>24);
   write(w);	//write w1

//   w=w0;
   write(w0);	//write w0

  clock_FQUP();
}


//***************************************************************************
	
void AH_AD9850::powerDown()
{
  byte w,w0;
  w = 0x0;
  w0 = B00000100;
	  
  clock_FQUP();

  //write w4
  write(w);

  //write w3
  write(w);

  //write w2
  write(w);

  //write w1
  write(w);

  //write w0
  write(w0);

  clock_FQUP();
}


//****************************************************************************


void AH_AD9850::write(byte word)
{ 
  byte i;
  for(i=0; i<8; i++)
  {
    digitalWrite(_BitData, (word>>i)&0x01);
    clock_CLK();
  }
}

//***************************************************************************

void AH_AD9850::clock_CLK()
{
	  digitalWrite(_CLK, HIGH);
	  digitalWrite(_CLK, LOW);
}

//***************************************************************************

void AH_AD9850::clock_FQUP()
{
	  digitalWrite(_FQUP, HIGH);
	  digitalWrite(_FQUP, LOW);
}

//***************************************************************************
void AH_AD9850::operator<<(double frequency)
{
  set_frequency(frequency);
}	
	













