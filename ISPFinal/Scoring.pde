// This includes all scoring screens once the game is over.

// Score Saving Variables
String username = "";
boolean scoreSaved;

void saveScore() // Method for saving the scores
{
  thumbnails[puzzleType - 1].resize(1000, 750);
  background(thumbnails[puzzleType - 1]);
  tint(225, 225);
  imageMode(CORNERS);
  if(puzzleType <= 3)
  {
    image(gameBG, 0, 0, width, height);
    logoColour = #59B7E8;
  }
  else
  {
    image(bonusBG, 0, 0, width, height);
    logoColour = #D700F5;
  }
  noTint();
  
  // Logo
  logoY = 145;
  logoTitle = "V I C T O R I O U S!";
  logo();
  
  textAlign(CENTER, CENTER);
  textFont(Agency);
  textSize(60);
  fill(100, 180);
  text("Enter your username:", 500 + shadowOffset, 330 + shadowOffset); // Shadow
  
  fill(#003486);
  text("Enter your username:", 500, 330); // Subtitle

  // Displays currently typed username
  rectMode(CENTER);
  textFont(SegoeLight);
  textSize(36);
  float userLength = textWidth(username) + 100;
    // Shadow
  fill(100, 180);
  stroke(100, 180);
  rect(500 + shadowOffset, 430 + shadowOffset, userLength, 2); // Underline
  text(username, 500 + shadowOffset, 410 + shadowOffset); // Text
    // Real Text
  fill(255);
  stroke(255);
  rect(500, 430, userLength, 2); // Underline
  text(username, 500, 410); // Text
  
  // Button
  noFill();
  strokeWeight(7);
  stroke(100, 180);
  rect(500 + shadowOffset, 600 + shadowOffset, 300, 150, 20, 20, 20, 20); // Shadow
  
  if (mouseX > 350 && mouseX < 650 && mouseY > 525 && mouseY < 675) // Highlights the button if mouse is hovering over it
    stroke(#36C6FC, 150);
  else 
    stroke(255);
    
  rect(500, 600, 300, 150, 20, 20, 20, 20); // Real
 
  if(textWidth(username) > 500) // Different messages can show up depending on what your username is.
  {
    textSize(30);
    fill(100, 180);
    text("Username Too Long!", 500 + shadowOffset, 600 + shadowOffset); // Shadow
    fill(255);
    text("Username Too Long!", 500, 600); // Real
  }
  else if(username.length() > 0)
  {
    textSize(60);
    fill(100, 180);
    text("SAVE!", 500 + shadowOffset, 600 + shadowOffset); // Shadow
    fill(255);
    text("SAVE!", 500, 600); // Real
  } 
  else 
  {
    textSize(38);
    fill(100, 180);
    text("Type Something!", 500 + shadowOffset, 600 + shadowOffset); // Shadow
    fill(255);
    text("Type Something!", 500, 600); // Real
  }
  
  // Decoration
  noStroke();
  rectMode(CORNERS);
  fill(#0F326A);
  rect(320, 500, 330, 700);
  rect(width - 320, 500, width - 330, 700);
} 

void finishScreen() // Win Screen
{
  thumbnails[puzzleType - 1].resize(1000, 750);
  background(thumbnails[puzzleType - 1]);
  tint(225, 225);
  imageMode(CORNERS);
  if(puzzleType <= 3)
  {
    image(gameBG, 0, 0, width, height);
    logoColour = #59B7E8;
  }
  else
  {
    image(bonusBG, 0, 0, width, height);
    logoColour = #D700F5;
  }
  
  noTint();
  // Logo
  logoY = 145;
  logoTitle = "V I C T O R I O U S!";
  logo();
  
  // Side Rectangles, where scoring information is displayed
  rectMode(CORNERS);
  strokeWeight(8);
  noFill();
  // Shadow
  stroke(100, 180);
  rect(60 + shadowOffset, 325 + shadowOffset, 300 + shadowOffset, 680 + shadowOffset);
  rect(width - 60 + shadowOffset, 325 + shadowOffset, width - 300 + shadowOffset, 680 + shadowOffset);
  // Real
  stroke(255);
  rect(60, 325, 300, 680);
  rect(width - 60, 325, width - 300, 680);
  
  // Decoration
  imageMode(CENTER);
  image(win, width - 180, 510, 225, 190);
  
  fill(#3C90CE);
  rectMode(CENTER);
  strokeWeight(7);
  noFill();
  // Shadows for Buttons
  stroke(100, 180);
  rect(500 + shadowOffset, 660 + shadowOffset, 280, 130, 20, 20, 20, 20);
  rect(500 + shadowOffset, 360 + shadowOffset, 280, 130, 20, 20, 20, 20);
  rect(500 + shadowOffset, 510 + shadowOffset, 280, 130, 20, 20, 20, 20);
  
  // Real Buttons
  if (mouseX > 360 && mouseX < 640 && mouseY > 295 && mouseY < 425) // Highlights the button if mouse is hovering over it
    stroke(#36C6FC, 150);
  else 
    stroke(255);
  rect(500, 360, 280, 130, 20, 20, 20, 20);
  
  if (mouseX > 360 && mouseX < 640 && mouseY > 445 && mouseY < 575) // Highlights the button if mouse is hovering over it
    stroke(#36C6FC, 150);
  else 
    stroke(255);
  rect(500, 510, 280, 130, 20, 20, 20, 20);
  
  if (mouseX > 360 && mouseX < 640 && mouseY > 595 && mouseY < 725) // Highlights the button if mouse is hovering over it
    stroke(#36C6FC, 150);
  else 
    stroke(255);
  rect(500, 660, 280, 130, 20, 20, 20, 20);
  
  // Text for buttons
  textAlign(CENTER, CENTER);
  textFont(Segoe);
  textSize(60);
  // Shadows
  fill(100, 180);
  text("BACK!", 500 + shadowOffset, 360 + shadowOffset);
  text("RETRY!", 500 + shadowOffset, 510 + shadowOffset);
  if(scoreSaved)
    text("SAVED!", 500 + shadowOffset, 660 + shadowOffset);
  else
    text("SAVE!", 500 + shadowOffset, 660 + shadowOffset);
    
  // Real Text
  fill(255);
  text("BACK!", 500, 360);
  text("RETRY!", 500, 510);
  if(scoreSaved)
    text("SAVED!", 500, 660);
  else
    text("SAVE!", 500, 660);
  
  // Text for Scoring Information
  
  int timeUsed = 60 * 120 - timeLeft;
  int minsLeft = timeUsed / 3600;
  int secsLeft = timeUsed / 60 - (minsLeft * 60);
  
  textSize(30);
  // Shadow
  fill(100, 180);
  text("Score: "+currentScore, 180 + shadowOffset, 400 + shadowOffset);
  
  if(secsLeft >= 10)
    text("Time Used: "+minsLeft+":"+secsLeft, 180 + shadowOffset, 500 + shadowOffset);
  else
  text("Time Used: "+minsLeft+":0"+secsLeft, 180 + shadowOffset, 500 + shadowOffset);
  
  text("Correct Pieces:", 180 + shadowOffset, 600 + shadowOffset);
  text(rightSpots, 180 + shadowOffset, 650 + shadowOffset);
  
  // Real
  fill(255);
  text("Score: "+currentScore, 180, 400);
  
  if(secsLeft >= 10)
    text("Time Used: "+minsLeft+":"+secsLeft, 180, 500);
  else
  text("Time Used: "+minsLeft+":0"+secsLeft, 180, 500);
  
  text("Correct Pieces:", 180, 600);
  text(rightSpots, 180, 650);
}

void failScreen() // Defeat Screen
{
  thumbnails[puzzleType - 1].resize(1000, 750);
  background(thumbnails[puzzleType - 1]);
  tint(225, 225);
  imageMode(CORNERS);
  if(puzzleType <= 3)
  {
    image(gameBG, 0, 0, width, height);
    logoColour = #59B7E8;
  }
  else
  {
    image(bonusBG, 0, 0, width, height);
    logoColour = #D700F5;
  }
  
  noTint();
  // Logo
  logoY = 145;
  logoTitle = "D E F E A T E D!";
  logo();
  
  // Side Rectangles, where scoring information is displayed
  rectMode(CORNERS);
  strokeWeight(8);
  noFill();
  // Shadow
  stroke(100, 180);
  rect(60 + shadowOffset, 325 + shadowOffset, 300 + shadowOffset, 680 + shadowOffset);
  rect(width - 60 + shadowOffset, 325 + shadowOffset, width - 300 + shadowOffset, 680 + shadowOffset);
  // Real
  stroke(255);
  rect(60, 325, 300, 680);
  rect(width - 60, 325, width - 300, 680);
  
  imageMode(CENTER);
  image(lose, width - 180, 502, 270, 180);
  
  noFill();
  rectMode(CENTER);
  strokeWeight(7);
  // Shadow for Text
  stroke(100, 180);
  rect(500 + shadowOffset, 570 + shadowOffset, 280, 130, 20, 20, 20, 20);
  rect(500 + shadowOffset, 420 + shadowOffset, 280, 130, 20, 20, 20, 20);
  
  // Actual Buttons
  if (mouseX > 360 && mouseX < 640 && mouseY > 355 && mouseY < 485) // Highlights the button if mouse is hovering over it
    stroke(#36C6FC, 150);
  else 
    stroke(255);
  rect(500, 420, 280, 130, 20, 20, 20, 20);
  
  if (mouseX > 360 && mouseX < 640 && mouseY > 505 && mouseY < 635) // Highlights the button if mouse is hovering over it
    stroke(#36C6FC, 150);
  else 
    stroke(255);
  rect(500, 570, 280, 130, 20, 20, 20, 20);
  
  // Text for buttons
  textAlign(CENTER, CENTER);
  textFont(Segoe);
  textSize(60);
  // Shadow
  fill(100, 180);
  text("BACK!", 500 + shadowOffset, 420 + shadowOffset);
  text("RETRY!", 500 + shadowOffset, 570 + shadowOffset);
  // Real
  fill(255);
  text("BACK!", 500, 420);
  text("RETRY!", 500, 570);
  
  // Scoring Information Text
  
  int timeUsed = 60 * 120 - timeLeft;
  int minsLeft = timeUsed / 3600;
  int secsLeft = timeUsed / 60 - (minsLeft * 60);
  
  textSize(30);
  // Shadow
  fill(100, 180);
  text("Score: "+currentScore, 180 + shadowOffset, 400 + shadowOffset);
  
  if(secsLeft >= 10)
    text("Time Used: "+minsLeft+":"+secsLeft, 180 + shadowOffset, 500 + shadowOffset);
  else
  text("Time Used: "+minsLeft+":0"+secsLeft, 180 + shadowOffset, 500 + shadowOffset);
  
  text("Correct Pieces:", 180 + shadowOffset, 600 + shadowOffset);
  text(rightSpots, 180 + shadowOffset, 650 + shadowOffset);
  // Real
  fill(255);
  text("Score: "+currentScore, 180, 400);

  if(secsLeft >= 10)
    text("Time Used: "+minsLeft+":"+secsLeft, 180, 500);
  else
  text("Time Used: "+minsLeft+":0"+secsLeft, 180, 500);
  
  text("Correct Pieces:", 180, 600);
  text(rightSpots, 180, 650);
}
