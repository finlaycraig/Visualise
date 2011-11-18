PFont font;

float fontScale = 18.0;

int x = 912;
int previousFoodX = x;
int foodMarker = 3;
  
void setup() {

  size(1024, 768);
  smooth();
  
  font = loadFont("Century-18.vlw");
  textFont(font);
}

void draw() {
  
  gaugesStatic();
  gaugesDynamic();
  
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

void gaugesDynamic() {
  
//  menNumbers();
  foodNumbers();
//  coalNumbers();
}

void menNumbers() {
  
}

void foodNumbers() {
  int[] foodUnits = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
  int[] foodX = {850, 868, 888, 912, 936, 956, 974};
  int[] foodXBetween = {859, 878, 900, 924, 946, 965};
  int foodY = 375;
//  int x = 912;
  int y = 375;
  
  pushStyle();//save previous style
  
  fill(77,76,76);//apply fill colour to text
  
//  textAlign(CENTER, TOP);
//  textSize(fontScale);
////  text(foodUnits[14],x,y);
//  text("10",x,y);

  boolean scrolling = false;
  
  if(previousFoodX > x || previousFoodX < x) {
    scrolling = true;
//    println("scrolling is true");
  }
  
  if(!scrolling) {
    if(x >= foodX[0] && x <= foodXBetween[0]) {
      x = foodX[0]; // TO ADD ease this value from previousFoodX
    }
    if(x > foodXBetween[0] && x <= foodX[1] || x > foodX[1] && x <= foodXBetween[1]) {
      x = foodX[1];
    }
    if(x > foodXBetween[1] && x <= foodX[2] || x > foodX[2] && x <= foodXBetween[2]) {
      x = foodX[2];
    }
    if(x > foodXBetween[2] && x <= foodX[3] || x > foodX[3] && x <= foodXBetween[3]) {
      x = foodX[3];
    }
    if(x > foodXBetween[3] && x <= foodX[4] || x > foodX[4] && x <= foodXBetween[4]) {
      x = foodX[4];
    }
    if(x > foodXBetween[4] && x <= foodX[5] || x > foodX[5] && x <= foodXBetween[5]) {
      x = foodX[5];
    }
    if(x > foodXBetween[5] && x <= foodX[6]) {
      x = foodX[6];
    }
//    if(x > 946 && x <= 956) {
//      x = 956;
//    }
//    print("scrolling is false");
  }
  
  boolean markerHit = false;
  
  if(x == foodX[2]) { // if x of current foodUnits becomes less than left gauge section
    foodMarker = foodMarker+1; // make marker point to current centric number
    markerHit = true;
  }
  if(x == foodX[4]) { // if x of current foodUnits becomes more than right gauge section
    foodMarker = foodMarker-1; // make marker point to current centric number
    markerHit = true;
  }
  
  if(!markerHit) {
  textAlign(CENTER, TOP);
  textSize(fontScale); // TO ADD fontScale = 18.0, but will decrement to 10.0 depending on input data by rotary motor
  text(foodUnits[foodMarker],x,y); // TO ADD x is data input by rotary motor
  
  previousFoodX = x;
  
  textAlign(CENTER, TOP);
  textSize(fontScale); // TO ADD fontScale = 18.0, but will decrement to 10.0 depending on input data by rotary motor
  text(foodUnits[foodMarker+1],x+24,y); // TO ADD x is data input by rotary motor
  
  textAlign(CENTER, TOP);
  textSize(fontScale); // TO ADD fontScale = 18.0, but will decrement to 10.0 depending on input data by rotary motor
  text(foodUnits[foodMarker+2],x+44,y); // TO ADD x is data input by rotary motor
  
  textAlign(CENTER, TOP);
  textSize(fontScale); // TO ADD fontScale = 18.0, but will decrement to 10.0 depending on input data by rotary motor
  text(foodUnits[foodMarker+3],x+62,y); // TO ADD x is data input by rotary motor
  
  if(foodMarker+4 > 19) {
    foodMarker = 0;
  }
  
  textAlign(CENTER, TOP);
  textSize(fontScale); // TO ADD fontScale = 18.0, but will decrement to 10.0 depending on input data by rotary motor
  text(foodUnits[foodMarker+4],x+80,y); // TO ADD x is data input by rotary motor
  
  textAlign(CENTER, TOP);
  textSize(fontScale); // TO ADD fontScale = 18.0, but will decrement to 10.0 depending on input data by rotary motor
  text(foodUnits[foodMarker-1],x-24,y); // TO ADD x is data input by rotary motor
  
  textAlign(CENTER, TOP);
  textSize(fontScale); // TO ADD fontScale = 18.0, but will decrement to 10.0 depending on input data by rotary motor
  text(foodUnits[foodMarker-2],x-44,y); // TO ADD x is data input by rotary motor
  
  textAlign(CENTER, TOP);
  textSize(fontScale); // TO ADD fontScale = 18.0, but will decrement to 10.0 depending on input data by rotary motor
  text(foodUnits[foodMarker-3],x-62,y); // TO ADD x is data input by rotary motor
  
  if(foodMarker-4 < 0) {
    foodMarker = 23;
  }
  
  textAlign(CENTER, TOP);
  textSize(fontScale); // TO ADD fontScale = 18.0, but will decrement to 10.0 depending on input data by rotary motor
  text(foodUnits[foodMarker-4],x-80,y); // TO ADD x is data input by rotary motor
  
  if(foodMarker == 23) {
    foodMarker = 3;
  }
  
  if(foodMarker == 0) {
    foodMarker = 3;
  }
  
  }

  if(markerHit) {
  textAlign(CENTER, TOP);
  textSize(fontScale); // TO ADD fontScale = 18.0, but will decrement to 10.0 depending on input data by rotary motor
  text(foodUnits[foodMarker],x,y); // TO ADD x is data input by rotary motor
  
  previousFoodX = x;
  }
  
  print("Food Marker: ");
  println(foodMarker);
  
  if(x < 918) {
    x++;
  }

/////
//
//  textAlign(CENTER, TOP);
//  textSize(10);
//  text("1",850,375);
//  
//  textAlign(CENTER, TOP);
//  textSize(12);
//  text("2",868,375);  
//    
//  textAlign(CENTER, TOP);
//  textSize(14);
//  text("3",888,375);
//  
/////
//
//  textAlign(CENTER, TOP);
//  textSize(14);
//  text("5",936,375);
//  
//  textAlign(CENTER, TOP);
//  textSize(12);
//  text("6",956,375);
//  
//  textAlign(CENTER, TOP);
//  textSize(10);
//  text("7",974,375);
  
//  if(fontScale > 10.05) {
//    fontScale = fontScale - 0.05;
//  }
//  
//  println(fontScale);
  
  popStyle();//restore previous style
}

void coalNumbers() {

}
