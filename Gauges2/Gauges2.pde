PFont font;

import processing.serial.*;
Serial myPort;  // Create object from Serial class

//float fontScale = 10.0;

int x;
//int encoderRead;
//int previousFoodX = x;
//int foodMarker = 3;
int currentValue = 1;
int printValue;
int[] data;
//int xIncr = 0;
int previousState = 0;
int savedDif = 0;
  
void setup() {

  size(1024, 768);
  smooth();
  
  font = loadFont("Century-18.vlw");
  textFont(font);
  
  myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.bufferUntil('\n');
}

void serialEvent(Serial myPort)
{
  if ( myPort.available() > 0) {  // If data is available,
    String val = myPort.readStringUntil('\n');
    if (val!=null) {
      System.out.println(val);
      val = trim(val);

      int[] data = int(split(val, ":"));

      int encoderRead = data[1];
      x = encoderRead;
    }
  }
}

void draw() {
  
  gaugesStatic();
  gaugesDynamic();
//  delay(500);
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

void gaugesDynamic() {
  
//  menNumbers();
  foodNumbers();
//  coalNumbers();
}

void menNumbers() {
  
}

void foodNumbers() {
//  int[] foodUnits = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
  int[] foodX = {832, 850, 868, 888, 912, 936, 956, 974, 992};
//  int[] foodXBetween = {859, 878, 900, 924, 946, 965};
  int foodY = 375;

//currentValue++;  
//currentValue--;
//k = k - 10;
println("x = "+x);

//  int previousState;
  int currentState = x;
  
  int encoderVal = currentState - previousState;
  
  savedDif = savedDif + encoderVal;
  
  if(savedDif > 300) {
    if(previousState >= 0 && previousState < 200 && currentState > 800 && currentState <= 1023) {
      currentValue--;
      savedDif = 0;
    }
    else {
      currentValue++;
      savedDif = 0;
    }
  }
  if(savedDif < -300) {
    if(previousState > 800 && previousState <= 1023 && currentState >= 0 && currentState < 200) {
      currentValue++;
      savedDif = 0;
    }
    else {
      currentValue--;
      savedDif = 0;
    }
  }
  
  previousState = currentState;

  pushStyle();//save previous style
  
  fill(77,76,76);//apply fill colour to text

  boolean scrolling = false;
  
  int startValue;
  
  for(int i = 0; i < 9; i++) {
    startValue = 20 - currentValue;
    
    if(startValue < 1) {
    startValue = 20 + startValue;
    }
    
    startValue = currentValue - 4;
    
    if(startValue < 1) {
    startValue = 20 + startValue;
    }
    
    if(startValue > 0 && startValue < 13) {
      printValue = startValue + i;
    }
    if(startValue == 13) {
      if(i < 8) {
        printValue = startValue + i;
      }
      if(i >= 8) {
        printValue = startValue + (i-20);
      }
    }
    if(startValue == 14) {
      if(i < 7) {
        printValue = startValue + i;
      }
      if(i >= 7) {
        printValue = startValue + (i-20);
      }
    }
    if(startValue == 15) {
      if(i < 6) {
        printValue = startValue + i;
      }
      if(i >= 6) {
        printValue = startValue + (i-20);
      }
    }
    if(startValue == 16) {
      if(i < 5) {
        printValue = startValue + i;
      }
      if(i >= 5) {
        printValue = startValue + (i-20);
      }
    }
    if(startValue == 17) {
      if(i < 4) {
        printValue = startValue + i;
      }
      if(i >= 4) {
        printValue = startValue + (i-20);
      }
    }
    if(startValue == 18) {
      if(i < 3) {
        printValue = startValue + i;
      }
      if(i >= 3) {
        printValue = startValue + (i-20);
      }
    }
    if(startValue == 19) {
      if(i < 2) {
        printValue = startValue + i;
      }
      if(i >= 2) {
        printValue = startValue + (i-20);
      }
    }
    if(startValue == 20) {
      if(i < 1) {
        printValue = startValue + i;
      }
      if(i >= 1) {
        printValue = startValue + (i-20);
      }
      
    }
    
    if(startValue == 17) {
      currentValue = 1;  
    }
    if(startValue == 16) {
      currentValue = 20;  
    }

    
    textAlign(CENTER, TOP);
    
    if(i < 2 || i > 6) {
      textSize(10);
    }
    else if(i < 3 || i > 5) {
      textSize(12);
    }
    else if(i < 4 || i > 4) {
      textSize(14);
    }
    else if(i == 4) {
      textSize(18);
    }
    
    text(printValue, foodX[i], foodY);
    
  }
  
  popStyle();//restore previous style
}

void coalNumbers() {

}
