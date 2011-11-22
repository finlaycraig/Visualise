//int sensorPinToggle = A0;
int sensorPinEncoder = A1;

//int valSwitch = 0;
int valEncoder = 0;

void setup(){
  Serial.begin (9600);
}

void loop(){
//  valSwitch = analogRead(sensorPinToggle);
  valEncoder = analogRead(sensorPinEncoder);
  
//  Serial.print(valSwitch);
  Serial.print(":");
  Serial.println(valEncoder);
  delay(50);
}

