// Copyright 2021 migueldetrool
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

// Auto gate generation not yet implemented

//pin associations
int in[] = {3, 2}; //switch with wires
int p[] = {A1, A2};
int outA[] = {11, 12}; //switch with wires
int LEDA[] = {10, 4};
int outB[] = {8, 6};
int LEDB[] = {9, 5};
int mode[] = {A0, A3};
bool cointoss[] = {false, false};
bool latchState[] = {false, false};

void setup() {
  // pins for 1st channel
  pinMode(in[0], INPUT_PULLUP);
  pinMode(p[0], INPUT);
  pinMode(mode[0], INPUT_PULLUP);
  pinMode(outA[0], OUTPUT);
  pinMode(outB[0], OUTPUT);
  pinMode(LEDA[0], OUTPUT);
  pinMode(LEDB[0], OUTPUT);
  

  // pins for 2nd channel
  pinMode(in[1], INPUT_PULLUP);
  pinMode(p[1], INPUT);
  pinMode(mode[1], INPUT_PULLUP);
  pinMode(outA[1], OUTPUT);
  pinMode(outB[1], OUTPUT);
  pinMode(LEDA[1], OUTPUT);
  pinMode(LEDB[1], OUTPUT);

  attachInterrupt(digitalPinToInterrupt(in[0]), change0, CHANGE);
  attachInterrupt(digitalPinToInterrupt(in[1]), change1, CHANGE);
  

}

void change0() {
  if (digitalRead(mode[0]) == HIGH) {
    toggleLogic(0);
  }
  else {
    latchLogic(0);
  }
}

void change1() {
  if (digitalRead(mode[1]) == HIGH) {
    toggleLogic(1);
  }
  else {
    latchLogic(1);
  }
}

void toggleLogic(int channel) {
  if (digitalRead(in[channel]) == HIGH) {
    digitalWrite(outA[channel], LOW);
    digitalWrite(outB[channel], LOW);
    digitalWrite(LEDA[channel], LOW);
    digitalWrite(LEDB[channel], LOW);
  }
  else {
    cointoss[channel] = random(1009) > analogRead(p[channel]);
    digitalWrite(outA[channel], !cointoss[channel]);
    digitalWrite(outB[channel], cointoss[channel]);
    digitalWrite(LEDA[channel], cointoss[channel]);
    digitalWrite(LEDB[channel], !cointoss[channel]);
  }
}

void latchLogic(int channel) {
  if (digitalRead(in[channel]) == LOW) {
    cointoss[channel] = random(1023) > analogRead(p[channel]);
    if (cointoss[channel] == true) {
      latchState[channel] = !latchState[channel];
    }
    digitalWrite(outA[channel], !latchState[channel]);
    digitalWrite(outB[channel], latchState[channel]);
    digitalWrite(LEDA[channel], latchState[channel]);
    digitalWrite(LEDB[channel], !latchState[channel]);
  }
}

void loop() {
  _NOP();
}
