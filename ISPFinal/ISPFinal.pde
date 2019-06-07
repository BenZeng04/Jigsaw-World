/*
Ben Zeng
2019-06-03 
ISPFinal
Ms. Basaraba
This program is a simple jigsaw puzzle game which offers eight different jigsaw puzzles for the user to pick between to try to complete.

There are three main puzzles which were brought over from previous drafts, and five bonus puzzles that I decided to add as a BONUS, since this is the final draft.

If they complete the puzzle within the time limit, their scores are saved and they can keep trying until they quit.
*/

int transitionTime = 0; // The time since the start of a new transition. This will dictate the transparency of the black screen used to manage transitions.
boolean inTransition = false;

// Fonts
PFont Segoe;
PFont SegoeLight;
PFont Agency;

// The current mode that the game is on. Each button will change the mode, which changes the method being ran inside of void draw.
int mode = -1;
int transitionToMode; // A variable used for the transitions. It allows for the mode to change after the transition is over, rather than before the transition starts.
 
/*
List of Modes:
-1 - Loading 
0 - Main Menu 
1 - Rules //<>//
2 - Scores
3 - Are you sure you want to quit? 
4 - Goodbye
5 - Puzzle Selection
6 - Gameplay 
7 - Fail
8 - Pass
9 - Save Score
10 - Additional Puzzle Selection
*/

void setup()
{
  // Basic setup
  size(1000, 750);
  frameRate(60);
  SegoeLight = loadFont("SegoeUI-Light-48.vlw");
  Segoe = loadFont("SegoeUIHistoric-48.vlw");
  Agency = loadFont("AgencyFB-Bold-48.vlw");
  decoration = loadImage("JigsawDeco.png");
  win = loadImage("TrophyDeco.png");
  lose = loadImage("FailDeco.png");
  smile = loadImage("SmileDeco.png");
  check = loadImage("Checkmark.png");
  menuBG = loadImage("MainMenuBG.png");
  menuBG.resize(1000, 750);
  gameBG = loadImage("GameBG.png");
  gameBG.resize(1000, 750);
  bonusBG = loadImage("BonusBG.png");
  bonusBG.resize(1000, 750);
  for(int i = 0; i < 8; i++)
  { //<>//
    thumbnails[i] = loadImage("Puzzle"+(i+1)+".jpg");
  }
}

void draw()
{
  // The variety of different modes and screens that will be on the program.
  if(mode == -1)
    loadingScreen();
  if(mode == 0)
    mainMenu();
  if(mode == 1)
    instructions(); 
  if(mode == 2)
    highscores();
  if(mode == 3)
    quitBox();
  if(mode == 4)   
    goodBye(); 
  if(mode == 5)
    selectPuzzle();
  if(mode == 6)
    play();
  if(mode == 7)
    failScreen(); 
  if(mode == 8)
    finishScreen(); 
  if(mode == 9)
    saveScore();
  if(mode == 10)
    morePuzzles();
    
  if(mouseClickDelay > 0) // Delay is added to each mouse claick to prevent accidentally clicking multiple buttons at a time.
    mouseClickDelay --;
    
  if(inTransition) // Transition Animation between Screens
  {
    transitionTime++;
    float transparency = (-1 * abs(transitionTime - 25) + 25) * 10;
    if(transitionTime == 25) // Halfway mark. This is when the black screen starts fading out instead of fading in and revealing the screen
    {
      mode = transitionToMode;
      if(transitionToMode == 6) // Game will setup mid-transition if the transition is to the play screen
        setupGame();
    }
    if(transitionTime > 50) // Transition completely over
    {
        inTransition = false;
        transitionTime = 0; // Resetting time
    }
    fill(0, transparency);
    noStroke();
    rectMode(CORNERS);
    rect(0, 0, width, height);
  }
}
