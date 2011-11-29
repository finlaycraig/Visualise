  PFont font;
  
  Timer timer;
  
  int m;
  
  int n;
  
  float s;
  
  float radSec;
  
  int currentArrayPosition = 9000;//the pointer for where all the data is measured from on the graphs
  
  int previousTempX;
  int previousTempY;

  float [] temps = {10,-23,-150,-9,-74,-55,-13,-33,-10};
  float [] tempsRange = {-100000,-90,-80,-70,-60,-50,-40,-30,-20,-10,100000};
  
  float[] tempsData = new float[10000];//array for temperature values
  float[] pressureData = new float[10000];//array for pressure values
  int[] tempColourR = {1,2,3,4,5,6,7,8,9,10};//Red colour value for temps
  int[] tempColourG = {1,2,3,4,5,6,7,8,9,10};//Green colour value for temps
  int[] tempColourB = {1,2,3,4,5,6,7,8,9,10};//Blue colour value for temps
  
  float[] icePressureLevel = {290, 304.5, 319, 333.5, 348, 362.5, 377, 391.5, 406, 420.5, 435}; //array for ice pressure levels to draw on arc
  float[] icePressureRange = {-999999999,2,3,4,5,6,7,8,9,10,11,999999999}; //array for ice pressure ranges to compare with current ice pressure
  int[] startRadian = {270,315,0,45,90,135,180}; //array for where each radian starts to draw arc
  int[] endRadian = {315,360,45,90,135,180,225}; //array for where each radian stops to draw arc
  
  float[] windDirection = new float[10000];//array for wind direction
  float[] windSpeed = new float[10000];//array for wind speed
  float[] windOff = new float[10000];//array for wind speed
  
  boolean tempsRising = false;
  int tempsRisingFor;
  int tempsRisingForCounter;
  
  int[] AHourX = {512,512,512,512,512,512,512,512,512,512}; 
  int[] AHourY = {308,301,294,287,280,273,266,259,252,245};
  
  int[] BHourX = {566,571,576,581,586,591,596,601,606,611};
  int[] BHourY = {330,325,320,315,310,305,300,295,290,285};
  
  int[] CHourX = {589,596,603,610,617,624,631,638,645,652};
  int[] CHourY = {384,384,384,384,384,384,384,384,384,384};
  
  int[] DHourX = {566,571,576,581,586,591,596,601,606,611};
  int[] DHourY = {439,444,449,454,459,464,469,474,479,484};
  
  int[] EHourX = {512,512,512,512,512,512,512,512,512,512};
  int[] EHourY = {461,468,475,482,489,496,503,510,517,524};
  
  int[] FHourX = {458,453,448,443,438,433,428,423,418,413};
  int[] FHourY = {438,443,448,453,458,463,468,473,478,483};
  
  int[] GHourX = {435,428,421,414,407,400,393,386,379,372};
  int[] GHourY = {384,384,384,384,384,384,384,384,384,384};
  
  int[] HHourX = {457,452,447,442,437,432,427,422,417,412};
  int[] HHourY = {330,325,320,315,310,305,300,295,290,285};
  
  int food = 7;
  int men = 24;
  int coal = 13;
  
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
  
  generateData();
  
  size(1024, 768);
  smooth();
  
  font = loadFont("Century-18.vlw");
  textFont(font);
  
  timer = new Timer(60000);
  timer.start();
  
  myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.bufferUntil('\n');
  
  mainDial();
  
}

void draw() {
   
  //background(165,165,165);
  
  //mainDial();

  if (timer.isFinished()) {
    
      currentArrayPosition--;
      
      timer.start();      
  }
  
  
  
  mainDial();
  
  
  
  leftDials();
  
  
  
  pushStyle();
  
  gaugesStatic();
  gaugesDynamic();
   
  popStyle();
  
  food = currentFoodValue;
  men = currentMenValue;
  coal = currentCoalValue;
  
  
  timeMarker();//moving green dot
   
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

void mainDial() {
 
  activeGraphics();
 
  textMarkings();
  
  //OUTER CIRCLES
  
  ellipse(862,184,145,145);//right 1
  ellipse(912,384,145,145);//right 2
  ellipse(862,584,145,145);//right 3

  //END OF OUTER CIRLCES
  
}

void leftDials() {
  
 pushStyle();
 fill(239,233,208);
 ellipse(125,228,145,145);//left 1
 ellipse(125,540,145,145);//left 2
 popStyle();
 
// int menFood = 145/(men+food);
 
// men = (145/(47/30) * currentMenValue);
// food = ((145/(30/47)) * currentFoodValue);
float coal = map(currentCoalValue, 1, 20, 1, 145);
 
 pushStyle();
 fill(167,0,11);
 noStroke();
 arc(125,228,men,men,radians(270),radians(450));
// ellipse(125,228,145,145);
 popStyle();
 
 pushStyle();
 fill(10,167,0);
 noStroke();
 arc(125,228,food,food,radians(90),radians(270));
// ellipse(125,228,menFood*food,menFood*food);
 popStyle();
 
 pushStyle();
 fill(10,167,0);
 noStroke();
 ellipse(125,540,coal,coal);
 popStyle();
 
 
  
}

void rightDials() {
 
 
  
}

void gaugesStatic() {
  
  fill(239,233,208);//apply fill colour to ellipses
  menGauge();
  foodGauge();
  coalGauge();
}

void menGauge() {
  
  if(rotarySwitchVal == 1) {
  
  pushStyle();  
    
  stroke(180,0,0);
  strokeWeight(8);
   
  ellipse(862, 184, 145, 145);//men circle
  
  popStyle();
  
  }
  
  else {
   
    ellipse(862, 184, 145, 145);//men circle
    
  }
  
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
  text("(KG x 10³)",912,414);
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

void activeGraphics() {
 
  background(165,165,165);
   
  ellipse(512, 384, 580, 580);//outer circle
  ellipse(512, 384, 435, 435);//wind
  
  icePressure(); //draw the ice pressure arcs
 
  //CIRCLE REDRAWS AFTER PRESSURE ARCS
  ellipse(512, 384, 290, 290);//pressure
  dashedLines();//draw the dashed measurement lines  

  //END OF CIRCLE REDRAWS AFTER PRESSURE ARCS
  
  pushStyle();//save previous style
  strokeWeight(3);//define stroke for startline only
  stroke(165, 0, 0);//define stroke colour for startline only
 
  line(510,311,510,93);//red startline  
  popStyle();//restore previous style
  
  tempCoords();
    
  plotTempsAndLines();
  
  ellipse(512, 384, 145, 145);//centre circle drawn after temp points are plotted to ensure any lowest to lowest values don't draw a line over the centre circle.
  
  windSpeed();

}

void plotTempsAndLines() {
  
  pushStyle();
  
  fill(0,52,180);
  stroke(0,52,180);
  
//   println(tempsData[currentArrayPosition]);
//   println(tempsData[currentArrayPosition+1]);  
 
 for(int i=currentArrayPosition; i<(currentArrayPosition+9); i++) { //going through temps
 
//print(tempsData[currentArrayPosition]);
//print(',');
   
    for(int h=0; h<10; h++) { //going through tempsRange
    

  
    if(tempsData[i] >= tempsRange[h] && tempsData[i] < tempsRange[h+1]) {
    
      if(i==currentArrayPosition) {
      
        pushStyle();
        
        stroke(185,185,185);
        
        popStyle();
        
        previousTempX = AHourX[h];
        previousTempY = AHourY[h];
         
        ellipse(AHourX[h],AHourY[h],5,5);
        
      }
      
      else if(i==(currentArrayPosition+1)) {
        
        pushStyle();
        
        stroke(185,185,185);

        line(previousTempX, previousTempY, BHourX[h],BHourY[h]);
        
        popStyle();
        
        ellipse(previousTempX,previousTempY,5,5);
        
        previousTempX = BHourX[h];
        previousTempY = BHourY[h];
          
        ellipse(BHourX[h],BHourY[h],5,5);
         
      }
      
      else if(i==(currentArrayPosition+2)) {
      
        pushStyle();
        
        stroke(185,185,185);

        line(previousTempX, previousTempY, CHourX[h],CHourY[h]);
        
        popStyle();
        
        ellipse(previousTempX,previousTempY,5,5);
        
        previousTempX = CHourX[h];
        previousTempY = CHourY[h];
        
        ellipse(CHourX[h],CHourY[h],5,5);
        
      }
      
      else if(i==(currentArrayPosition+3)) {
         
        pushStyle();
        
        stroke(185,185,185);

        line(previousTempX, previousTempY, DHourX[h],DHourY[h]);
        
        popStyle();
        
        ellipse(previousTempX,previousTempY,5,5);
        
        previousTempX = DHourX[h];
        previousTempY = DHourY[h];
        
        ellipse(DHourX[h],DHourY[h],5,5);
       
      }
      
      else if(i==(currentArrayPosition+4)) {
      
        pushStyle();
        
        stroke(185,185,185);

        line(previousTempX, previousTempY, EHourX[h],EHourY[h]);
        
        popStyle();
        
        ellipse(previousTempX,previousTempY,5,5);
        
        previousTempX = EHourX[h];
        previousTempY = EHourY[h];
        
        ellipse(EHourX[h],EHourY[h],5,5);
        
      }
      
      else if(i==(currentArrayPosition+5)) {
              
        pushStyle();
        
        stroke(185,185,185);

        line(previousTempX, previousTempY, FHourX[h],FHourY[h]);
        
        popStyle();
        
        ellipse(previousTempX,previousTempY,5,5);
        
        previousTempX = FHourX[h];
        previousTempY = FHourY[h];
        
        ellipse(FHourX[h],FHourY[h],5,5);
        
      }
      
      else if(i==(currentArrayPosition+6)) {
         
        pushStyle();
        
        stroke(185,185,185);

        line(previousTempX, previousTempY, GHourX[h],GHourY[h]);
        
        popStyle();
        
        ellipse(previousTempX,previousTempY,5,5);
        
        previousTempX = GHourX[h];
        previousTempY = GHourY[h];
        
        ellipse(GHourX[h],GHourY[h],5,5);
        
      }
      
      else if(i==(currentArrayPosition+7)) {
      
        pushStyle();
        
        stroke(185,185,185);

        line(previousTempX, previousTempY, HHourX[h],HHourY[h]);
        
        popStyle();
        
        ellipse(previousTempX,previousTempY,5,5);
        
        previousTempX = HHourX[h];
        previousTempY = HHourY[h];
        
        ellipse(HHourX[h],HHourY[h],5,5);
        
      }
           
    }
     
    }
    
 }
 
 popStyle();
  
}

void tempCoords() {
  
  for(int j=0; j<=9; j++) {
        
     ellipse(AHourX[j],AHourY[j],5,5);
      
     ellipse(BHourX[j],BHourY[j],5,5);
     
     ellipse(CHourX[j],CHourY[j],5,5);
     
     ellipse(DHourX[j],DHourY[j],5,5);
     
     ellipse(EHourX[j],EHourY[j],5,5);
     
     ellipse(FHourX[j],FHourY[j],5,5);
     
     ellipse(GHourX[j],GHourY[j],5,5);
     
     ellipse(HHourX[j],HHourY[j],5,5);
          
  }
  
}

void icePressure() { // this method draws the ice pressure arcs

  pushStyle(); //save previous style
 
  noStroke(); //no stroke for arcs
  fill(60, 100, 220); //fill colour blue
  
//  println(currentArrayPosition);
  
  for(int i = 0; i <7; i++) { //7
  
    for(int k = 0; k < icePressureLevel.length; k++) { //11
    
      if(pressureData[currentArrayPosition+i] >= icePressureRange[k] && pressureData[currentArrayPosition+i] < icePressureRange[k+1]) {
        //if(pressureData[i] >= icePressureRange[k] && pressureData[i] < icePressureRange[k+1]) {
        arc(width/2, height/2, icePressureLevel[k], icePressureLevel[k], radians(startRadian[i]), radians(endRadian[i]));
        
      }
      
    }
    
  }
  
  popStyle(); //restore previous style
   
}

void timeMarker() {

  translate(width/2,height/2);
  
  //radSec = 360/8 * millis()/1000;
  
  radSec = (36.0/6000.0)*timer.timePassed();
  
  //println(radSec);
  
  pushMatrix();
  rotate(radians(radSec)*4);
  pushStyle();
  strokeWeight(1);
  fill(160,0,0);
  //ellipse(0,-72,5,5);
  triangle(-3,-69,-3,-72,3,-72);
  popStyle();
  popMatrix();
  
  pushMatrix();
  rotate(radians(radSec)*6);
  pushStyle();
  strokeWeight(1);
  //stroke(7,165,0);
  fill(7,165,0);
  //ellipse(0,-144,5,5);
  triangle(-3,-141,-3,-144,3,-144);
  popStyle();
  popMatrix();
  //float radSec2 = 360/8 * second();
  
  pushMatrix();
  rotate(radians(radSec)*2);
  pushStyle();
  strokeWeight(1);
  fill(240,121,0);
  //ellipse(0,-217,5,5);
  triangle(-3,-214,-3,-217,3,-217);
  popStyle();
  popMatrix();
  
  
  pushMatrix();
  rotate(radians(radSec));
  pushStyle();
  strokeWeight(1);
  fill(165,0,175);
  //ellipse(0,-288,5,5);
  triangle(-3,-285,-3,-288,3,-288);
  popStyle();
  
  popMatrix();

}

void windSpeed() {
 
 for(int i = 0; i<7; i++) {
   
   if(windSpeed[currentArrayPosition]>65) {
    
     windSpeed[currentArrayPosition] = 65;
     
   }
   
   pushMatrix();//prep. for text rotation
    
   translate(width/2, height/2);
   rotate((PI/8)+(PI/4)*i);
   
   pushStyle();
   //fill(155,175,255);
   //fill(112,111,111);//apply fill colour to text
   fill(169,206,182);
   noStroke();
   arc(0,-252,windSpeed[currentArrayPosition+i],windSpeed[currentArrayPosition+i],radians(windDirection[currentArrayPosition+i]-windOff[currentArrayPosition+i]),radians(windDirection[currentArrayPosition+i]+windOff[currentArrayPosition+i]));
   
   popStyle();
   
   pushStyle();
   
   fill(135,135,135);
   noStroke();
   ellipse(0,-252,5,5);
   
   popStyle();
   
   popMatrix();
   
 }
  
}


//BELOW IS STATIC GRAPHICS FOR SETUP OF CIRCLE. 

void circlesAndLines() {
 
  ellipse(512, 384, 580, 580);//outer circle
  ellipse(512, 384, 435, 435);//wind
  
  ellipse(512, 384, 290, 290);//pressure
  dashedLines();//draw the dashed measurement lines  
  ellipse(512, 384, 145, 145);//centre circle
  
  pushStyle();//save previous style
  
  strokeWeight(3);//define stroke for startline only
  stroke(165, 0, 0);//define stroke colour for startline only
    
  line(510,311,510,93);//red startline
  
  popStyle();//restore previous style
  
}

void dashedLines() {
  //line 1
  int x1 = 512;
  int y1 = 94;
  int x2 = 512;
  int y2 = 674;
  for (int i=0; i<=80; i++) {
    float x = lerp(x1, x2, i/80.0);
    float y = lerp(y1, y2, i/80.0);
    point(x, y);
  }
  //end of line 1
  
  //line 2
   x1 = 222;
   y1 = 384;
   x2 = 802;
   y2 = 384;
  for (int i=0; i<=80; i++) {
    float x = lerp(x1, x2, i/80.0);
    float y = lerp(y1, y2, i/80.0);
    point(x, y);
  }
  //end of line 2
  
   //line 3   
   x1 = 717;
   y1 = 180;
   x2 = 307;
   y2 = 590;
  for (int i=0; i<=80; i++) {
    float x = lerp(x1, x2, i/80.0);
    float y = lerp(y1, y2, i/80.0);
    point(x, y);
  }

  
  //end of line 3
  
  //line 4
   x1 = 307;
   y1 = 180;
   x2 = 717;
   y2 = 590;

  for (int i=0; i<=80; i++) {
    float x = lerp(x1, x2, i/80.0);
    float y = lerp(y1, y2, i/80.0);
    point(x, y);
  }
  //end of line 4
  
}

void textMarkings() {
  
 pushStyle();//save previus style
 
 fill(112,111,111);//apply fill colour to text
 stroke(112,111,111);
 textSize(10);
 
 //hour markings
 
 text("0H",504,325);//zero-hour indicator
 text("0.5H",540,344);//half-hour indicator
 text("1H",566,390);//one-hour indicator
 text("1.5H",540,433);//hour-and-a-half indicator
 text("2H",504,452);//two-hour indicator
 text("2.5H",462,433);//two-and-a-half-hours indicator
 text("3H",444,390);//three-hour indicator
 text("3.5H",462,344);//half-hour indicator
 
 //hour markings
 
 //temperature markings
  
  pushMatrix();//prep. for text rotation
  
  translate(width/2, height/2);
  rotate(PI/-8.0);
  text("Temp (˚C)",-27,-102); 
  
  popMatrix();//end of rotation
  
  text("-100˚",483,311);//-10 degrees celcius
  text("-50˚",490,280);//-10 degrees celcius
  text("0˚",498,250);
 
 //end of temperature markings
 
  //ice thickness markings
  
  pushMatrix();//prep. for text rotation
  
  translate(width/2, height/2);
  rotate(PI/-8.0);
  text("Ice Pressure",-30,-180); 
  
  popMatrix();//end of rotation
  
  text("0 kPa",478,237);//
  text("6 kPa",478,210);//
  text("+12 kPa",468,180);
 
 //end of ice thickness markings
 
 //wind speed markings
  
  pushMatrix();//prep. for text rotation
  
  translate(width/2, height/2);
  rotate(PI/-8.0);
  
  text("Wind Speed",-30,-250);
  text("MPH",65,-255);
  
  
  text("n",-5,-283);
  text("s",-5,-220);
  
  text("w",-95,-233);
  text("e",85,-233);
  
  popMatrix();
  
  noFill();
  arc(445,140, 20, 20,radians(0-90),radians(0));
  arc(445,140, 40, 40,radians(0-90),radians(0));
  arc(445,140, 60, 60,radians(0-90),radians(0));
  
  pushMatrix();
  
  translate(width/2,height/2);
  rotate(radians(-90));
  
  text("30",230,-55);
  text("60",230,-45);
  text("+90",223,-35);
  
  popMatrix();

  popStyle();//reload previous style
  
  //end of wind speed markings
 
}

//END OF STATIC GRAPHICS

//RANDOM NUMBER GENERATORS FOR TEMPS, PRESSURE AND WIND

void generateData() {
    
  tempsRisingFor = round(random(1,3));
  tempsRisingForCounter = 0;
  
  tempsData[0] = round(random(-100,0));
  pressureData[0] = round(((-tempsData[0]/10))*pow(1,2));
  
  windDirection[0] = round(random(0,360));
  windSpeed[0] = round(random(15,70));
  windOff[0] = round(random(0,100));
   
  for(int i = 1; i<9999; i++) {
    
  windDirection[i] = round(random(0,360));
  windSpeed[i] = round(random(0,70));
  windOff[i] = round(random(0,100));
    
    if(tempsRising) {
       
       //tempsData[i] = round(-(tempsData[i-1]*0.3)-(tempsData[i-1]*1.5));
       tempsData[i] = round((tempsData[i-1]*1.5));
       pressureData[i] = round(((-tempsData[i]/10))*pow(1,3));
       tempsRisingForCounter++;
       
       if(tempsData[i] < -100) {
         
         tempsData[i] = -100;
         pressureData[i] = 100;
       
       }
       
       if(tempsData[i] >= 0) {
         
         tempsData[i] = -10;
         pressureData[i] = 0;
       
       }
       
       if(tempsRisingForCounter == tempsRisingFor) {
       
         tempsRising = false;
         tempsRisingFor = round(random(3,6));
         tempsRisingForCounter = 0;
       
       }
      
    }
    
    else {
      
      tempsData[i] = round(tempsData[i-1]*2.1);
      pressureData[i] = round(((-tempsData[i]/10))*pow(1,2));
      
      tempsRisingForCounter++;
      
      if(tempsData[i] <= -100) {
         
         tempsData[i] = -round(random(-50,-65));
         pressureData[i] = 5;
       
     }
     
     if(tempsData[i] > 0) {
         
         tempsData[i] =round(random(-45,-50));
         pressureData[i] = 5;
       
       }
      
      if(tempsRisingForCounter == tempsRisingFor) {
       
         tempsRising = true;
         tempsRisingFor = round(random(1,3));
         tempsRisingForCounter = 0;
       
       }
      
    }
    
  }
    
}

//END OF RANDOM NUMBER GENERATORS FOR TEMPS, PRESSURE AND WIND
