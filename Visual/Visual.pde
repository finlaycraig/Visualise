  PFont font;
  
  int m;
  
  int n;
  
  float s;
  
  int previousTempX;
  int previousTempY;

  float [] temps = {10,-23,-150,-9,-74,-55,-13,-33,-10};
  float [] tempsRange = {-100000,-90,-80,-70,-60,-50,-40,-30,-20,-10,100000};
  
  float[] tempsData = new float[10000];
  float[] pressureData = new float[10000];
  
  boolean tempsRising = false;
  int tempsRisingFor;
  int tempsRisingForCounter;

//float [] currentIcePressure = {2, 2, 1, 4, 5, 6, 7, 8}; //array for live data feed of current ice pressure, latest at [0]

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
  
  //int[] GHourX = {372,379,386,393,400,407,414,421,428,435};
  int[] GHourX = {435,428,421,414,407,400,393,386,379,372};
  int[] GHourY = {384,384,384,384,384,384,384,384,384,384};
  
  int[] HHourX = {457,452,447,442,437,432,427,422,417,412};
  int[] HHourY = {330,325,320,315,310,305,300,295,290,285};
  
//  int[] IHourX = {457,452,447,442,437,432,427,422,417,412};
//  int[] IHourY = {330,325,320,315,310,305,300,295,290,285};

void setup() {
  
  generateData();

  size(1024, 768);
  smooth();
  
  font = loadFont("Century-10.vlw");
  textFont(font);
  
  //staticGraphics();
  
}

void draw() {
  
  

  //delay(1000);
  
  
  
 // delay(1000);
  
  //staticGraphics();
  
//   pushMatrix();
//   
//   while(s<1) {
//   
//   s = s + 0.01;
//  
//  translate(0,0);
//  scale(s); 
//  
//   }

   staticGraphics();

  activeGraphics();
 
   textMarkings();
   
//   popMatrix();

// 
//   translate(width/2, height/2);
//   rotate(tempRadians);
//ellipse(372,384,7,7);

translate(width/2,height/2);



  // degrees divided by number of second marks per round
  //float radSec = 360 / 60 * (second()+(1-millis()));
  float radSec = 360 / 60 * millis()/250;
  println(millis());
  pushMatrix();
  rotate(radians(radSec));
  //line(0, 0, 0, -72);
  pushStyle();
  strokeWeight(1);
  fill(7,165,0);
  ellipse(0,-72,5,5);
  popStyle();
  popMatrix();
}

void staticGraphics() {
 
 circlesAndLines();
 
 //plotTemps();  
  
  
  
}

//  void circlesAndLines() {
// 
//  ellipse(512, 384, 580, 580);//outer circle
//  ellipse(512, 384, 435, 435);//wind
//  
//  ellipse(512, 384, 290, 290);//pressure
//  dashedLines();//draw the dashed measurement lines  
//  ellipse(512, 384, 145, 145);//centre circle
//  
//  pushStyle();//save previous style
//  
//  strokeWeight(3);//define stroke for startline only
//  stroke(165, 0, 0);//define stroke colour for startline only
//  
//  //line(512,311, 512,239);
//  
//  line(510,311,510,93);//red startline
//  
//  popStyle();//restore previous style
//  
//}

void activeGraphics() {
  
  
 
  
  
  background(165,165,165);
  
  //textMarkings(); 
  
  ellipse(512, 384, 580, 580);//outer circle
  ellipse(512, 384, 435, 435);//wind
  
//  pushMatrix();
//  
//  translate(422,-249);
//  
//  rotate(PI/4);
  
  icePressure(); //draw the ice pressure arcs
  
//  popMatrix();
 
  //CIRCLE REDRAWS AFTER PRESSURE ARCS
  ellipse(512, 384, 290, 290);//pressure
  dashedLines();//draw the dashed measurement lines  
  ellipse(512, 384, 145, 145);//centre circle
  //END OF CIRCLE REDRAWS AFTER PRESSURE ARCS
  
  pushStyle();//save previous style
  strokeWeight(3);//define stroke for startline only
  stroke(165, 0, 0);//define stroke colour for startline only
 
//line(512,311, 512,239);
 
  line(510,311,510,93);//red startline  
  popStyle();//restore previous style
  
  tempCoords();
  
//  pushMatrix();
//  
//  translate(422,-249);
//  
//  rotate(PI/4);
  
  
  
  plotTempsAndLines();
  
//  popMatrix();
  
  //textMarkings();
  
  
  
}

//void plotTemps() {//this method plots the points of temperature taken from the array
// 
// int tempStartX = 0;
// int tempStartY = -108;
// 
// float previousX = 0;
// float previousY = temps[0];
// 
// float tempRadians = -PI;
// 
// for(int k=0; k<=7; k++) {
//   
//   pushMatrix();
// 
//   translate(width/2, height/2);
//   rotate(tempRadians);
//   
//   
//   
//   if(k==0) {//use this if statement to make the first point green.
//     
//   pushStyle();
//   
//   fill(7,165,0);
//    
//   ellipse(0, tempDecode(temps[k]), 5, 5);//draw point
//   
//   popStyle();
//   
//   }
//   
//   else {
//    
//    ellipse(0, tempDecode(temps[k]), 5, 5);//draw point
//     
//   }
// 
//   popMatrix();
//   
//   tempRadians = tempRadians + (PI/4);
//   
//   previousY = tempDecode(temps[k]);
// 
//  }
//  
//}

//public float tempDecode(float yTemp) {
//  
//  if(yTemp == 1) {
//   
//    return 115;
//    
//  } 
//  
//  if(yTemp == 2) {
//   
//    return 120;
//    
//  }
// 
// if(yTemp == 10) {
//   
//    return 140;
//    
//  }  
//  
//  return 115;
//  
//}


void plotTempsAndLines() {
  
  pushStyle();
  
  fill(0,52,180);
  stroke(0,52,180);
  
//       float [] temps = {10,-23,-64,-9,-74,-55,-13,-33,-10};
//  float [] tempsRange = {-100,-90,-80,-70,-60,-50,-40,-30,-20,-10,100000};

//  int[] AHourX = {512,512,512,512,512,512,512,512,512,512}; 
//  int[] AHourY = {308,301,294,287,280,273,266,259,252,245};
 
 for(int i=0; i<9; i++) { //going through temps
   
    for(int h=0; h<10; h++) { //going through tempsRange
  
   // println(temps[i]);
  
    if(tempsData[i] >= tempsRange[h] && tempsData[i] < tempsRange[h+1]) {
    
      if(i==0) {
      
        pushStyle();
        
        stroke(185,185,185);
        
        popStyle();
        
        previousTempX = AHourX[h];
        previousTempY = AHourY[h];
         
        ellipse(AHourX[h],AHourY[h],5,5);
        
      }
      
      else if(i==1) {
        
        pushStyle();
        
        stroke(185,185,185);

        line(previousTempX, previousTempY, BHourX[h],BHourY[h]);
        
        popStyle();
        
        ellipse(previousTempX,previousTempY,5,5);
        
        previousTempX = BHourX[h];
        previousTempY = BHourY[h];
        
        
        ellipse(BHourX[h],BHourY[h],5,5);
         
      }
      
      else if(i==2) {
      
        pushStyle();
        
        stroke(185,185,185);

        line(previousTempX, previousTempY, CHourX[h],CHourY[h]);
        
        popStyle();
        
        ellipse(previousTempX,previousTempY,5,5);
        
        previousTempX = CHourX[h];
        previousTempY = CHourY[h];
        
        ellipse(CHourX[h],CHourY[h],5,5);
        
      }
      
      else if(i==3) {
         
        pushStyle();
        
        stroke(185,185,185);

        line(previousTempX, previousTempY, DHourX[h],DHourY[h]);
        
        popStyle();
        
        ellipse(previousTempX,previousTempY,5,5);
        
        previousTempX = DHourX[h];
        previousTempY = DHourY[h];
        
        ellipse(DHourX[h],DHourY[h],5,5);
       
      }
      
      else if(i==4) {
      
        pushStyle();
        
        stroke(185,185,185);

        line(previousTempX, previousTempY, EHourX[h],EHourY[h]);
        
        popStyle();
        
        ellipse(previousTempX,previousTempY,5,5);
        
        previousTempX = EHourX[h];
        previousTempY = EHourY[h];
        
        ellipse(EHourX[h],EHourY[h],5,5);
        
      }
      
      else if(i==5) {
              
        pushStyle();
        
        stroke(185,185,185);

        line(previousTempX, previousTempY, FHourX[h],FHourY[h]);
        
        popStyle();
        
        ellipse(previousTempX,previousTempY,5,5);
        
        previousTempX = FHourX[h];
        previousTempY = FHourY[h];
        
        ellipse(FHourX[h],FHourY[h],5,5);
        
      }
      
      else if(i==6) {
         
        pushStyle();
        
        stroke(185,185,185);

        line(previousTempX, previousTempY, GHourX[h],GHourY[h]);
        
        popStyle();
        
        ellipse(previousTempX,previousTempY,5,5);
        
        previousTempX = GHourX[h];
        previousTempY = GHourY[h];
        
        ellipse(GHourX[h],GHourY[h],5,5);
        
      }
      
      else if(i==7) {
      
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
 
  float[] icePressureLevel = {290, 304.5, 319, 333.5, 348, 362.5, 377, 391.5, 406, 420.5, 435}; //array for ice pressure levels to draw on arc
  float[] icePressureRange = {-999999999,2,3,4,5,6,7,8,9,10,11,999999999}; //array for ice pressure ranges to compare with current ice pressure
  float[] currentIcePressure = {2.4, 1.12, 4, 11, 7.0, 5, 3}; //array for live data feed of current ice pressure, latest at [0] //TESTER!!!! this code is at top of program
  int[] startRadian = {270,315,0,45,90,135,180}; //array for where each radian starts to draw arc
  int[] endRadian = {315,360,45,90,135,180,225}; //array for where each radian stops to draw arc
  
  pushStyle(); //save previous style
 
  noStroke(); //no stroke for arcs
  fill(60, 100, 220); //fill colour blue
  
  for(int i = 0; i < 7; i++) { //7
    for(int k = 0; k < icePressureLevel.length; k++) { //11
      if(pressureData[i] >= icePressureRange[k] && pressureData[i] < icePressureRange[k+1]) {
        arc(width/2, height/2, icePressureLevel[k], icePressureLevel[k], radians(startRadian[i]), radians(endRadian[i]));
      }
      
    }
  }
  popStyle(); //restore previous style
   
}

//  arc(width/2, height/2, icePressureLevel[i], icePressureLevel[i], radians(270), radians(315)); //1st sector of ice
//  arc(width/2, height/2, icePressureLevel[i], icePressureLevel[i], radians(315), radians(360)); //2nd sector of ice
//  arc(width/2, height/2, icePressureLevel[i], icePressureLevel[i], radians(0), radians(45)); //3rd sector of ice
//  arc(width/2, height/2, icePressureLevel[i], icePressureLevel[i], radians(45), radians(90)); //4th sector of ice
//  arc(width/2, height/2, icePressureLevel[i], icePressureLevel[i], radians(90), radians(135)); //5th sector of ice
//  arc(width/2, height/2, icePressureLevel[i], icePressureLevel[i], radians(135), radians(180)); //6th sector of ice
//  arc(width/2, height/2, icePressureLevel[i], icePressureLevel[i], radians(180), radians(225)); //7th sector of ice


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
  
  //line(512,311, 512,239);
  
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
 
 //hour markings
 
 text("0H",504,325);//zero-hour indicator
 text("0.5H",540,344);//half-hour indicator
 text("1H",566,390);//one-hour indicator
 text("1.5H",540,433);//hour-and-a-half indicator
 text("2H",504,452);//two-hour indicator
 text("2.5H",462,433);//two-and-a-half-hours indicator
 text("3H",444,390);//three-hour indicator
 text("0.5H",462,344);//half-hour indicator
 
 //hour markings
 
 //temperature markings
  
  pushMatrix();//prep. for text rotation
  
  translate(width/2, height/2);
  rotate(PI/-8.0);
  text("Temp (˚C)",-27,-102); 
  
  popMatrix();//end of rotation
  
  text("-100˚",483,311);//-10 degrees celcius
  text("0˚",500,280);//-10 degrees celcius
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
  text("0 MPH",-20,-240);  
  
  popMatrix();//end of rotation
  
  text("+60 MPH",463,107);//top right
  text("+60 MPH",463,165);//bottom right
  
  pushMatrix();//prep. for text rotation
  
  translate(width/2, height/2);
  rotate(-0.8);
  text("+60 MPH",5,-220);
  text("+60 MPH",5,-277);   
  
  popMatrix();//end of rotation
 
 //end of wind speed markings
 
 popStyle();//reload previous style
 
}

//END OF STATIC GRAPHICS

//RANDOM NUMBER GENERATORS FOR ARRAYS


void generateData() {
  
  //generate temperatures
  
  tempsRisingFor = round(random(1,3));
  tempsRisingForCounter = 0;
  
  tempsData[0] = round(random(-100,0));
  pressureData[0] = round(((-tempsData[0]/10))*pow(1,2));
  
  println(tempsData[0]);
  println(pressureData[0]);
   
  for(int i = 1; i<9999; i++) {
    
    if(tempsRising) {
       
       tempsData[i] = round(tempsData[i-1]-(tempsData[i-1]*0.5));
       pressureData[i] = round(((-tempsData[i]/10))*pow(1,2));
       tempsRisingForCounter++;
       
       if(tempsData[i] < -100) {
         
         tempsData[i] = -100;
         pressureData[i] = 100;
       
       }
       
       if(tempsData[i] > 0) {
         
         tempsData[i] = 0;
         pressureData[i] = 0;
       
       }
       
       if(tempsRisingForCounter == tempsRisingFor) {
       
         tempsRising = false;
         tempsRisingFor = round(random(1,3));
         tempsRisingForCounter = 0;
       
       }
      
    }
    
    else {
      
      tempsData[i] = round(tempsData[i-1]*1.5);
      pressureData[i] = round(((-tempsData[i]/10))*pow(1,2));
      
      tempsRisingForCounter++;
      
      if(tempsData[i] < -100) {
         
         tempsData[i] = -100;
         pressureData[i] = 100;
       
     }
     
     if(tempsData[i] > 0) {
         
         tempsData[i] = 0;
         pressureData[i] = 0;
       
       }
      
      if(tempsRisingForCounter == tempsRisingFor) {
       
         tempsRising = true;
         tempsRisingFor = round(random(1,3));
         tempsRisingForCounter = 0;
       
       }
      
    }
    
  }
  
  //end of generate tempatures
  
  //generate pressure values

  

  //end of pressure values
  
}

//END OF RANDOM NUMBER GENERATORS FOR ARRAYS
