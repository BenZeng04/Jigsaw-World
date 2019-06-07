// Contains everything related to the main menu. This includes the main menu itself, Highscores, Instructions, Puzzle Selection, Loading Screen, and Goodbye Screen.

float loadingScreenAnimate = 600; // This variable is used to help with animating the splash screen.
// Loading Screen Global Variables

PImage decoration;
PImage menuBG;
int totalScore = 0; // Total Score accululated throughout a session. Score is added even if it isn't saved to the leaderboard. 
/*
NOTE: 
If you want to see how the additional bonus puzzles look like, modify this so totalScore > 10000. This way, you start off with 10000 points and you can see the extra screen.
*/
// Main Menu Global Variables

int best = 0, second = 0, third = 0; // Best scores
String bestUsername = "None Yet!", secondUsername = "None Yet!", thirdUsername = "None Yet!";
// Highscore Global Variables

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
  
  // Shadow Buttons
  stroke(100, 180); 
  rect(360 + shadowOffset, 300 + shadowOffset, 280, 130, 20, 20, 20, 20);
  rect(360 + shadowOffset, 300 + buttonOffset + shadowOffset, 280, 130, 20, 20, 20, 20);
  rect(360 + shadowOffset, 300 + 2 * buttonOffset + shadowOffset, 280, 130, 20, 20, 20, 20);
  
  // Real Buttons
  if (mouseX > 360 && mouseX < 640 && mouseY > 300 && mouseY < 430 && mode == 0) // Highlights the button if mouse is hovering over button 1
    stroke(#FFC60A, 150);
  else
    stroke(255);
  rect(360, 300, 280, 130, 20, 20, 20, 20); 
  
  if (mouseX > 360 && mouseX < 640 && mouseY > 300 + buttonOffset && mouseY < 430 + buttonOffset && mode == 0) // Highlights the button if mouse is hovering over button 2
    stroke(#FFC60A, 150);
  else
    stroke(255);
  rect(360, 300 + buttonOffset, 280, 130, 20, 20, 20, 20);
  
  if (mouseX > 360 && mouseX < 640 && mouseY > 300 + 2 * buttonOffset && mouseY < 430 + 2 * buttonOffset && mode == 0) // Highlights the button if mouse is hovering over button 3
    stroke(#FFC60A, 150);
  else
    stroke(255);
  rect(360, 300 + 2 * buttonOffset, 280, 130, 20, 20, 20, 20); 
  
  // Back button
  strokeWeight(8);
  noFill();
  stroke(100, 180);
  ellipse(width - 60 + shadowOffset, height - 60 + shadowOffset, 100, 100); // Shadow
  textSize(24);
  fill(100, 180);
  text("QUIT..", width - 60 + shadowOffset, height - 60 + shadowOffset);
  
  if(dist(mouseX, mouseY, width - 60, height - 60) < 50  && mode == 0) // Highlights Button
    stroke(#FFC60A, 150);
  else
    stroke(255);
  noFill();
  ellipse(width - 60, height - 60, 100, 100); // Real
  fill(255);
  text("QUIT..", width - 60, height - 60);
  
  // Text for buttons
  textAlign(CENTER, CENTER);
  textFont(Segoe);
  textSize(60);
  
  fill(100, 180); // Shadow Text
  text("PLAY!", 500 + shadowOffset, 365 + shadowOffset);
  text("HELP!", 500 + shadowOffset, 365 + buttonOffset + shadowOffset);
  text("SCORES!", 500 + shadowOffset, 365 + 2 * buttonOffset + shadowOffset);
  
  textSize(60);
  fill(255); // Real Text
  text("PLAY!", 500, 365);
  text("HELP!", 500, 365 + buttonOffset);
  text("SCORES!", 500, 365 + 2 * buttonOffset);
}

void quitBox() // The "Are you sure you want to quit" prompt
{
  // The overall design of the main menu will be drawn behind a big dialog box prompting the user to quit.
  
  // Main menu design 
  mainMenu();
  
  // Real dialog box and prompt
  fill(#272727, 220); 
  noStroke();
  rectMode(CORNER);
  rect(0, 0, 1000, 750); // Large transparent screen
  fill(#FFFFFF);
  textSize(40);
  text("Are you sure you want to quit?", width / 2, height / 2 - 200); // Text
  
  // Buttons
  fill(#B9B9B9);
  strokeWeight(2);
  stroke(255);
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
  text("How To Play!", 500 + shadowOffset, 330 + shadowOffset); // Shadow
  
  fill(#FF8629);
  text("How To Play!", 500, 330); // Subtitle
  
  // Rules
  textFont(Segoe);
  textSize(30);
  
  // Box Outline for Rules
  strokeWeight(4);
  rectMode(CORNER);
  fill(#FA740D, 220); 
  stroke(100, 180);
  rect(90 + shadowOffset, 380 + shadowOffset, textWidth("To Play, Drag the puzzle pieces into the rectangle in the middle.") + 20, 200); // Shadow
  stroke(255);
  rect(90, 380, textWidth("To Play, Drag the puzzle pieces into the rectangle in the middle.") + 20, 200); // Real Box
  
  // Shadow Text
  fill(100, 180);
  textAlign(LEFT, CENTER);
  text("To Play, Drag the puzzle pieces into the rectangle in the middle.", 100 + shadowOffset, 400 + shadowOffset);
  text("Once all the puzzle pieces are in the correct position, you WIN!", 100 + shadowOffset, 450 + shadowOffset);
  text("The faster you finish, the more SCORE you get!", 100 + shadowOffset, 550 + shadowOffset);
  textSize(45);
  text("GOOD LUCK!!!!!!", 100 + shadowOffset, 650 + shadowOffset);
  
  // Real Text
  fill(255);
  textFont(Segoe);
  textSize(30);
  textAlign(LEFT, CENTER);
  text("To Play, Drag the puzzle pieces into the rectangle in the middle.", 100, 400);
  text("Once all the puzzle pieces are in the correct position, you WIN!", 100, 450);
  text("The faster you finish, the more SCORE you get!", 100, 550);
  textSize(45);
  text("GOOD LUCK!!!!!!", 100, 650);
  
  // Decoration
  imageMode(CENTER);
  image(decoration, 500, 670, 100, 100);
  
  // Back button
  strokeWeight(8);
  textAlign(CENTER, CENTER);
  textFont(Segoe);
  noFill();
  stroke(100, 180);
  ellipse(width - 60 + shadowOffset, height - 60 + shadowOffset, 100, 100); // Shadow
  textSize(24);
  fill(100, 180);
  text("BACK..", width - 60 + shadowOffset, height - 60 + shadowOffset);
  
  if(dist(mouseX, mouseY, width - 60, height - 60) < 50) // Highlights Button
    stroke(#FFC60A, 150);
  else
    stroke(255);
  noFill();
  ellipse(width - 60, height - 60, 100, 100); // Real
  fill(255);
  text("BACK..", width - 60, height - 60);
}

void goodBye()
{
  countdown--;
  int timeLeft = ceil(countdown / 60); // Countdown for when the program shuts down
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
  text("Stopping in: "+timeLeft, 500 + shadowOffset, 150 + shadowOffset); // Shadow Text
  
  fill(255);
  text("Stopping in: "+timeLeft, 500, 150); // Real Text
  
  if(countdown == 0) // Shuts off when done
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
  
  fill(100, 180); // Shadow Text
  text("Best Score: "+best+" by "+bestUsername, 500 + shadowOffset, 330 + shadowOffset); 
  text("Second Best Score: "+second+" by "+secondUsername, 500 + shadowOffset, 430 + shadowOffset); 
  text("Third Best Score: "+third+" by "+thirdUsername, 500 + shadowOffset, 530 + shadowOffset); 
  
  fill(#FF8629); // Real Text
  text("Best Score: "+best+" by "+bestUsername, 500, 330); 
  text("Second Best Score: "+second+" by "+secondUsername, 500, 430); 
  text("Third Best Score: "+third+" by "+thirdUsername, 500, 530); 
  
  // Decoration
  imageMode(CENTER);
  image(decoration, 500, 670, 100, 100);
  image(win, 100, 500, 130, 260);
  image(win, width - 100, 500, 130, 260);
  
  // Back button
  textAlign(CENTER, CENTER);
  textFont(Segoe);
  strokeWeight(8);
  noFill();
  stroke(100, 180);
  ellipse(width - 60 + shadowOffset, height - 60 + shadowOffset, 100, 100); // Shadow
  textSize(24);
  fill(100, 180);
  text("BACK..", width - 60 + shadowOffset, height - 60 + shadowOffset);
  
  if(dist(mouseX, mouseY, width - 60, height - 60) < 50) // Highlights Button
    stroke(#FFC60A, 150);
  else
    stroke(255);
  noFill();
  ellipse(width - 60, height - 60, 100, 100); // Real
  fill(255);
  text("BACK..", width - 60, height - 60);
}
