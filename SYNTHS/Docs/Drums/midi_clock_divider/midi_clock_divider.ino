/*
 * MIDI Clock Sync & Divider
 * 
 * Requires the Arduino MIDI Library:
 * https://github.com/FortySevenEffects/arduino_midi_library
 * 
 * Original code: https://modwiggler.com/forum/viewtopic.php?t=149713
*/



#include <MIDI.h>
MIDI_CREATE_DEFAULT_INSTANCE(); //instantiates midi stuff

// PIN assignments
#define WHOLE_PIN     2
#define HALF_PIN      3
#define QUARTER_PIN   4
#define EIGHTH_PIN    5
#define SIXTEENTH_PIN 6

#define TRIPLET_PIN   7
#define PPQN_PIN      8
#define PLAY_PIN      9


#define MIDI_LED_PIN  A0

bool MIDI_LED_state = LOW;


// LED switching macros (the LED is active on LOW)
#define MIDI_LED_ON  digitalWrite(MIDI_LED_PIN, LOW)
#define MIDI_LED_OFF digitalWrite(MIDI_LED_PIN, HIGH)


bool play_flag = false;
uint8_t clock_step = 0;

void blink_MIDI_LED(void)
// no delay blink
{
  if (MIDI_LED_state == LOW)
  {
    MIDI_LED_ON;
    MIDI_LED_state = HIGH;
  }
  else
  {
    MIDI_LED_OFF;
    MIDI_LED_state = LOW;
  }
}


void setup()
{
  MIDI.setHandleClock(handleClock); // called on each clock pulse
  MIDI.setHandleStart(handleStart); // called on START message
  MIDI.setHandleStop(handleStop);   // called on STOP message

  pinMode(WHOLE_PIN,      OUTPUT); // whole note pin as output
  pinMode(HALF_PIN,       OUTPUT); // 1/2 note pin as output
  pinMode(QUARTER_PIN,    OUTPUT); // 1/4 note pin as output
  pinMode(EIGHTH_PIN,     OUTPUT); // 1/8 note pin as output
  pinMode(SIXTEENTH_PIN,  OUTPUT); // 1/16 note pin as output

  pinMode(TRIPLET_PIN,    OUTPUT); // 1/3 note pin as output
  pinMode(PPQN_PIN,       OUTPUT); // 1/24 note pin as output

  pinMode(PLAY_PIN,       OUTPUT); // PLAY pin as output

  pinMode(MIDI_LED_PIN,   OUTPUT); // PLAY pin as output

  MIDI_LED_OFF;   // MIDI LED off by default

  MIDI.begin();
}

void loop()
{
  MIDI.read(); //read serial input as fast as possible
}

void handleStart()
{
  digitalWrite(PLAY_PIN, HIGH);

  play_flag = true;

  blink_MIDI_LED();
}

void handleStop()
{
  digitalWrite(PLAY_PIN, LOW);
  
  play_flag = false;
  clock_step = 0;

  digitalWrite(WHOLE_PIN, LOW);       // whole note OFF
  digitalWrite(HALF_PIN, LOW);        // half note OFF
  digitalWrite(QUARTER_PIN, LOW);     // quarter note OFF
  digitalWrite(EIGHTH_PIN, LOW);      // eighth note OFF
  digitalWrite(SIXTEENTH_PIN, LOW);   // sixteenth note OFF
  digitalWrite(TRIPLET_PIN, LOW);     // triplet note OFF
  digitalWrite(PPQN_PIN, LOW);        // PPQN note OFF

  MIDI_LED_OFF;
}

void handleClock()
{
  if ( play_flag ) {
    clock_step = clock_step % 96; // this will reset the clock_step to 0 after 96 ppqn are received,
    //assuming your MIDI clock data is being sent at the standard 24ppqn that will reset clock_step every bar.

    // Each pulse is 1 ppqn long
 
    // every 96 clock steps
    if (clock_step == 0) {
      digitalWrite(WHOLE_PIN, HIGH);      // whole note ON
    } else {
      digitalWrite(WHOLE_PIN, LOW);       // whole note OFF
    }

    // every 48 on 96 clock steps
    if (clock_step % 48 == 0) {
      digitalWrite(HALF_PIN, HIGH);       // half note ON
    } else {
      digitalWrite(HALF_PIN, LOW);        // half note OFF
    }

    // every 24 clock steps
    if (clock_step % 24 == 0) {
      digitalWrite(QUARTER_PIN, HIGH);    // quarter note ON
    } else {
      digitalWrite(QUARTER_PIN, LOW);     // quarter note OFF
    }

    // every 12 clock steps
    if (clock_step % 12 == 0) {
      digitalWrite(EIGHTH_PIN, HIGH);     // eighth note ON
    } else {
      digitalWrite(EIGHTH_PIN, LOW);      // eighth note OFF
    }

    // every 6 clock steps
    if (clock_step % 6 == 0) {
      digitalWrite(SIXTEENTH_PIN, HIGH);  // sixteenth note ON
    } else {
      digitalWrite(SIXTEENTH_PIN, LOW);   // sixteenth note OFF
    }

    // every 32 clock steps
    if (clock_step % 32 == 0) {
      digitalWrite(TRIPLET_PIN, HIGH);    // triplet note ON
    } else {
      digitalWrite(TRIPLET_PIN, LOW);     // triplet note OFF
    }

    // every 4 clock steps
    if (clock_step % 4 == 0) {
      digitalWrite(PPQN_PIN, HIGH);       // PPQN note ON
    } else {
      digitalWrite(PPQN_PIN, LOW);        // PPQN note OFF
    }

    clock_step++;
  }

  blink_MIDI_LED();
}
