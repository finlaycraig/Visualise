int sensorPinPotentiometer = A0;
int sensorPinRotarySwitch1 = A1;
int sensorPinRotarySwitch2 = A2;
int sensorPinRotarySwitch3 = A3;

int valPotentiometer = 0;
int valRotarySwitch1 = 0;
int valRotarySwitch2 = 0;
int valRotarySwitch3 = 0;

void setup(){
  Serial.begin (9600);
}

void loop(){
  valPotentiometer = analogRead(sensorPinPotentiometer);
  valRotarySwitch1 = analogRead(sensorPinRotarySwitch1);
  valRotarySwitch2 = analogRead(sensorPinRotarySwitch2);
  valRotarySwitch3 = analogRead(sensorPinRotarySwitch3);
  
  Serial.print(valPotentiometer);
  Serial.print(":");
  Serial.print(valRotarySwitch1);
  Serial.print(":");
  Serial.print(valRotarySwitch2);
  Serial.print(":");
  Serial.println(valRotarySwitch3);
}
