// Additional Decoration Methods

// Variables used for controlling logo position.
int logoX = 500, logoY = 145;
int logoColour;
String logoTitle;

// Variables used for win/lose screen decoration.
PImage win, lose;

void logo() // The logo which appears on every screen.
{
  fill(100, 180);
  noStroke();
  rectMode(CENTER);
  rect(logoX + 5, logoY - 78 + 5, 760, 15); // Rectangular Bars
  rect(logoX + 5, logoY + 122 + 5, 760, 15);
  // Text, including my name
  textFont(SegoeLight);
  textSize(60);
  textAlign(LEFT, CENTER);
  text(logoTitle, logoX - 380 + 5, logoY + 5);
  textAlign(RIGHT, CENTER);
  textFont(Segoe);
  textSize(30);
  text("B E N  Z E N G  P R O D U C T I O N S", logoX + 380 + 2, logoY + 60 + 2);
  
  fill(255);
  noStroke();
  rectMode(CENTER);
  rect(logoX, logoY - 78, 760, 15); // Rectangular Bars
  rect(logoX, logoY + 122, 760, 15);
  // Text, including my name
  textFont(SegoeLight);
  textSize(60);
  textAlign(LEFT, CENTER);
  fill(255);
  text(logoTitle, logoX - 380, logoY);
  fill(logoColour);
  textAlign(RIGHT, CENTER);
  textFont(Segoe);
  textSize(30);
  text("B E N  Z E N G  P R O D U C T I O N S", logoX + 380, logoY + 60);
  
  // Total Score
  if(mode != 6)
  {
    textFont(Segoe);
    textSize(24);
    fill(100, 180);
    noStroke();
    rectMode(CENTER);
    rect(500 + 5, 30 + 5, 150 + textWidth(totalScore + ""), 30);
    
    textAlign(CENTER, CENTER);
    strokeWeight(3);
    stroke(255);
    fill(logoColour);
    
    rect(500, 30, 150 + textWidth(totalScore + ""), 30);
    fill(255);
    text("Total Score: "+totalScore, 500, 30);
  }
}

void playDeco() // Gameplay decoration
{
  int minsLeft = timeLeft / 3600;
  int secsLeft = timeLeft / 60 - (minsLeft * 60);
  
  background(gameBG);
  // Title and Logo
  pushMatrix();
  scale(0.5);
  logoY = 145;
  logoColour = #3C90CE;
  logoTitle = "J I G S A W  W O R L D";
  logo();
  popMatrix();
  
  // Decoration
  imageMode(CENTER);
  pushMatrix();
  translate(550, 100);
  rotate(radians(-20));
  image(decoration, 0, 0, 100, 100);
  popMatrix();
  
  pushMatrix();
  translate(680, 80);
  rotate(radians(30));
  image(decoration, 0, 0, 80, 80);
  popMatrix();
  
  noFill();
  strokeWeight(10);
  rectMode(CENTER);
  stroke(100, 180);
  rect(500 + 5, 375 + 5, 500, 400);
  stroke(255);
  rect(500, 375, 500, 400);
  
  // Button
  fill(#FC4517);
  noStroke();
  textAlign(CENTER, CENTER);
  ellipse(width - 60, 60, 100, 100);
  fill(255);
  textSize(24);
  text("BACK..", width - 60, 60);
  
  // Timer
  strokeWeight(3);
  stroke(100, 180);
  fill(100, 180);
  rect(width - 200 + 5, 80 + 5, 120, 30);
  stroke(255);
  fill(#3C90CE);
  rect(width - 200, 80, 120, 30);
  fill(255);
  if(secsLeft >= 10)
    text("Time: "+minsLeft+":"+secsLeft, width - 200, 80);
  else
  text("Time: "+minsLeft+":0"+secsLeft, width - 200, 80);
}
