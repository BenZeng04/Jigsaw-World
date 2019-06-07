// All methods for gameplay are here.

// Gameplay Global Variables
PImage [] puzzle = new PImage [20];
PImage gameBG;
int timeLeft; // Time left to complete the puzzle.
int currentScore; // Score during a single game.
int [] displayPriority = new int [20]; // Which order the pieces are displayed. 
int pieceSelected; // The current piece selected.
int rightSpots; // Amount of pieces in the correct spot, for scoring fails
int scoreMultiplier = 1; // Multiplier so that hard puzzles give more score
int [] x = new int [20]; 
int [] y = new int [20];
int originalX, originalY; // Original co-ordinates of the mouse that is selecting a puzzle piece
int originalPieceX, originalPieceY; // Original co-ordinates of the puzzle piece that is being selected

void play() // Gameplay logic
{
  rightSpots = 20;
  boolean finished = true; // Boolean for if the puzzle is finished. It starts out as true when initialized but immediately becomes false if any piece is in the wrong spot.
  playDeco(); // Playfield decoration
  timeLeft -= 1;
  imageMode(CENTER);
  rectMode(CENTER);
  fill(255);
  noStroke();
  for(int i = 0; i < 20; i++) // Displaying all the puzzle pieces
  {
    for(int j = 0; j < 20; j++)
    {
      if(displayPriority[j] == i)
      {
        if(j == pieceSelected) // The selected piece is highlighted more
        {
          strokeWeight(20);
          stroke(#FFC400, 150); 
        }
        else
        {
          strokeWeight(3);
          stroke(255);
        }
        // The puzzle piece.
        
        noFill();
        image(puzzle[j], x[j], y[j], 100, 100);
        rect(x[j], y[j], 100, 100);
      }
    }
  } 
  
  for(int i = 0; i < 20; i++) // Checks if puzzle is finished
  {
    if(x[i] != (i % 5) * 100 + 300 || y[i] != (i / 5) * 100 + 225 || pieceSelected == i) // Checks if the piece is in the right position and the piece isn't being selected. If it is, then the puzzle is not complete.
    {
      finished = false; 
      rightSpots--;
    }
  }
  
  for(int i = 0; i < 20; i++)
  {
    if(pieceSelected == i) // This will move the current selected piece.
    {
      // New position = old position + how much the mouse has moved. 
      x[i] = originalPieceX + mouseX - originalX; 
      y[i] = originalPieceY + mouseY - originalY;
      x[i] = min(950, max(50, x[i]));
      y[i] = min(700, max(175, y[i]));
    }
  }
  
  if(finished) // The puzzle is completed once all pieces are in their correct position. No transitions are used here, as the "Victory" is meant to be instant.
  {  
    mode = 8;
    currentScore = 10000000 / (60 * 125 - timeLeft) * scoreMultiplier;
    totalScore += currentScore;
    completed[puzzleType - 1] = true;
    scoreSaved = false;
  }
  if(timeLeft == 0) // IF the player runs out of time, fail.
  {
    mode = 7;
    // Score is 0 if failed
  }
  
  if(pieceSelected != -1)
  {
    int [] priorityUpdate = displayPriority; // New array to update the display priorities.
    for(int i = 0; i < 20; i++)
    {
      if(priorityUpdate[i] > priorityUpdate[pieceSelected]) // All pieces that are higher priority / layer will decrease in layer. 
        priorityUpdate[i]--; 
    }
    priorityUpdate[pieceSelected] = 19; // Selected piece is now high priority. 
    displayPriority = priorityUpdate; // Replaces old array with updated array
  }
  
  if(!(mousePressed && mouseButton == LEFT)) // If the mouse is released
  {
    for(int i = 19; i >= 0; i--) // Snapping the puzzle pieces 
    {
      for(int k = 0; k < 20; k++)
      {
        if(displayPriority[k] == i) // Pieces with the highest DP will get snapped first, if there are two pieces that can snap to one place. This is very rare, but can happen if there are 2 pieces are overlapping on top of a not-empty square, and one of the pieces is moved.
        {
          // The center of the nearest place inside the middle rectangular box that the puzzle piece can snap to. 
          int snapToX = int((x[k] - 250) / 100) * 100 + 300;
          int snapToY = int((y[k] - 175) / 100) * 100 + 225;
          boolean emptySquare = true; // If that nearest place is empty.
          pieceSelected = -1;
          if(x[k] > 250 && x[k] < 750 && y[k] > 175 && y[k] < 575)
          {
            for(int j = 0; j < 20; j++)
            {
              if(x[j] == snapToX && y[j] == snapToY) // If any of the 20 pieces are snapped to the place that this piece "wants" to snap to, it is not an empty square and the piece cannot snap to it.
                emptySquare = false;
            }
            if(emptySquare)
            {
              // It snaps to that place if it is empty.
              x[k] = snapToX;
              y[k] = snapToY;
            }
          }
        }
      }
    }
  }
}

void setupGame() // Sets up the variables for the game, depending on what puzzle is picked.
{
  timeLeft = 60 * 120;
  currentScore = 0;
  pieceSelected = -1;
  for(int i = 0; i < 20; i++) // Randomizing positions
  {
    displayPriority[i] = i;
    int randomNumber = int(random(3));
    // It can appear in three different places, but cannot appear already in the rectangle boundary.
    if(randomNumber == 1) // Left of the boundary
    {
      x[i] = int(random(60, 190));
      y[i] = int(random(235, 690));
    }
    else if(randomNumber == 2) // Bottom
    {
      x[i] = int(random(810, 940));
      y[i] = int(random(235, 690));
    }
    else // Right
    {
      x[i] = int(random(190, 810));
      y[i] = int(random(635, 690));
    }
  }
  
  int oldValue;
  int newIndex;
  for(int i = 0; i < 20; i++) // Randomizes the displayPriority array, which decides in what order are the pieces displayed and what piece is on top of another piece
  { 
    oldValue = displayPriority[i]; // Sets the "old value"
    newIndex = int(random(0, 19)); // Picks a random number from 0 to 19, the possible indecies of the array
    displayPriority[i] = displayPriority[newIndex]; // Sets the number which stored the old value, to the value of the new index
    displayPriority[newIndex] = oldValue; // Replaces the new index with the old value
  } 
  
  // Setting up the images. Concatination is used.
  for(int i = 0; i < 20; i++)
  {
    puzzle[i] = loadImage(puzzleType+""+(i+1)+".jpg");
  }
}
