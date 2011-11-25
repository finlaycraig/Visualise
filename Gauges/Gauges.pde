PFont font;

import processing.serial.*;
Serial myPort;  // Create object from Serial class

//float fontScale = 10.0;
int[] data; // array of incoming data from arduino

int rotarySwitchVal;
int potentiometerVal;

int potentiometerMenVal;
int potentiometerFoodVal;
int potentiometerCoalVal;


int previousMenVal = 0;
int savedMenChange = 0;
int currentMenValue = 47;
int printMenValue;

int previousFoodVal = 0;
int savedFoodChange = 0;
int currentFoodValue = 30;
int printFoodValue;

int previousCoalVal = 0;
int savedCoalChange = 0;
int currentCoalValue = 20;
int printCoalValue;

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
      
      int rotarySwitchRead = data[1];
      rotarySwitchVal = rotarySwitchRead;
    }
      
    if(rotarySwitchVal == 1) {
      potentiometerMenVal = potentiometerVal;
    }
    if(rotarySwitchVal == 2) {
      potentiometerFoodVal = potentiometerVal;
    }
    if(rotarySwitchVal == 3) {
      potentiometerCoalVal = potentiometerVal;
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
  menGauge();
  foodGauge();
  coalGauge();
}

void menGauge() {
  ellipse(862, 184, 145, 145);//men circle
  
  pushStyle();//save previous style
  fill(77,76,76);//apply fill colour to text
  
  strokeWeight(2);//define stroke for startline only
  stroke(165, 0, 0);//define stroke colour for pointer only
  
  line(862,112,862,174);//red pointer
  popStyle();
  
  pushStyle();
  fill(46,46,46);
  textSize(10);
  textAlign(CENTER);
  text("Men",862,204);
  text("(MEN)",862,214);
  popStyle();//restore previous style
}

void foodGauge() {
  ellipse(912, 384, 145, 145);//food circle
  
  pushStyle();//save previous style
  fill(77,76,76);//apply fill colour to text
  
  strokeWeight(2);//define stroke for startline only
  stroke(165, 0, 0);//define stroke colour for pointer only
  
  line(912,312,912,374);//red pointer
  popStyle();
  
  pushStyle();
  fill(46,46,46);
  textSize(10);
  textAlign(CENTER);
  text("Food",912,404);
  text("(KG)",912,414);
  popStyle();//restore previous style
}

void coalGauge() {
  ellipse(862, 584, 145, 145);//coal circle
  
  pushStyle();//save previous style
  fill(77,76,76);//apply fill colour to text
  
  strokeWeight(2);//define stroke for startline only
  stroke(165, 0, 0);//define stroke colour for pointer only
  
  line(862,512,862,574);//red pointer
  popStyle();
  
  pushStyle();
  fill(46,46,46);
  textSize(10);
  textAlign(CENTER);
  text("Coal",862,604);
  text("(TON)",862,614);
  popStyle();//restore previous style
}

void gaugesDynamic() {
  menNumbers();
  foodNumbers();
  coalNumbers();
}

void menNumbers() {
  int[] menX = {782, 800, 818, 838, 862, 886, 906, 924, 942};
  int menY = 175;
  
  int currentMenVal = potentiometerMenVal;
  
  int changedMenVal = currentMenVal - previousMenVal;
  
  if((previousMenVal >= 0 && previousMenVal < 341) && (currentMenVal > 682 && currentMenVal <= 1023)) {
    changedMenVal = (0 - previousMenVal);
    changedMenVal = changedMenVal + (currentMenVal - 1023);
  }
  if((previousMenVal > 682 && previousMenVal <= 1023) && (currentMenVal >= 0 && currentMenVal < 341)) {
    changedMenVal = (1023 - previousMenVal);
    changedMenVal = changedMenVal + (currentMenVal - 0);
  }
  
  savedMenChange = savedMenChange + changedMenVal;
  
  if(savedMenChange > 300) {
      currentMenValue++;
      savedMenChange = 0;
    }
    
  if(savedMenChange < -300) {
      currentMenValue--;
      savedMenChange = 0;
  }
  
  previousMenVal = currentMenVal;
  
  int startMenValue;
  
  for(int i = 0; i < 9; i++) {
    startMenValue = 60 - currentMenValue;
    
    if(startMenValue < 1) {
    startMenValue = 60 + startMenValue;
    }
    
    startMenValue = currentMenValue - 4;
    
    if(startMenValue < 1) {
    startMenValue = 60 + startMenValue;
    }
    
    if(startMenValue > 0 && startMenValue < 53) {
      printMenValue = startMenValue + i;
    }
    if(startMenValue == 53) {
      if(i < 8) {
        printMenValue = startMenValue + i;
      }
      if(i >= 8) {
        printMenValue = startMenValue + (i-60);
      }
    }
    if(startMenValue == 54) {
      if(i < 7) {
        printMenValue = startMenValue + i;
      }
      if(i >= 7) {
        printMenValue = startMenValue + (i-60);
      }
    }
    if(startMenValue == 55) {
      if(i < 6) {
        printMenValue = startMenValue + i;
      }
      if(i >= 6) {
        printMenValue = startMenValue + (i-60);
      }
    }
    if(startMenValue == 56) {
      if(i < 5) {
        printMenValue = startMenValue + i;
      }
      if(i >= 5) {
        printMenValue = startMenValue + (i-60);
      }
    }
    if(startMenValue == 57) {
      if(i < 4) {
        printMenValue = startMenValue + i;
      }
      if(i >= 4) {
        printMenValue = startMenValue + (i-60);
      }
    }
    if(startMenValue == 58) {
      if(i < 3) {
        printMenValue = startMenValue + i;
      }
      if(i >= 3) {
        printMenValue = startMenValue + (i-60);
      }
    }
    if(startMenValue == 59) {
      if(i < 2) {
        printMenValue = startMenValue + i;
      }
      if(i >= 2) {
        printMenValue = startMenValue + (i-60);
      }
    }
    if(startMenValue == 60) {
      if(i < 1) {
        printMenValue = startMenValue + i;
      }
      if(i >= 1) {
        printMenValue = startMenValue + (i-60);
      }
      
    }
    
    if(startMenValue == 57) {
      currentMenValue = 1;  
    }
    if(startMenValue == 56) {
      currentMenValue = 60;  
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
    
    if(i != 4) {
      pushStyle();//save previous style
      fill(77,76,76);//apply fill colour to text
    }
    if(i == 4) {
      pushStyle();
      fill(46,46,46);
    }
    if(printMenValue <= 45 || printMenValue >= 49) {
      fill(165,0,0);
    }
    text(printMenValue, menX[i], menY);
    popStyle();
  }
}

void foodNumbers() {
  int[] foodX = {832, 850, 868, 888, 912, 936, 956, 974, 992};
  int foodY = 375;
  
  int currentFoodVal = potentiometerFoodVal;
  
  int changedFoodVal = currentFoodVal - previousFoodVal;
  
  if((previousFoodVal >= 0 && previousFoodVal < 341) && (currentFoodVal > 682 && currentFoodVal <= 1023)) {
    changedFoodVal = (0 - previousFoodVal);
    changedFoodVal = changedFoodVal + (currentFoodVal - 1023);
  }
  if((previousFoodVal > 682 && previousFoodVal <= 1023) && (currentFoodVal >= 0 && currentFoodVal < 341)) {
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
  
  int startFoodValue;
  
  for(int i = 0; i < 9; i++) {
    startFoodValue = 30 - currentFoodValue;
    
    if(startFoodValue < 1) {
    startFoodValue = 30 + startFoodValue;
    }
    
    startFoodValue = currentFoodValue - 4;
    
    if(startFoodValue < 1) {
    startFoodValue = 30 + startFoodValue;
    }
    
    if(startFoodValue > 0 && startFoodValue < 23) {
      printFoodValue = startFoodValue + i;
    }
    if(startFoodValue == 23) {
      if(i < 8) {
        printFoodValue = startFoodValue + i;
      }
      if(i >= 8) {
        printFoodValue = startFoodValue + (i-30);
      }
    }
    if(startFoodValue == 24) {
      if(i < 7) {
        printFoodValue = startFoodValue + i;
      }
      if(i >= 7) {
        printFoodValue = startFoodValue + (i-30);
      }
    }
    if(startFoodValue == 25) {
      if(i < 6) {
        printFoodValue = startFoodValue + i;
      }
      if(i >= 6) {
        printFoodValue = startFoodValue + (i-30);
      }
    }
    if(startFoodValue == 26) {
      if(i < 5) {
        printFoodValue = startFoodValue + i;
      }
      if(i >= 5) {
        printFoodValue = startFoodValue + (i-30);
      }
    }
    if(startFoodValue == 27) {
      if(i < 4) {
        printFoodValue = startFoodValue + i;
      }
      if(i >= 4) {
        printFoodValue = startFoodValue + (i-30);
      }
    }
    if(startFoodValue == 28) {
      if(i < 3) {
        printFoodValue = startFoodValue + i;
      }
      if(i >= 3) {
        printFoodValue = startFoodValue + (i-30);
      }
    }
    if(startFoodValue == 29) {
      if(i < 2) {
        printFoodValue = startFoodValue + i;
      }
      if(i >= 2) {
        printFoodValue = startFoodValue + (i-30);
      }
    }
    if(startFoodValue == 30) {
      if(i < 1) {
        printFoodValue = startFoodValue + i;
      }
      if(i >= 1) {
        printFoodValue = startFoodValue + (i-30);
      }
      
    }
    
    if(startFoodValue == 27) {
      currentFoodValue = 1;  
    }
    if(startFoodValue == 26) {
      currentFoodValue = 30;  
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
    
    if(i != 4) {
      pushStyle();//save previous style
      fill(77,76,76);//apply fill colour to text
    }
    if(i == 4) {
      pushStyle();
      fill(46,46,46);
    }
    if(printFoodValue <= 10) {
      fill(165,0,0);
    }
    text(printFoodValue, foodX[i], foodY);
    popStyle();
  }
}

void coalNumbers() {
  int[] coalX = {782, 800, 818, 838, 862, 886, 906, 924, 942};
  int coalY = 575;
  
  int currentCoalVal = potentiometerCoalVal;
  
  int changedCoalVal = currentCoalVal - previousCoalVal;
  
  if((previousCoalVal >= 0 && previousCoalVal < 341) && (currentCoalVal > 682 && currentCoalVal <= 1023)) {
    changedCoalVal = (0 - previousCoalVal);
    changedCoalVal = changedCoalVal + (currentCoalVal - 1023);
  }
  if((previousCoalVal > 682 && previousCoalVal <= 1023) && (currentCoalVal >= 0 && currentCoalVal < 341)) {
    changedCoalVal = (1023 - previousCoalVal);
    changedCoalVal = changedCoalVal + (currentCoalVal - 0);
  }
  
  savedCoalChange = savedCoalChange + changedCoalVal;
  
  if(savedCoalChange > 300) {
      currentCoalValue++;
      savedCoalChange = 0;
    }
    
  if(savedCoalChange < -300) {
      currentCoalValue--;
      savedCoalChange = 0;
  }
  
  previousCoalVal = currentCoalVal;
  
  int startCoalValue;
  
  for(int i = 0; i < 9; i++) {
    startCoalValue = 20 - currentCoalValue;
    
    if(startCoalValue < 1) {
    startCoalValue = 20 + startCoalValue;
    }
    
    startCoalValue = currentCoalValue - 4;
    
    if(startCoalValue < 1) {
    startCoalValue = 20 + startCoalValue;
    }
    
    if(startCoalValue > 0 && startCoalValue < 13) {
      printCoalValue = startCoalValue + i;
    }
    if(startCoalValue == 13) {
      if(i < 8) {
        printCoalValue = startCoalValue + i;
      }
      if(i >= 8) {
        printCoalValue = startCoalValue + (i-20);
      }
    }
    if(startCoalValue == 14) {
      if(i < 7) {
        printCoalValue = startCoalValue + i;
      }
      if(i >= 7) {
        printCoalValue = startCoalValue + (i-20);
      }
    }
    if(startCoalValue == 15) {
      if(i < 6) {
        printCoalValue = startCoalValue + i;
      }
      if(i >= 6) {
        printCoalValue = startCoalValue + (i-20);
      }
    }
    if(startCoalValue == 16) {
      if(i < 5) {
        printCoalValue = startCoalValue + i;
      }
      if(i >= 5) {
        printCoalValue = startCoalValue + (i-20);
      }
    }
    if(startCoalValue == 17) {
      if(i < 4) {
        printCoalValue = startCoalValue + i;
      }
      if(i >= 4) {
        printCoalValue = startCoalValue + (i-20);
      }
    }
    if(startCoalValue == 18) {
      if(i < 3) {
        printCoalValue = startCoalValue + i;
      }
      if(i >= 3) {
        printCoalValue = startCoalValue + (i-20);
      }
    }
    if(startCoalValue == 19) {
      if(i < 2) {
        printCoalValue = startCoalValue + i;
      }
      if(i >= 2) {
        printCoalValue = startCoalValue + (i-20);
      }
    }
    if(startCoalValue == 20) {
      if(i < 1) {
        printCoalValue = startCoalValue + i;
      }
      if(i >= 1) {
        printCoalValue = startCoalValue + (i-20);
      }
      
    }
    
    if(startCoalValue == 17) {
      currentCoalValue = 1;  
    }
    if(startCoalValue == 16) {
      currentCoalValue = 20;  
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

    if(i != 4) {
      pushStyle();//save previous style
      fill(77,76,76);//apply fill colour to text
    }
    if(i == 4) {
      pushStyle();
      fill(46,46,46);
    }
    if(printCoalValue <= 5) {
      fill(165,0,0);
    }
    text(printCoalValue, coalX[i], coalY);
    popStyle();
  }
}
