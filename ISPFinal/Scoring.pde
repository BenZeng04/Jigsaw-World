// This includes all scoring screens once the game is over.

// Score Saving Variables
String username = "";
boolean scoreSaved;

void saveScore() 
{
  thumbnails[puzzleType - 1].resize(1000, 750);
  background(thumbnails[puzzleType - 1]);
  tint(225, 225);
  imageMode(CORNERS);
  image(gameBG, 0, 0, width, height);
  
  noTint();
  // Logo
  logoY = 145;
  logoColour = #3C90CE;
  logoTitle = "V I C T O R I O U S!";
  logo();
  
  textAlign(CENTER, CENTER);
  textFont(Agency);
  textSize(60);
  fill(100, 180);
  text("Enter your username:", 500 + 2, 330 + 2);
  fill(#003486);
  text("Enter your username:", 500, 330); // Subtitle

  rectMode(CENTER);
  textFont(SegoeLight);
  textSize(36);
  float userLength = textWidth(username) + 100;
  fill(100, 180);
  stroke(100, 180);
  rect(500 + 2, 430 + 2, userLength, 2);
  text(username, 500 + 2, 410 + 2);
  fill(0);
  stroke(255);
  rect(500, 430, userLength, 2);
  text(username, 500, 410);
  
  noFill();
  stroke(100, 180);
  rect(500 + 5, 600 + 5, 300, 150, 20, 20, 20, 20);
  strokeWeight(7);
  if (mouseX > 350 && mouseX < 650 && mouseY > 525 && mouseY < 675) // Highlights the button if mouse is hovering over it
    stroke(#36C6FC, 150);
  else 
    stroke(255);
  rect(500, 600, 300, 150, 20, 20, 20, 20);
 
  if(textWidth(username) > width)
  {
    textSize(30);
    fill(100, 180);
    text("Username Too Long!", 500 + 5, 600 + 5);
    fill(255);
    text("Username Too Long!", 500, 600);
  }
  else if(username.length() > 0)
  {
    textSize(60);
    fill(100, 180);
    text("SAVE!", 500 + 5, 600 + 5);
    fill(255);
    text("SAVE!", 500, 600);
  }
  else 
  {
    textSize(38);
    fill(100, 180);
    text("Type Something!", 500 + 5, 600 + 5);
    fill(255);
    text("Type Something!", 500, 600);
  }
    
  noStroke();
  rectMode(CORNERS);
  fill(#0F326A);
  rect(320, 500, 330, 700);
  rect(width - 320, 500, width - 330, 700);
} 

void finishScreen()
{
  thumbnails[puzzleType - 1].resize(1000, 750);
  background(thumbnails[puzzleType - 1]);
  tint(225, 225);
  imageMode(CORNERS);
  image(gameBG, 0, 0, width, height);
  
  noTint();
  // Logo
  logoY = 145;
  logoColour = #3C90CE;
  logoTitle = "V I C T O R I O U S!";
  logo();
  
  rectMode(CORNERS);
  fill(#4E6776);
  rect(60, 325, 300, 680);
  rect(width - 60, 325, width - 300, 680);
  
  imageMode(CENTER);
  image(win, width - 180, 502, 150, 300);
  
  fill(#3C90CE);
  rectMode(CENTER);
  strokeWeight(7);
  noFill();
  stroke(100, 180);
  rect(500 + 5, 660 + 5, 280, 130, 10, 10, 10, 10);
  rect(500 + 5, 360 + 5, 280, 130, 10, 10, 10, 10);
  rect(500 + 5, 510 + 5, 280, 130, 10, 10, 10, 10);
  if (mouseX > 360 && mouseX < 640 && mouseY > 295 && mouseY < 425) // Highlights the button if mouse is hovering over it
    stroke(#36C6FC, 150);
  else 
    stroke(255);
  rect(500, 360, 280, 130, 10, 10, 10, 10);
  if (mouseX > 360 && mouseX < 640 && mouseY > 445 && mouseY < 575) // Highlights the button if mouse is hovering over it
    stroke(#36C6FC, 150);
  else 
    stroke(255);
  rect(500, 510, 280, 130, 10, 10, 10, 10);
  if (mouseX > 360 && mouseX < 640 && mouseY > 595 && mouseY < 725) // Highlights the button if mouse is hovering over it
    stroke(#36C6FC, 150);
  else 
    stroke(255);
  rect(500, 660, 280, 130, 10, 10, 10, 10);
  
  // Text for buttons
  textAlign(CENTER, CENTER);
  textFont(Segoe);
  textSize(60);
  fill(100, 180);
  text("Back!", 500 + 5, 360 + 5);
  text("Retry!", 500 + 5, 510 + 5);
  
  if(scoreSaved)
    text("Saved!", 505, 665);
  else
    text("Save!", 505, 665);
   
  fill(255);
  text("Back!", 500, 360);
  text("Retry!", 500, 510);
  
  if(scoreSaved)
    text("Saved!", 500, 660);
  else
    text("Save!", 500, 660);
  
  fill(255);
  textSize(30);
  text("Score: "+currentScore, 180, 400);
  
  int timeUsed = 60 * 120 - timeLeft;
  int minsLeft = timeUsed / 3600;
  int secsLeft = timeUsed / 60 - (minsLeft * 60);
  
  if(secsLeft >= 10)
    text("Time Used: "+minsLeft+":"+secsLeft, 180, 500);
  else
  text("Time Used: "+minsLeft+":0"+secsLeft, 180, 500);
  
  text("Correct Pieces:", 180, 600);
  text(rightSpots, 180, 650);
}

void failScreen()
{
  thumbnails[puzzleType - 1].resize(1000, 750);
  background(thumbnails[puzzleType - 1]);
  tint(225, 225);
  imageMode(CORNERS);
  image(gameBG, 0, 0, width, height);
  
  noTint();
  // Logo
  logoY = 145;
  logoColour = #3C90CE;
  logoTitle = "D E F E A T E D!";
  logo();
  
  rectMode(CORNERS);
  fill(#4E6776);
  rect(60, 325, 300, 680);
  rect(width - 60, 325, width - 300, 680);
  
  imageMode(CENTER);
  image(lose, width - 180, 502, 270, 180);
  
  noFill();
  rectMode(CENTER);
  strokeWeight(7);
  stroke(100, 180);
  rect(500 + 5, 570 + 5, 280, 130, 10, 10, 10, 10);
  rect(500 + 5, 420 + 5, 280, 130, 10, 10, 10, 10);
  if (mouseX > 360 && mouseX < 640 && mouseY > 355 && mouseY < 485) // Highlights the button if mouse is hovering over it
    stroke(#36C6FC, 150);
  else 
    stroke(255);
  rect(500, 420, 280, 130, 10, 10, 10, 10);
  if (mouseX > 360 && mouseX < 640 && mouseY > 505 && mouseY < 635) // Highlights the button if mouse is hovering over it
    stroke(#36C6FC, 150);
  else 
    stroke(255);
  rect(500, 570, 280, 130, 10, 10, 10, 10);
  
  // Text for buttons
  textAlign(CENTER, CENTER);
  textFont(Segoe);
  textSize(60);
  fill(100, 180);
  text("Back!", 500 + 5, 420 + 5);
  text("Retry!", 500 + 5, 570 + 5);
  fill(255);
  text("Back!", 500, 420);
  text("Retry!", 500, 570);
  
  fill(255);
  textSize(30);
  text("Score: "+currentScore, 180, 400);
  
  int timeUsed = 60 * 120 - timeLeft;
  int minsLeft = timeUsed / 3600;
  int secsLeft = timeUsed / 60 - (minsLeft * 60);
  
  if(secsLeft >= 10)
    text("Time Used: "+minsLeft+":"+secsLeft, 180, 500);
  else
  text("Time Used: "+minsLeft+":0"+secsLeft, 180, 500);
  
  text("Correct Pieces:", 180, 600);
  text(rightSpots, 180, 650);
}
