extern "C"
{
  #include <Project.h>
}
#include <Arduino.h>
#include <Servo.h>
#include <Arduino_Pins.h>


volatile uint8_t pinStatus = LOW;
volatile uint8_t pinStatus2 = LOW;
volatile uint16_t pulseLength = DEFAULT_PULSE_WIDTH;
static servo_t servoList[MAX_SERVOS];
static int8_t servoCount = 0;
static int8_t activeServo = 0;
extern uint32_t pinNumberToPointer[NUM_BASE_PINS]; 

CY_ISR_PROTO(ServoInterrupt_ISR);
CY_ISR(ServoInterrupt_ISR)
{
  // Reading the status register clears the interrupt, so we *have* to do it.
  uint8_t status = ServoCounter_STATUS;

  // However, if we've no servos attached, we don't need to do anything else.
  if (servoCount == 0)
  {
    return;
  }
  
  if ( ( status & ServoCounter_STATUS_ZERO ) !=0 )
  {
    digitalWrite(D4, HIGH);
    digitalWrite(D4, LOW);
  }

  /* If a zero status interrupt occurred, we need to reset the active servo
   * index to zero. */

  if (activeServo == servoCount)
  {
    ServoCounter_WriteCompare(0);
    activeServo = 0;
    return;
  }

  if (servoList[activeServo].Pin.isActive == false)
  {
    activeServo++;
    return;
  }

  /* If a compare interrupt occurred, we want to 
     - toggle the current active PWM pin
     - set the compare register to trip at the next event
  */
  uint32_t pinName = servoList[activeServo].Pin.nbr;
  if ( ( status & ServoCounter_STATUS_CMP ) != 0 )
  {
    if (CyPins_ReadPin(pinName) == LOW) 
    {
      CyPins_SetPin(pinName);
      ServoCounter_WriteCompare((activeServo * CHANNEL_SWITCH_TIME)+servoList[activeServo].ticks);
    }
    else 
    {
      CyPins_ClearPin(pinName);
      ++activeServo;
      ServoCounter_WriteCompare(activeServo * CHANNEL_SWITCH_TIME);
    }
  }
}


Servo::Servo()             
{

  if (servoCount < MAX_SERVOS)
  {
    this->servoIndex = servoCount++;
    servoList[this->servoIndex].ticks = DEFAULT_PULSE_WIDTH;
  }
  else
  {
    this->servoIndex = INVALID_SERVO;
  }
}


uint8_t Servo::attach(uint32_t pin)             
{
  return this->attach(pin, MIN_PULSE_WIDTH, MAX_PULSE_WIDTH);
}

uint8_t Servo::attach(uint32_t pin, int min, int max)
{
  if ( (ServoCounter_ReadControlRegister() & 0x80) == 0 )
  {
    ServoCounter_Start();
    ServoCounter_WritePeriod(25000);
    ServoCounter_WriteCompare(0);
    ServoCounter_SetInterruptMode(ServoCounter_STATUS_CMP_INT_EN_MASK | ServoCounter_STATUS_ZERO_INT_EN_MASK);
    ServoInterrupt_StartEx(ServoInterrupt_ISR);
  }
  if (this->servoIndex != INVALID_SERVO)
  {
    if ( (pin > 0 ) && (pin < 20) )
    {
      pin = pinNumberToPointer[pin];
    }
    pinMode(pin, OUTPUT);
    servoList[this->servoIndex].Pin.nbr = pin;
    this->min = min;
    this->max = max;
    servoList[this->servoIndex].Pin.isActive = 1;
  }
  return this->servoIndex;
}

void Servo::detach()
{
  pinMode(servoList[this->servoIndex].Pin.nbr, INPUT);
  servoList[this->servoIndex].Pin.isActive = 0;
}

void Servo::write(int value)
{
  if (value <= 180)
  {
    value = map(value, 0, 180, this->min, this->max);
    writeMicroseconds(value);
  }
  if ( (value <= this->max) && (value >= this->min))
  {
    writeMicroseconds(value);
  }
}

void Servo::writeMicroseconds(int value)
{
  servoList[this->servoIndex].ticks = value;
}

int Servo::read()
{
  return map(servoList[this->servoIndex].ticks, this->min, this->max, 0, 180);
}
          
int Servo::readMicroseconds()
{
  return servoList[this->servoIndex].ticks;
}
     
bool Servo::attached()             
{
  return (bool)servoList[this->servoIndex].Pin.isActive;
}

