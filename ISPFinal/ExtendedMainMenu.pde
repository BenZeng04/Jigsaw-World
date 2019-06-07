// Puzzle Selection Screens

PImage [] thumbnails = new PImage [8];
boolean [] completed = {false, false, false, false, false, false, false, false};
PImage check;
int puzzleType; // Which puzzle, out of the puzzles are being used
// Puzzle Selection Global Variables

PImage bonusBG;
// Extra Selection Global Variables

void selectPuzzle() // Selecing 3 different puzzles
{  
  // Title and Logo
  background(gameBG);
  logoY = 145;
  logoColour = #59B7E8;
  logoTitle = "L E V E L  S E L E C T I O N";
  logo();
  
  // Decoration
  imageMode(CENTER);
  image(decoration, 200, height - 120, 160, 160);
  image(decoration, 800, height - 120, 160, 160);
  
  // Clickable buttons
  for(int i = 0; i < 3; i++) // For loop draws the 3 buttons
  {
    noFill();
    strokeWeight(6);
    
    stroke(100, 180);
    rect(230 + 270 * i + shadowOffset, 420 + shadowOffset, 250, 200); // Shadow for Button
    
    if (mouseX > 105 + 270 * i && mouseX < 355 + 270 * i && mouseY > 320 && mouseY < 520) // Highlights the button if mouse is hovering over it
      stroke(#36C6FC, 150);
    else 
      stroke(255);
      
    rect(230 + 270 * i, 420, 250, 200); // Real Button
    
    stroke(100, 180);
    fill(100, 180);
    rect(230 + 270 * i + shadowOffset, 420 + shadowOffset, 225, 180); // Rectangular Shadow for Image
    
    noStroke();    
    imageMode(CENTER);
    image(thumbnails[i], 230 + 270 * i, 420, 225, 180); // Image / Thumbnail inside each button
    
    if(completed[i]) // Adds a checkmark if the puzzle has been completed before
      image(check, 230 + 270 * i, 450, 100, 100);
      
    fill(#A0C5FF, 240); // Icon for holding the score multipliers. 
      rect(230 + 270 * i, 380, 205, 50);
      
    textSize(30);
    fill(255);
    text((i + 1) + "x  S C O R E", 230 + 270 * i, 380); // Score Multiplier Display
  }
  
  // Back button
  strokeWeight(8);
  noFill();
  stroke(100, 180);
  ellipse(width - 60 + shadowOffset, height - 60 + shadowOffset, 100, 100); // Shadow
  textSize(24);
  fill(100, 180);
  text("BACK..", width - 60 + shadowOffset, height - 60 + shadowOffset);
  
  if(dist(mouseX, mouseY, width - 60, height - 60) < 50) // Highlights Button
    stroke(#8FA5FC, 150);
  else
    stroke(255);
  noFill();
  ellipse(width - 60, height - 60, 100, 100); // Real
  fill(255);
  text("BACK..", width - 60, height - 60);
  
  // Bonus Puzzle
  noStroke();
  fill(100, 180);
  rect(500 + shadowOffset, 625 + shadowOffset, 200, 100, 10, 10, 10, 10); // Shadow for Button
  
  if (mouseX > 400 && mouseX < 600 && mouseY > 575 && mouseY < 675) // Highlights the Bonus puzzle button if mouse is hovering over it
  {
    strokeWeight(10);
    stroke(#8FA5FC, 150);
  }
  else 
    noStroke();
    
  fill(#4B70FF);
  rect(500, 625, 200, 100, 10, 10, 10, 10); // Real button, allows you to choose bonus puzzles if you have enough score
  
  fill(255);
  if(totalScore >= 10000) // Text inside Button
  {
    textSize(30);
    text("More Puzzles!", 500, 625);
  }
  else
  {
    textSize(24);
    text("Unlock at 10000 Score.", 500, 625, 200, 100);
  }  
}

void morePuzzles() // Selecting Bonus 5 puzzles
{
  // Title and Logo
  background(bonusBG);
  logoY = 145;
  logoColour = #D700F5;
  logoTitle = "E X T R A  S E L E C T I O N";
  logo();
  
  // Decoration
  imageMode(CENTER);
  image(decoration, 200, height - 120, 160, 160);
  image(decoration, 800, height - 120, 160, 160);
  
  for(int i = 3; i < 8; i++) // Puzzle Buttons, used for selecting the 5 additional puzzles
  {
    noFill();
    rectMode(CENTER);
    
    noFill();
    strokeWeight(5);
    stroke(100, 180);
    rect(200 * i - 500 + shadowOffset, 420 + shadowOffset, 190, 154); // Shadow for buttons
    
    if (mouseX > 200 * i - 590 && mouseX < 200 * i - 410 && mouseY > 348 && mouseY < 492) // Highlights the button if mouse is hovering over it
      stroke(#8FA5FC, 150);
    else 
      stroke(255);

    rect(200 * i - 500, 420, 190, 154); // Real buttons
    
    // Button Thumbnails
    imageMode(CENTER);
    image(thumbnails[i], 200 * i - 500, 420, 180, 144);
    if(completed[i])
      image(check, 200 * i - 500, 450, 75, 75);
    
    noStroke();
    fill(#A0C5FF, 240);
    rect(200 * i - 500, 390, 165, 40);
  }
  
  // Score Multipliers
  textAlign(CENTER, CENTER);
  textSize(20);
  fill(255);
  text("1x  S C O R E", 100, 390);
  text("2x  S C O R E", 300, 390);
  text("3x  S C O R E", 500, 390);
  text("2x  S C O R E", 700, 390);
  text("5x  S C O R E", 900, 390);
  
  // Back button
  strokeWeight(8);
  noFill();
  stroke(100, 180);
  ellipse(width - 60 + shadowOffset, height - 60 + shadowOffset, 100, 100); // Shadow
  textSize(24);
  fill(100, 180);
  text("BACK..", width - 60 + shadowOffset, height - 60 + shadowOffset);
  
  if(dist(mouseX, mouseY, width - 60, height - 60) < 50) // Highlights Button
    stroke(#8FA5FC, 150);
  else
    stroke(255);
  noFill();
  ellipse(width - 60, height - 60, 100, 100); // Real
  fill(255);
  text("BACK..", width - 60, height - 60);
}
