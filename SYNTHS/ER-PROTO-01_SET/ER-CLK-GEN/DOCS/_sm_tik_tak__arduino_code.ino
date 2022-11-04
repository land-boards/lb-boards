/*********************Programmed by SyntheMafia(06_06_2018)**********************/


#include <SimpleTimer.h>


SimpleTimer timer;
int count = 0;


void setup() {
  Serial.begin(9600);
  pinMode(2, OUTPUT);
  pinMode(3, OUTPUT);
  pinMode(4, OUTPUT);
  pinMode(5, OUTPUT);
  pinMode(10, INPUT);
    
}

bool started = false;
int priority = 0;
int tapX = 0;
int tapactual;
int tap_time;
int time_actual;
int input1X = 0;
float BPM; 
int max_BPM = 500; /******************************************** write hier the max BPM that you want */
int min_BPM = 60;  /******************************************** write hier the min BPM that you want */
int max_time = ((1/(min_BPM/60)) * 1000);
int min_time = ((1/(max_BPM/60)) * 1000);


void loop() {
  
  if (!started) {
    cycle_on();
    started = true;
  }
  
  timer.run();

  
  if (digitalRead(10) == HIGH && tapX ==0){
    tapX = millis ();
    while (digitalRead (10) == HIGH){
      delay(10);
    }
   }
   
  if (digitalRead (10) == HIGH && tapX !=0  ){
    tapactual = millis ();
    tap_time = (tapactual - tapX);
    if (tap_time > max_time){
      tap_time = max_time;  
    }
     if (tap_time < min_time){
      tap_time = min_time;  
    }
    tapX = tapactual;
    priority = 1; 
    while (digitalRead (10) == HIGH){
      delay(10);
    }
   }
   time_actual = millis ();
    if ((time_actual - tapX) > 4000){
      tapX = 0; 
    }
   
  Serial.print(" BPM: ");
  Serial.println(BPM);
  

}


/*********************************************************************/



void cycle_off() {
  digitalWrite(2, LOW);
  digitalWrite(3, LOW);
  digitalWrite(4, LOW);
  digitalWrite(5, LOW);

  count++;

  if (count == 8) {
    count = 0;
  }
}



/*********************************************************************/


void cycle_on() {

  switch (count) {
    case 0:
      digitalWrite(2, HIGH);
      digitalWrite(3, HIGH);
      digitalWrite(4, HIGH);
      digitalWrite(5, HIGH);
      break;

    case 1:
      digitalWrite(2, HIGH);
      break;

    case 2:
      digitalWrite(2, HIGH);
      digitalWrite(3, HIGH);
      break;

    case 3:
      digitalWrite(2, HIGH);
      break;
  
    case 4:
      digitalWrite(2, HIGH);
      digitalWrite(3, HIGH);
      digitalWrite(4, HIGH);
      break;

    case 5:
      digitalWrite(2, HIGH);
      break;

    case 6:
      digitalWrite(2, HIGH);
      digitalWrite(3, HIGH);
      break;

    case 7:
      digitalWrite(2, HIGH);
      break;
  }

  int input1 = analogRead(A0);
  int input2 = analogRead(A1);

  if (priority == 0){
     BPM = map(input1, 0, 1023, min_BPM, max_BPM);
     
  }
  
  if (priority == 1){
     BPM = (60000 / tap_time);
    
     
  }


  if (input1X - input1 > 5){
    priority = 0;
  }
  if (input1X - input1 < -5){
    priority = 0;
  }

  input1X = input1;
  
  
  


  
  float duration_percentage =  map(input2, 0, 1023, 1, 90);
 
  int cycletime = (60000/BPM);

  float cycle_start = cycletime;
  float cycle_stop = (cycletime * (duration_percentage/100));


  timer.setTimeout(cycle_start, cycle_on);
  timer.setTimeout(cycle_stop, cycle_off);

}

/*********************************************************************/

