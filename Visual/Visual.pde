PFont font;

int m;

int n;

int previousTempX;
int previousTempY;

  float [] temps = {-90,-23,-64,-9,-74,-55,-13,-100,-33};
  float [] tempsRange = {-1000,-80,-70,-60,-50,-40,-30,-20,-10,0};

//float [] currentIcePressure = {2, 2, 1, 4, 5, 6, 7, 8}; //array for live data feed of current ice pressure, latest at [0]

<<<<<<< HEAD
  int[] AHourX = {512,512,512,512,512,512,512,512,512,512}; 
=======
  float[] icePressureLevel = {290, 304.5, 319, 333.5, 348, 362.5, 377, 391.5, 406, 420.5, 435}; //array for ice pressure levels
  float[] icePressureRange = {1,2,3,4,5,6,7,8,9,10,11}; //array for ice pressure ranges to compare
  float[] currentIcePressure = {2,1,3,5,8,11,15,0,-5,6}; //TESTER!!!! this code is at top of program
  int[] startRadian = {270,315,0,45,90,135,180};
  int[] endRadian = {315,360,45,90,135,180,225};



int[] AHourX = {512,512,512,512,512,512,512,512,512,512}; 
>>>>>>> More Non-Working Code
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
  
  int[] GHourX = {372,379,386,393,400,407,414,421,428,435};
  int[] GHourY = {384,384,384,384,384,384,384,384,384,384};
  
  int[] HHourX = {457,452,447,442,437,432,427,422,417,412};
  int[] HHourY = {330,325,320,315,310,305,300,295,290,285};
  
//  int[] IHourX = {457,452,447,442,437,432,427,422,417,412};
//  int[] IHourY = {330,325,320,315,310,305,300,295,290,285};

void setup() {

  size(1024, 768);
  smooth();
  
  font = loadFont("Century-10.vlw");
  textFont(font);
  staticGraphics();
  
  tempCoords();
  
  plotTempsAndLines();
  
}

void draw() {

<<<<<<< HEAD
  
=======
//  plotTempsAndLines();
>>>>>>> More Non-Working Code
   
}

void staticGraphics() {
 
  
  
 circlesAndLines();
 
 textMarkings(); 
 

 
 //plotTemps();  
  
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
 
 for(int i=0; i<9; i++) {
   
    for(int h=0; h<9; h++) {
  
    if(temps[i] >= tempsRange[h] && temps[i] <= tempsRange[h+1]) {
    
      if(i==0) {
      
        ellipse(AHourX[h],AHourY[h],5,5);
        
        if(h==0) {
          
          previousTempX = AHourX[h];
          previousTempY = AHourY[h];
        
      }
        
        pushStyle();
        
        stroke(185,185,185);
        
        line(previousTempX, previousTempY, AHourX[h],AHourY[h]);
        
        popStyle();
        
        previousTempX = AHourX[h];
        previousTempY = AHourY[h];
        
      }
      
      else if(i==1) {
      
        ellipse(BHourX[h],BHourY[h],5,5);
        
        if(h==0) {
          
          previousTempX = BHourX[h];
          previousTempY = BHourY[h];
        
      }

        pushStyle();
        
        stroke(185,185,185);

        line(previousTempX, previousTempY, BHourX[h],BHourY[h]);
        
        popStyle();
        
        previousTempX = BHourX[h];
        previousTempY = BHourY[h];
         
      }
      
      else if(i==2) {
      
        ellipse(CHourX[h],CHourY[h],5,5);
       
        if(h==0) {
          
          previousTempX = CHourX[h];
          previousTempY = CHourY[h];
        
      }
      
        pushStyle();
        
        stroke(185,185,185);

        line(previousTempX, previousTempY, CHourX[h],CHourY[h]);
        
        popStyle();
        
        previousTempX = CHourX[h];
        previousTempY = CHourY[h];
        
      }
      
      else if(i==3) {
      
        ellipse(DHourX[h],DHourY[h],5,5);
        
        if(h==0) {
          
          previousTempX = DHourX[h];
          previousTempY = DHourY[h];
        
      }
      
        pushStyle();
        
        stroke(185,185,185);

        line(previousTempX, previousTempY, DHourX[h],DHourY[h]);
        
        popStyle();
        
        previousTempX = DHourX[h];
        previousTempY = DHourY[h];
       
      }
      
      else if(i==4) {
      
        ellipse(EHourX[h],EHourY[h],5,5);
        
        if(h==0) {
          
          previousTempX = EHourX[h];
          previousTempY = EHourY[h];
        
      }

        pushStyle();
        
        stroke(185,185,185);

        line(previousTempX, previousTempY, EHourX[h],EHourY[h]);
        
        popStyle();
        
        previousTempX = EHourX[h];
        previousTempY = EHourY[h];
        
        
      }
      
      else if(i==5) {
      
        ellipse(FHourX[h],FHourY[h],5,5);
        
        if(h==0) {
          
          previousTempX = FHourX[h];
          previousTempY = FHourY[h];
        
      }
      
        pushStyle();
        
        stroke(185,185,185);

        line(previousTempX, previousTempY, FHourX[h],FHourY[h]);
        
        popStyle();
        
        previousTempX = FHourX[h];
        previousTempY = FHourY[h];
        
      }
      
      else if(i==6) {
      
        ellipse(GHourX[h],GHourY[h],5,5);
        
        if(h==0) {
          
          previousTempX = GHourX[h];
          previousTempY = GHourY[h];
        
      }
      
        pushStyle();
        
        stroke(185,185,185);

        line(previousTempX, previousTempY, GHourX[h],GHourY[h]);
        
        popStyle();
        
        previousTempX = GHourX[h];
        previousTempY = GHourY[h];
        
      }
      
      else if(i==7) {
      
        ellipse(HHourX[h],HHourY[h],5,5);
        
        if(h==1) {
          
          previousTempX = HHourX[h];
          previousTempY = HHourY[h];
        
      }
      
        pushStyle();
        
        stroke(185,185,185);

        line(previousTempX, previousTempY, HHourX[h],HHourY[h]);
        
        popStyle();
        
        previousTempX = HHourX[h];
        previousTempY = HHourY[h];
        
      }
      
//      else if(i==8) {
//      
//       ellipse(IHourX[h],IHourY[h],5,5);
//        
//        
//      }      
     
    }
     
    }
    
 }
 
 popStyle();
  
}

void tempCoords() {


  
  
  //ellipse(512,461,5,5);
//  
//  int j = 1;
  
//ellipse(BHourX[2],BHourY[2],1,1);
  
  for(int j=0; j<=9; j++) {
        
     ellipse(AHourX[j],AHourY[j],5,5);
      
     ellipse(BHourX[j],BHourY[j],5,5);
     
     ellipse(CHourX[j],CHourY[j],5,5);
     
     ellipse(DHourX[j],DHourY[j],5,5);
     
     ellipse(EHourX[j],EHourY[j],5,5);
     
     ellipse(FHourX[j],FHourY[j],5,5);
     
     ellipse(GHourX[j],GHourY[j],5,5);
     
     ellipse(HHourX[j],HHourY[j],5,5);
     
//     ellipse(IHourX[j],IHourY[j],5,5);
     
  }
  
}

//void icePressure(int i) { // this method draws the ice pressure arcs
//
//  pushStyle(); //save previous style
//  noStroke(); //no stroke for arcs
//  fill(60, 100, 220); //fill colour blue
//  
////run method
////return i
//
//compareIcePressure();
//  arc(width/2, height/2, icePressureLevel[i], icePressureLevel[i], radians(270), radians(315)); //1st sector of ice
//  arc(width/2, height/2, icePressureLevel[i], icePressureLevel[i], radians(315), radians(360)); //2nd sector of ice
//  arc(width/2, height/2, icePressureLevel[i], icePressureLevel[i], radians(0), radians(45)); //3rd sector of ice
//  arc(width/2, height/2, icePressureLevel[i], icePressureLevel[i], radians(45), radians(90)); //4th sector of ice
//  arc(width/2, height/2, icePressureLevel[i], icePressureLevel[i], radians(90), radians(135)); //5th sector of ice
//  arc(width/2, height/2, icePressureLevel[i], icePressureLevel[i], radians(135), radians(180)); //6th sector of ice
//  arc(width/2, height/2, icePressureLevel[i], icePressureLevel[i], radians(180), radians(225)); //7th sector of ice
//
//  popStyle(); //restore previous style
// 
//}
//
//int compareIcePressure() {
//
// for(int i = 0; i < 10; i++) {
//
// println("outside");
//
// for(int k = 0; k < 10; k++) {
//      
//if(currentIcePressure[i] <= icePressureRange[k] && currentIcePressure[i] <= icePressureRange[k+1]) {
//        return i;
//        
//      }
//    }
//  }
//}

//void icePressure() { // this method draws the ice pressure arcs
//
//  pushStyle(); //save previous style
//  noStroke(); //no stroke for arcs
//  fill(60, 100, 220); //fill colour blue
//  
//  
//  float[] icePressureLevel = {290, 304.5, 319, 333.5, 348, 362.5, 377, 391.5, 406, 420.5, 435}; //array for ice pressure levels
//  float[] icePressureRange = {1,2,3,4,5,6,7,8,9,10,11}; //array for ice pressure ranges to compare
//  float[] currentIcePressure = {2,1,3,5,8,11,15,0,-5,6}; //TESTER!!!! this code is at top of program
//  int[] startRadian = {270,315,0,45,90,135,180};
//  int[] endRadian = {315,360,45,90,135,180,225};
//  
//  for(int sector = 0; sector < 6; sector++) {
//    for(int i = 0; i < 10; i++) {
//      for(int range = 0; range < 10; range++) {
//      
//       println(icePressureRange[range]);
//   
//       println(currentIcePressure[i]);
//   
//       println(icePressureRange[range+1]);
//   
//       println(i);
//       println(range);
//       
//       if (currentIcePressure[i] <= icePressureRange[range] && currentIcePressure[i] <= icePressureRange[range+1]) {
//         if(i == 0) {
//           arc(width/2, height/2, icePressureLevel[range], icePressureLevel[range], radians(startRadian[sector]), radians(endRadian[sector]));
//         }
//         else if(i == 1) {
//           arc(width/2, height/2, icePressureLevel[range], icePressureLevel[range], radians(startRadian[sector]), radians(endRadian[sector]));
//         }
//         else if(i == 2) {
//           arc(width/2, height/2, icePressureLevel[range], icePressureLevel[range], radians(startRadian[sector]), radians(endRadian[sector]));
//         }
//         else if(i == 3) {
//           arc(width/2, height/2, icePressureLevel[range], icePressureLevel[range], radians(startRadian[sector]), radians(endRadian[sector]));
//         }
//         else if(i == 4) {
//           arc(width/2, height/2, icePressureLevel[range], icePressureLevel[range], radians(startRadian[sector]), radians(endRadian[sector]));
//         }
//         else if(i == 5) {
//           arc(width/2, height/2, icePressureLevel[range], icePressureLevel[range], radians(startRadian[sector]), radians(endRadian[sector]));
//         }
//         else if(i == 6) {
//           arc(width/2, height/2, icePressureLevel[range], icePressureLevel[range], radians(startRadian[sector]), radians(endRadian[sector]));
//         }
//         else if(i == 7) {
//           arc(width/2, height/2, icePressureLevel[range], icePressureLevel[range], radians(startRadian[sector]), radians(endRadian[sector]));
//         }
//         else if(i == 8) {
//           arc(width/2, height/2, icePressureLevel[range], icePressureLevel[range], radians(startRadian[sector]), radians(endRadian[sector]));
//         }
//         else if(i == 9) {
//           arc(width/2, height/2, icePressureLevel[range], icePressureLevel[range], radians(startRadian[sector]), radians(endRadian[sector]));
//         }
//         else if(i == 10) {
//           arc(width/2, height/2, icePressureLevel[range], icePressureLevel[range], radians(startRadian[sector]), radians(endRadian[sector]));
//         }
//         
//       }
//      }
//    }
//  }
//
//  popStyle(); //restore previous style
// 
//}

//void icePressure() { // this method draws the ice pressure arcs
//
// /// COMMENT ------- CREATE CASE ALGORITHM FOR VARIABLES
// 
//  float[] icePressureLevel = {290, 304.5, 319, 333.5, 348, 362.5, 377, 391.5, 406, 420.5, 435}; //array for ice pressure levels
//  float[] icePressureRange = {1,2,3,4,5,6,7,8,9,10,11}; //array for ice pressure ranges to compare
//  //float icePressureRangeIncrement = 1; //difference of two (next to each other) values of icePressureRange
//  float[] currentIcePressure = {2,1}; //TESTER!!!! this code is at top of program
//  
//  int i = 0;
////  int l = 0;
////  int indefiniteVal = 1;
////  
////  int k;
////  
////  if (currentIcePressure[l] > icePressureRange[k] && currentIcePressure[l] <= icePressureRange[k+1]) {
////    i = k;
////    k++;
////    l++;
////  }
////  else {
////    do {
////      for (k; k < 10; k++) {
////      }
////    }while(currentIcePressure[l] !> icePressureRange[k] && currentIcePressure[l] !<= icePressureRange[k+1]);
////  }
////        
////  
//////  for (int arcNum = 0; arcNum < 6; arcNum++) { //7 sectors of arc
//////  
//////    if (l < indefiniteVal) {
//////     // do {
//////        for (int k = 0; k < 10; k++) {
//////          do{
//////          if (currentIcePressure[l] == icePressureRange[0]) {
//////            i = 0;
//////            l++;  print("1");print("l="+l);
//////           }
//////          else if (currentIcePressure[l] > icePressureRange[k] && currentIcePressure[l] <= icePressureRange[k+1]) {
//////            i = k;
//////            l++;  print("2");print("l="+l);
//////           }
//////                 }while(l != indefiniteVal);  print("//end do//");
//////        }
////////      }while(l != indefiniteVal);  print("//end do//");
//////    }print("//end first if//");
//////    
//////  }print("end all");
// 
//  pushStyle(); //save previous style
// 
//  noStroke(); //no stroke for arcs
//  fill(60, 100, 220); //fill colour blue
// 
//  arc(width/2, height/2, icePressureLevel[i], icePressureLevel[i], radians(270), radians(315)); //1st sector of ice
//  arc(width/2, height/2, icePressureLevel[i], icePressureLevel[i], radians(315), radians(360)); //2nd sector of ice
//  arc(width/2, height/2, icePressureLevel[i], icePressureLevel[i], radians(0), radians(45)); //3rd sector of ice
//  arc(width/2, height/2, icePressureLevel[i], icePressureLevel[i], radians(45), radians(90)); //4th sector of ice
//  arc(width/2, height/2, icePressureLevel[i], icePressureLevel[i], radians(90), radians(135)); //5th sector of ice
//  arc(width/2, height/2, icePressureLevel[i], icePressureLevel[i], radians(135), radians(180)); //6th sector of ice
//  arc(width/2, height/2, icePressureLevel[i], icePressureLevel[i], radians(180), radians(225)); //7th sector of ice
//
//  popStyle(); //restore previous style
// 
//}

//BELOW IS STATIC GRAPHICS FOR SETUP OF CIRCLE. 

void circlesAndLines() {
 
  ellipse(512, 384, 580, 580);//outer circle
  ellipse(512, 384, 435, 435);//wind
//  icePressure(); //draw the ice pressure arcs
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
  
  text("-80˚",490,311);//-10 degrees celcius
  text("0˚",500,280);//-10 degrees celcius
  text("0˚",493,250);
 
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
