PFont font;

int m;

int testValue;

float [] temps = {1,2,3,4,5,6,10,1};

void setup() {

  size(1024, 768);
  smooth();
  
  font = loadFont("Century-10.vlw");
  textFont(font);
  staticGraphics();
}

void draw() {

  
   
}

void staticGraphics() {
 
 circlesAndLines();
 
 textMarkings(); 
 
 plotTemps();
  
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
  
  line(512,311, 512,239);
  
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
