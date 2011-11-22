PFont font;

import processing.serial.*;
Serial myPort;  // Create object from Serial class

float fontScale = 10.0;

int x = 912;
int previousFoodX = x;
int foodMarker = 3;
int currentValue = 1;
int[] data;
  int xIncr = 0;
  
void setup() {

  size(1024, 768);
  smooth();
  
  font = loadFont("Century-18.vlw");
  textFont(font);
  
  myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.bufferUntil('\n');
}

void draw() {
  
  String val = myPort.readStringUntil('\n');
  if (val!=null) {
    System.out.println(val);
    val = trim(val);
    int[] data = int(split(val, ":"));
    
    int x = data[0];
  }
  
  gaugesStatic();
  gaugesDynamic(x);
  
//  delay(1000);
}

void gaugesStatic() {
  
  fill(239,233,208);//apply fill colour to ellipses
//  menGauge();
  foodGauge();
//  coalGauge();
}

void menGauge() {
  ellipse(912, 184, 145, 145);//men circle
  
  pushStyle();//save previous style
  fill(77,76,76);//apply fill colour to text
  
  strokeWeight(2);//define stroke for startline only
  stroke(165, 0, 0);//define stroke colour for pointer only
  
  line(912,112,912,174);//red pointer
  text("Men",902,204);
  
  popStyle();//restore previous style
}

void foodGauge() {
  ellipse(912, 384, 145, 145);//food circle
  
  pushStyle();//save previous style
  fill(77,76,76);//apply fill colour to text
  
  strokeWeight(2);//define stroke for startline only
  stroke(165, 0, 0);//define stroke colour for pointer only
  
  line(912,312,912,374);//red pointer
  
//  pushMatrix();

  textSize(10);
  text("Food",901,404);

//  popMatrix();

  popStyle();//restore previous style
}

void coalGauge() {
  ellipse(912, 584, 145, 145);//coal circle
  
  pushStyle();//save previous style
  fill(77,76,76);//apply fill colour to text
  
  strokeWeight(2);//define stroke for startline only
  stroke(165, 0, 0);//define stroke colour for pointer only
  
  line(912,512,912,574);//red pointer
  text("Coal",901,604);
    
  popStyle();//restore previous style
}

void gaugesDynamic(int x) {
  
//  menNumbers();
  foodNumbers(x);
//  coalNumbers();
}

void menNumbers() {
  
}

void foodNumbers(int x) {
  int[] foodUnits = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
  int[] foodX = {850, 868, 888, 912, 936, 956, 974};
  int[] foodXBetween = {859, 878, 900, 924, 946, 965};
  int foodY = 375;
//  int x = 912;
  int y = 375;

  int valIn = x;
  int previousVal = valIn;

  
  if(previousVal > 800 && previousVal <= 1023 && valIn >= 0 && valIn < 200) {
    xIncr = xIncr+1;
  }
  else if(valIn > previousVal) {
    xIncr = xIncr+1;
  }
  
  if(previousVal >= 0 && previousVal < 200 && valIn > 900 && valIn <= 1023) {
    xIncr = xIncr-1;
  }
  else if(valIn < previousVal) {
    xIncr = xIncr-1;
  }
  
  previousVal = valIn;
  
  pushStyle();//save previous style
  
  fill(77,76,76);//apply fill colour to text

  boolean scrolling = false;
  
  int startValue;
  
  for(int i = 0; i < 9; i++) {
    startValue = 20 - currentValue;
    
    if(startValue < 0) {
    startValue = 20 + startValue;
    }
    
    startValue = currentValue - 4;
    
    if(startValue < 0) {
    startValue = 20 + startValue;
    }
    
    int printValue = startValue+i;
    
    if(printValue > 20) {
      printValue = printValue - 20;
    }
    
    int xCoord = i;
    
    textAlign(CENTER, TOP);
    textSize(fontScale);
    text(printValue, 832+(xCoord*18)+xIncr, 375);
  }
  
  popStyle();//restore previous style
}

void coalNumbers() {

}
