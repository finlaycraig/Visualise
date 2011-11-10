PFont font;

int m;

int n;

float [] temps = {1,2,3,4,5,6,10,1};

float [] pressure = {1,2,3,4,5,6,7,8};

void setup() {

  size(1024, 768);
  smooth();
  
  font = loadFont("Century-10.vlw");
  textFont(font);
  staticGraphics();
  
  tempCoords();
  
}

void draw() {

  
   
}

void staticGraphics() {
 
 circlesAndLines();
 
 textMarkings(); 
 
 //plotTemps();  
  
}


void plotTemps() {//this method plots the points of temperature taken from the array
 
 int tempStartX = 0;
 int tempStartY = -108;
 
 float previousX = 0;
 float previousY = temps[0];
 
 float tempRadians = -PI;
 
 for(int k=0; k<=7; k++) {
   
   pushMatrix();
 
   translate(width/2, height/2);
   rotate(tempRadians);
   
   
   
   if(k==0) {//use this if statement to make the first point green.
     
   pushStyle();
   
   fill(7,165,0);
    
   ellipse(0, tempDecode(temps[k]), 5, 5);//draw point
   
   popStyle();
   
   }
   
   else {
    
    ellipse(0, tempDecode(temps[k]), 5, 5);//draw point
     
   }
 
   popMatrix();
   
   tempRadians = tempRadians + (PI/4);
   
   previousY = tempDecode(temps[k]);
 
  }
  
}

public float tempDecode(float yTemp) {
  
  if(yTemp == 1) {
   
    return 115;
    
  } 
  
  if(yTemp == 2) {
   
    return 120;
    
  }
 
 if(yTemp == 10) {
   
    return 140;
    
  }  
  
  return 115;
  
}




void tempCoords() {


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
  
  int[] GHourX = {458,453,448,443,438,433,428,423,418,413};
  int[] GHourY = {438,443,448,453,458,463,468,473,478,483};
  
  int[] HHourX = {372,379,386,393,400,407,414,421,428,435};
  int[] HHourY = {384,384,384,384,384,384,384,384,384,384};
  
  int[] IHourX = {457,452,447,442,437,432,427,422,417,412};
  int[] IHourY = {330,325,320,315,310,305,300,295,290,285};
  
  ellipse(512,461,5,5);
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
   
   ellipse(HHourX[j],HHourY[j],5,5);
   
   ellipse(IHourX[j],IHourY[j],5,5);
    
  }
  
}

void icePressure() { // this method draws the ice pressure arcs

 // COMMENT ------- CREATE CASE ALGORITHM FOR VARIABLES
 
 pushStyle(); //save previous style
 
 noStroke(); //no stroke for arcs
 fill(60, 100, 220); //fill colour blue
 
 arc(width/2, height/2, 305, 305, radians(270), radians(315)); //1st sector of ice
 arc(width/2, height/2, 345, 345, radians(315), radians(360)); //2nd sector of ice
 arc(width/2, height/2, 305, 305, radians(0), radians(45)); //3rd sector of ice
 arc(width/2, height/2, 305, 305, radians(45), radians(90)); //4th sector of ice
 arc(width/2, height/2, 305, 305, radians(90), radians(135)); //5th sector of ice
 arc(width/2, height/2, 305, 305, radians(135), radians(180)); //6th sector of ice
 arc(width/2, height/2, 305, 305, radians(180), radians(225)); //7th sector of ice

 popStyle(); //restore previous style
 
}

//BELOW IS STATIC GRAPHICS FOR SETUP OF CIRCLE. 

void circlesAndLines() {
 
  ellipse(512, 384, 580, 580);//outer circle
  ellipse(512, 384, 435, 435);//wind
  icePressure(); //draw the ice pressure arcs
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
  
  text("-10˚",490,311);//-10 degrees celcius
  text("0˚",500,280);//-10 degrees celcius
  text("10˚",493,250);
 
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
