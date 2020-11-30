
/***************************************************
** 						  **
**  Controller Library for AD9850 Module/Shield   **
** 						  **
**  Downloaded from:				  **
**  www.arduino-projekte.de			  **
**						  **
***************************************************/

#ifndef __AH_AD9850_H__
#define __AH_AD9850_H__

#include "Arduino.h"


class AH_AD9850{
 public:
     	AH_AD9850(int CLK, int FQUP, int BitData, int RESET);
     	void reset();
     	void set_frequency(boolean PowerDown, byte Phase, double Freq);
     	void set_frequency(double Freq);
        void operator<<(double Freq);
        void powerDown();

 private:
     	int _CLK;
     	int _FQUP;
     	int _RST;
     	int _BitData;
     
     	void write(byte word);
	void clock_CLK();
	void clock_FQUP();
	
};

#endif
