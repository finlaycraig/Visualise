PFont font;

import processing.serial.*;
Serial myPort;  // Create object from Serial class

//float fontScale = 10.0;
int[] data; // array of incoming data from arduino

int rotarySwitchVal1;
int rotarySwitchVal2;
int rotarySwitchVal3;

int potentiometerVal;
int previousFoodVal = 0;
int savedFoodChange = 0;
int currentFoodValue = 1;
int printFoodValue;



  
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
  if (myPort.available() > 0) {  // If data is available,
    String val = myPort.readStringUntil('\n');
    if (val!=null) {
//      System.out.println(val);
      val = trim(val);

      int[] data = int(split(val, ":"));

      int potentiometerRead = data[0];
      potentiometerVal = potentiometerRead;
      
      int rotarySwitchRead1 = data[1];
      rotarySwitchVal1 = data[1];
      
      int rotarySwitchRead2 = data[2];
      rotarySwitchVal2 = data[2];
      
      int rotarySwitchRead3 = data[3];
      rotarySwitchVal3 = data[3];
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
  int[] foodX = {832, 850, 868, 888, 912, 936, 956, 974, 992};
  int foodY = 375;
  
  int currentFoodVal = potentiometerVal;
  
  int changedFoodVal = currentFoodVal - previousFoodVal;
  
  if(previousFoodVal >= 0 && previousFoodVal < 341 && currentFoodVal > 682 && currentFoodVal <= 1023) {
    changedFoodVal = (0 - previousFoodVal);
    changedFoodVal = changedFoodVal + (currentFoodVal - 1023);
  }
  if(previousFoodVal > 682 && previousFoodVal <= 1023 && currentFoodVal >= 0 && currentFoodVal < 341) {
    changedFoodVal = (1023 - previousFoodVal);
    changedFoodVal = changedFoodVal + (currentFoodVal - 0);
  }
  
  savedFoodChange = savedFoodChange + changedFoodVal;
  
  if(savedFoodChange > 300) {
      currentFoodValue++;
      savedFoodChange = 0;
    }
    
  if(savedFoodChange < -300) {
      currentFoodValue--;
      savedFoodChange = 0;
  }
  
  previousFoodVal = currentFoodVal;
  

  pushStyle();//save previous style
  
  fill(77,76,76);//apply fill colour to text
  
  int startFoodValue;
  
  for(int i = 0; i < 9; i++) {
    startFoodValue = 20 - currentFoodValue;
    
    if(startFoodValue < 1) {
    startFoodValue = 20 + startFoodValue;
    }
    
    startFoodValue = currentFoodValue - 4;
    
    if(startFoodValue < 1) {
    startFoodValue = 20 + startFoodValue;
    }
    
    if(startFoodValue > 0 && startFoodValue < 13) {
      printFoodValue = startFoodValue + i;
    }
    if(startFoodValue == 13) {
      if(i < 8) {
        printFoodValue = startFoodValue + i;
      }
      if(i >= 8) {
        printFoodValue = startFoodValue + (i-20);
      }
    }
    if(startFoodValue == 14) {
      if(i < 7) {
        printFoodValue = startFoodValue + i;
      }
      if(i >= 7) {
        printFoodValue = startFoodValue + (i-20);
      }
    }
    if(startFoodValue == 15) {
      if(i < 6) {
        printFoodValue = startFoodValue + i;
      }
      if(i >= 6) {
        printFoodValue = startFoodValue + (i-20);
      }
    }
    if(startFoodValue == 16) {
      if(i < 5) {
        printFoodValue = startFoodValue + i;
      }
      if(i >= 5) {
        printFoodValue = startFoodValue + (i-20);
      }
    }
    if(startFoodValue == 17) {
      if(i < 4) {
        printFoodValue = startFoodValue + i;
      }
      if(i >= 4) {
        printFoodValue = startFoodValue + (i-20);
      }
    }
    if(startFoodValue == 18) {
      if(i < 3) {
        printFoodValue = startFoodValue + i;
      }
      if(i >= 3) {
        printFoodValue = startFoodValue + (i-20);
      }
    }
    if(startFoodValue == 19) {
      if(i < 2) {
        printFoodValue = startFoodValue + i;
      }
      if(i >= 2) {
        printFoodValue = startFoodValue + (i-20);
      }
    }
    if(startFoodValue == 20) {
      if(i < 1) {
        printFoodValue = startFoodValue + i;
      }
      if(i >= 1) {
        printFoodValue = startFoodValue + (i-20);
      }
      
    }
    
    if(startFoodValue == 17) {
      currentFoodValue = 1;  
    }
    if(startFoodValue == 16) {
      currentFoodValue = 20;  
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
    
    text(printFoodValue, foodX[i], foodY);
    
  }
  
  popStyle();//restore previous style
}

void coalNumbers() {

}
