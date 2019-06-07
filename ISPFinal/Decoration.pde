// Additional Decoration Methods

// Variables used for controlling logo position.
int logoX = 500, logoY = 145;
int logoColour;
String logoTitle;

// Variables used for win/lose screen decoration.
PImage win, lose;

// Variables used for decoration everywhere.
int shadowOffset = 3; // Universal offset for the shadows. 

void logo() // The logo which appears on every screen.
{
  pushMatrix();
  translate(shadowOffset, shadowOffset);
  fill(100, 180); // Translucent Grey Shadow
  noStroke();
  rectMode(CENTER);
  
  rect(logoX, logoY - 78, 760, 15); // Rectangular Bars
  rect(logoX, logoY + 122, 760, 15);
  
  // Text, including my name
  textFont(SegoeLight);
  textSize(60);
  textAlign(LEFT, CENTER);
  text(logoTitle, logoX - 380, logoY);
  textAlign(RIGHT, CENTER);
  textFont(Segoe);
  textSize(30);
  text("B E N  Z E N G  P R O D U C T I O N S", logoX + 380, logoY + 60);
  popMatrix();
  
  fill(255); // Real logo, not shadow
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
  
  // Total Score Displayer
  if(mode != 6)
  {
    textAlign(CENTER, CENTER);
    textFont(Segoe);
    textSize(24);
    
    fill(100, 180);
    noStroke();
    rectMode(CENTER);
    rect(500 + shadowOffset, 30 + shadowOffset, 150 + textWidth(totalScore + ""), 30); // Shadow
    
    strokeWeight(3);
    stroke(255);
    fill(logoColour);
    rect(500, 30, 150 + textWidth(totalScore + ""), 30); // Real Rectangle
    
    fill(255);
    text("Total Score: "+totalScore, 500, 30); // Display
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
  logoColour = #59B7E8;
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
  
  // Game Board in Center
  noFill();
  strokeWeight(10);
  rectMode(CENTER);
  stroke(100, 180);
  rect(500 + shadowOffset, 375 + shadowOffset, 500, 400); // Shadow
  stroke(255);
  rect(500, 375, 500, 400); // Real 
  
  // Back button
  strokeWeight(8);
  textAlign(CENTER, CENTER);
  noFill();
  stroke(100, 180);
  ellipse(width - 60 + shadowOffset, 60 + shadowOffset, 100, 100); // Shadow
  textSize(24);
  fill(100, 180);
  text("BACK..", width - 60 + shadowOffset, 60 + shadowOffset);
  
  if(dist(mouseX, mouseY, width - 60, 60) < 50) // Highlights Button
    stroke(#8FA5FC, 150);
  else
    stroke(255);
  noFill();
  ellipse(width - 60, 60, 100, 100); // Real
  fill(255);
  text("BACK..", width - 60, 60);
  
  // Timer
  strokeWeight(3);
  
  stroke(100, 180);
  fill(100, 180);
  rect(width - 200 + shadowOffset, 80 + shadowOffset, 120, 30); // Shadow
  
  stroke(255);
  fill(#3C90CE);
  rect(width - 200, 80, 120, 30); // Real
  
  fill(255);
  if(secsLeft >= 10)
    text("Time: "+minsLeft+":"+secsLeft, width - 200, 80);
  else
  text("Time: "+minsLeft+":0"+secsLeft, width - 200, 80);
}
