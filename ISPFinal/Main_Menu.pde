// Contains everything related to the main menu. This includes the main menu itself, Highscores, Instructions, Puzzle Selection, Loading Screen, and Goodbye Screen.

float loadingScreenAnimate = 600; // This variable is used to help with animating the splash screen.
// Loading Screen Global Variables

PImage decoration;
PImage menuBG;
int totalScore = 0; // Total Score accululated throughout a session. Score is added even if it isn't saved to the leaderboard.
// Main Menu Global Variables

int best = 0, second = 0, third = 0; // UNUSED AS OF FIRST DRAFT
String bestUsername = "None Yet!", secondUsername = "None Yet!", thirdUsername = "None Yet!";
// Highscore Global Variables

PImage [] thumbnails = new PImage [8];
boolean [] completed = {false, false, false, false, false, false, false, false};
PImage check;
int puzzleType = 4; // Which puzzle, out of the puzzles are being used
// Puzzle Selection Global Variables

int countdown;
PImage smile;
// Goodbye Screen Variabes

void loadingScreen() // Loading screen
{
  int logoYPosition = 375; // Y position of the center of the logo 
  logoYPosition += 375 * loadingScreenAnimate / 600 - 375; 
  logoYPosition = max(logoYPosition, 175);
  float decoXOffset = loadingScreenAnimate - 600; // Controlls / Offsets the X position of the two jigsaw pieces on the bottom
  decoXOffset = max(decoXOffset, -300);
  
  mainMenu(); // Main Menu is ran inside here, so that it allows the loading screen to fade out into the main menu.
  // Decoration for loading screen / splash text
  noStroke();
  imageMode(CORNER);
  loadingScreenAnimate -= 4; // Value decreases every frame, which affects the state of the animation.
  tint(255, loadingScreenAnimate);
  image(menuBG, 0, 0, width, height); // Large rectangle that constantly lowers in transparency, essentially fading out into the main menu. Starts at a transparency higher than 255 to allow for a delay, allowing for the title to move upwards
  // Logo
  logoY = logoYPosition - 30;
  logoColour = #FFB624;
  logoTitle = "J I G S A W  W O R L D";
  logo();
  // Jigsaw puzzle decorations
  // Decoration
  noTint();
  imageMode(CENTER);
  image(decoration, width / 2 + decoXOffset, height - 120, 160, 160);
  image(decoration, width / 2 - decoXOffset, height - 120, 160, 160);
  
  if(loadingScreenAnimate <= 0)
    mode = 0; // Calling method mainMenu once animation is over
}

void mainMenu() // Main menu with the main actions  
{
  int shadowOffset = 5;
  int buttonOffset = 140; // A constant value for the spacing between buttons.
  
  // Title and Logo
  background(menuBG);
  logoY = 145;
  logoColour = #FFB624;
  logoTitle = "J I G S A W  W O R L D";
  logo();
  
  // Decoration
  imageMode(CENTER);
  image(decoration, 200, height - 120, 160, 160);
  image(decoration, 800, height - 120, 160, 160);
  
  // Clickable buttons
  noFill();
  strokeWeight(5);
  rectMode(CORNER);
  stroke(100, 180); // Shadow
  rect(360 + shadowOffset, 300 + shadowOffset, 280, 130, 10, 10, 10, 10);
  rect(360 + shadowOffset, 300 + buttonOffset + shadowOffset, 280, 130, 10, 10, 10, 10);
  rect(360 + shadowOffset, 300 + 2 * buttonOffset + shadowOffset, 280, 130, 10, 10, 10, 10);
  
  if (mouseX > 360 && mouseX < 640 && mouseY > 300 && mouseY < 430 && mode == 0) // Highlights the button if mouse is hovering over it
    stroke(#FFC60A, 150);
  else
    stroke(255);
  rect(360, 300, 280, 130, 10, 10, 10, 10); // Real buttons
  if (mouseX > 360 && mouseX < 640 && mouseY > 300 + buttonOffset && mouseY < 430 + buttonOffset && mode == 0) // Highlights the button if mouse is hovering over it
    stroke(#FFC60A, 150);
  else
    stroke(255);
  rect(360, 300 + buttonOffset, 280, 130, 10, 10, 10, 10);
  if (mouseX > 360 && mouseX < 640 && mouseY > 300 + 2 * buttonOffset && mouseY < 430 + 2 * buttonOffset && mode == 0) // Highlights the button if mouse is hovering over it
    stroke(#FFC60A, 150);
  else
    stroke(255);
  rect(360, 300 + 2 * buttonOffset, 280, 130, 10, 10, 10, 10); 
  
  fill(#FC4517);
  noStroke();
  ellipse(width - 60, height - 60, 100, 100);
  // Text for buttons
  
  textAlign(CENTER, CENTER);
  textFont(Segoe);
  textSize(60);
  
  fill(100, 180);
  text("PLAY!", 500 + shadowOffset, 365 + shadowOffset);
  text("HELP!", 500 + shadowOffset, 365 + buttonOffset + shadowOffset);
  text("SCORES!", 500 + shadowOffset, 365 + 2 * buttonOffset + shadowOffset);
  
  fill(255);
  text("PLAY!", 500, 365);
  text("HELP!", 500, 365 + buttonOffset);
  text("SCORES!", 500, 365 + 2 * buttonOffset);
  textSize(24);
  fill(255);
  text("QUIT..", width - 60, height - 60);
}

void quitBox() // The "Are you sure you want to quit" prompt
{
  // The overall design of the main menu will be drawn behind a big dialog box prompting the user to quit.
  
  // Main menu design 
  mainMenu();
  
  // Real dialog box and prompt
  fill(#272727, 220); 
  rectMode(CORNER);
  rect(0, 0, 1000, 750); // Large transparent screen
  fill(#FFFFFF);
  textSize(40);
  text("Are you sure you want to quit?", width / 2, height / 2 - 200); // Text
  
  // Buttons
  fill(#B9B9B9);
  strokeWeight(2);
  stroke(0);
  rect(150, 500, 300, 75);
  rect(550, 500, 300, 75);
  
  // Text for Buttons
  fill(#FFFFFF);
  textSize(30);
  text("Yes", 300, 540);
  text("No", 700, 540);
}

void instructions() // Instructions Menu
{
  // Title and Logo
  background(menuBG);
  logoY = 145;
  logoColour = #FFB624;
  logoTitle = "I N S T R U C T I O N S";
  logo();
  
  textSize(48);
  textFont(Agency);
  textAlign(CENTER, CENTER);
  fill(100, 180);
  text("How To Play!", 500 + 5, 330 + 5);
  fill(#FF8629);
  text("How To Play!", 500, 330); // Subtitle
  
  // Rules
  fill(0);
  textFont(Segoe);
  textSize(30);
  textAlign(LEFT, CENTER);
  text("To Play, Drag the puzzle pieces into the rectangle in the middle.", 100, 400);
  text("Once all the puzzle pieces are in the correct position, you ", 100, 450);
  
  float temporaryDist = textWidth("Once all the puzzle pieces are in the correct position, you "); // Temporary distance to help with the colour chance
  
  fill(#02D31C); // Green "WIN!!!" for emphasis
  text("WIN!!!", 100 + temporaryDist, 450);
  fill(0);
  text("The faster you finish, the more SCORE you get!", 100, 550);
  text("GOOD LUCK!!!!!!", 100, 650);
  
  imageMode(CENTER);
  image(decoration, 500, 670, 100, 100);
  
  // Back button
  fill(#FC4517);
  noStroke();
  ellipse(width - 60, height - 60, 100, 100);
  textSize(24);
  fill(255);
  textAlign(CENTER, CENTER);
  text("BACK..", width - 60, height - 60);
}

void goodBye()
{
  countdown--;
  int timeLeft = ceil(countdown / 60);
  background(menuBG);
  // Logo
  fill(255);
  logoY = 345;
  logoColour = #FFB624;
  logoTitle = "T H A N K S  F O R  P L A Y I N G!";
  logo();
  // Jigsaw puzzle decorations
  imageMode(CENTER);
  image(decoration, width / 2, height - 120, 160, 160);
  image(smile, 200, 620, 150, 150);
  image(smile, width - 200, 620, 150, 150);
  
  textFont(Agency);
  textAlign(CENTER, CENTER);
  textSize(75);
  fill(100, 180);
  text("Stopping in: "+timeLeft, 500 + 5, 150 + 5); 
  fill(255);
  text("Stopping in: "+timeLeft, 500, 150); 
  
  if(countdown == 0)
  {
    exit();
    return;
  }
}

void highscores() 
{
  background(menuBG);
  // Title and Logo
  logoY = 145;
  logoColour = #FFB624;
  logoTitle = "H I G H  S C O R E S";
  logo();
  textSize(48);
  textFont(Agency);
  
  fill(100, 180);
  text("Best Score: "+best+" by "+bestUsername, 500 + 5, 330 + 5); 
  text("Second Best Score: "+second+" by "+secondUsername, 500 + 5, 430 + 5); 
  text("Third Best Score: "+third+" by "+thirdUsername, 500 + 5, 530 + 5); 
  
  fill(#FF8629);
  
  text("Best Score: "+best+" by "+bestUsername, 500, 330); 
  text("Second Best Score: "+second+" by "+secondUsername, 500, 430); 
  text("Third Best Score: "+third+" by "+thirdUsername, 500, 530); 
  
  imageMode(CENTER);
  image(decoration, 500, 670, 100, 100);
  image(win, 100, 500, 130, 260);
  image(win, width - 100, 500, 130, 260);
  
  // Back button
  fill(#FC4517);
  noStroke();
  textFont(Segoe);
  ellipse(width - 60, height - 60, 100, 100);
  textSize(24);
  fill(255);
  textAlign(CENTER, CENTER);
  text("BACK..", width - 60, height - 60);
}

void selectPuzzle() // Selecing 3 different puzzles
{  
  // Title and Logo
  background(gameBG);
  logoY = 145;
  logoColour = #3C90CE;
  logoTitle = "L E V E L  S E L E C T I O N";
  logo();
  
  // Decoration
  imageMode(CENTER);
  image(decoration, 200, height - 120, 160, 160);
  image(decoration, 800, height - 120, 160, 160);
  
  // Clickable buttons
  for(int i = 0; i < 3; i ++)
  {
    strokeWeight(6);
    stroke(100, 180);
    noFill();
    rect(230 + 270 * i + 5, 420 + 5, 250, 200);
    if (mouseX > 105 + 270 * i && mouseX < 355 + 270 * i && mouseY > 320 && mouseY < 520) // Highlights the button if mouse is hovering over it
      stroke(#36C6FC, 150);
    else 
      stroke(255);
    rect(230 + 270 * i, 420, 250, 200);
    
    stroke(100, 180);
    fill(100, 180);
    rect(230 + 270 * i + 5, 420 + 5, 225, 180);
    noStroke();    
    imageMode(CENTER);
    image(thumbnails[i], 230 + 270 * i, 420, 225, 180);
    
    if(completed[i])
      image(check, 230 + 270 * i, 450, 100, 100);
      
    fill(#A0C5FF, 240);
      rect(230 + 270 * i, 380, 205, 50);
  }

  textSize(30);
  fill(255);
  text("1x  S C O R E", 230, 380);
  text("2x  S C O R E", 500, 380);
  text("3x  S C O R E", 770, 380);
  
  fill(#FC4517);
  noStroke();
  ellipse(width - 60, height - 60, 100, 100);
  textSize(24);
  fill(255);
  text("BACK..", width - 60, height - 60);
  
  if (mouseX > 400 && mouseX < 600 && mouseY > 575 && mouseY < 675) // Highlights the button if mouse is hovering over it
  {
    strokeWeight(10);
    stroke(#8FA5FC, 150);
  }
  else 
    noStroke();
    
  fill(100, 180);
  rect(500 + 5, 625 + 5, 200, 100, 10, 10, 10, 10); // Bonus Puzzles
  fill(#4B70FF);
  rect(500, 625, 200, 100, 10, 10, 10, 10); // Bonus Puzzles
  
  fill(255);
  if(totalScore >= 10000)
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
