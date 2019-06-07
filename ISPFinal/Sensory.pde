// Key and Mouse press detection logic is here.

int mouseClickDelay = 10; // Delay between mouse clicks to ensure smooth button presses

void keyPressed() // For saving scores ONLY
{
  if(mode == 9)
  {
    if((key >= 48 && key <= 57) || (key >= 65 && key <= 90) || (key >= 97 && key <= 122))
    {
      username += key;
    }
    if(key == ' ' && username.length() > 0)
      username += key;
      
    if(key == BACKSPACE)
    {
      username = username.substring(0, max(0, username.length() - 1));
    }
  }
}

void mousePressed() // All mouse input, depending on the mode. Generally for tracking button presses and puzzle piece selection. Many of the button presses cause a transition.
{
  if(!inTransition) // First makes sure that no transition is going on right now
  { 
    if(mode == 0)
    {
      // Buttons only
      int buttonOffset = 140;
      if (mouseClickDelay == 0)
      {
        if (mouseButton == LEFT && mouseX > 360 && mouseX < 640 && mouseY > 300 && mouseY < 430)
        {
          transitionToMode = 5;
          transitionTime = 0;
          inTransition = true;
          mouseClickDelay = 10;
        }
        else if (mouseButton == LEFT && mouseX > 360 && mouseX < 640 && mouseY > 300 + buttonOffset && mouseY < 430 + buttonOffset)
        {
          transitionToMode = 1;
          transitionTime = 0;
          inTransition = true;
          mouseClickDelay = 10;
        }
        else if (mouseButton == LEFT && mouseX > 360 && mouseX < 640 && mouseY > 300 + buttonOffset && mouseY < 430 + 2 * buttonOffset)
        {
          transitionToMode = 2;
          transitionTime = 0;
          inTransition = true;
          mouseClickDelay = 10;
        }
        else if (mouseButton == LEFT && dist(mouseX, mouseY, width - 60, height - 60) < 50)
        {
          mode = 3; // No transition needed here - This is to go to the "are you sure you want to quit?" screen
          mouseClickDelay = 10;
        }
      }
    }
    if(mode == 1)
    {
      if (mouseButton == LEFT && dist(mouseX, mouseY, width - 60, height - 60) < 50)
        {
          transitionToMode = 0;
          transitionTime = 0;
          inTransition = true;
          mouseClickDelay = 10;
        }
    }
    if(mode == 2)
    {
      if (mouseButton == LEFT && dist(mouseX, mouseY, width - 60, height - 60) < 50)
        {
          transitionToMode = 0;
          transitionTime = 0;
          inTransition = true;
          mouseClickDelay = 10;
        }
    }
    if(mode == 3)
    {
      // Buttons only
      if (mouseClickDelay == 0)
      {
        if (mouseButton == LEFT && mouseX > 150 && mouseX < 450 && mouseY > 500 && mouseY < 575)
        {
          transitionToMode = 4;
          transitionTime = 0;
          inTransition = true;
          mouseClickDelay = 10;
          countdown = 60 * 5;
        }
        else if (mouseButton == LEFT && mouseX > 550 && mouseX < 850 && mouseY > 500 && mouseY < 575)
        {
          mode = 0; // No transition needed
          mouseClickDelay = 10;
        }
      }
    }
    if(mode == 5)
    {
      // Buttons only, also help setup game.
      if (mouseClickDelay == 0)
      {
        for(int i = 0; i < 3; i ++)
        {
          if (mouseButton == LEFT && mouseX > 105 + 270 * i && mouseX < 355 + 270 * i && mouseY > 320 && mouseY < 520) // Choosing 3 puzzles
          {
            transitionToMode = 6;
            transitionTime = 0;
            inTransition = true;
            puzzleType = i + 1;
            mouseClickDelay = 10;
            scoreMultiplier = i + 1;
          }
        }
        if (mouseButton == LEFT && dist(mouseX, mouseY, width - 60, height - 60) < 50) // Back
        {
          transitionToMode = 0;
          transitionTime = 0;
          inTransition = true;
          mouseClickDelay = 10;
        }
        else if (mouseButton == LEFT && mouseX > 400 && mouseX < 600 && mouseY > 575 && mouseY < 675) // More Puzzles
        {
          if(totalScore >= 10000)
          {
            transitionToMode = 10;
            transitionTime = 0;
            inTransition = true;
            mouseClickDelay = 10;
          }
        }
      }
    }
    if(mode == 6)
    {
      if (mouseButton == LEFT && dist(mouseX, mouseY, width - 60, 60) < 50) // Back button
      {
        if(puzzleType <= 3)
          transitionToMode = 5;
        else
          transitionToMode = 10;
        transitionTime = 0;
        inTransition = true;
        mouseClickDelay = 10;
      }
      // Puzzle piece selection and picking up code.
      boolean finished = false; // A boolean that will turn true if a piece has been selected. This allows for only one piece to be selected at once.
      
      
      if(pieceSelected == -1) // Makes sure no piece is selected before even starting.
      { 
        for(int i = 19; i > -1; i--) // i represents the displayPriority that the code below is looking for. This allows the pieces with higher priority to get picked up, rather than the ones below it.
        {
          if(finished)
            break; // Quits if finished.
            
          for(int j = 0; j < 20; j++) // Checks all 20 pieces
          {
            if(displayPriority[j] == i) // Runs code for the specific piece matching the displayPriority represented by i. Since i runs through every index possible, a piece will always be selected if the mouse is on it.
            {
              if (mouseButton == LEFT && mouseX > x[j] - 50 && mouseX < x[j] + 50 && mouseY > y[j] - 50 && mouseY < y[j] + 50) // Checks if the mouse is inside the piece
              {
                pieceSelected = j; // Changes the piece selected
                finished = true; // Finished the code, allowing it to quit
                originalX = mouseX; 
                originalY = mouseY;
                // Sets original position for the mouse, so it can track mouse movement. This allows for smooth relocation of the pieces, rather than abrupt teleportation to the mouse 
                originalPieceX = x[j];
                originalPieceY = y[j];
                // Sets original position for the piece. This is added onto the mouse's movement to calculate new location.
                break;
              }
            }
          }     
        }    
      }
    }
    if(mode == 7)
    {
      // Buttons only
      if (mouseClickDelay == 0)
      {
        if (mouseButton == LEFT && mouseX > 360 && mouseX < 640 && mouseY > 355 && mouseY < 485)
        {
          transitionToMode = 0;
          transitionTime = 0;
          inTransition = true;
          mouseClickDelay = 10;
        }
        else if (mouseButton == LEFT && mouseX > 360 && mouseX < 640 && mouseY > 505 && mouseY < 635)
        {
          transitionToMode = 6;
          transitionTime = 0;
          inTransition = true;
          mouseClickDelay = 10;
        }
      }
    }
    if(mode == 8)
    {
      // Buttons only
      if (mouseClickDelay == 0)
      {
        if (mouseButton == LEFT && mouseX > 360 && mouseX < 640 && mouseY > 295 && mouseY < 425)
        {
          transitionToMode = 0;
          transitionTime = 0;
          inTransition = true;
          mouseClickDelay = 10;
        }
        else if (mouseButton == LEFT && mouseX > 360 && mouseX < 640 && mouseY > 445 && mouseY < 575)
        {
          transitionToMode = 6;
          transitionTime = 0;
          inTransition = true;
          mouseClickDelay = 10;
        }
        else if (mouseButton == LEFT && mouseX > 360 && mouseX < 640 && mouseY > 595 && mouseY < 725 && !scoreSaved)
        {
          transitionToMode = 9;
          transitionTime = 0;
          inTransition = true;
          mouseClickDelay = 10;
          username = "";
        }
      }
    }
    if(mode == 9)
    {
      if (mouseClickDelay == 0)
      {
        if (mouseButton == LEFT && mouseX > 350 && mouseX < 650 && mouseY > 525 && mouseY < 675) // Username Saving
        {
          textSize(36);
          if(username.length() > 0 && textWidth(username) <= 500) // Makes sure that the username is valid! (Cannot be blank, cannot be way too long)
          {
            username = username.trim(); // Trims unneccesary spaces
            // Transitioning back to the victory screen
            transitionToMode = 8;
            transitionTime = 0;
            inTransition = true;
            mouseClickDelay = 10;
            // Overriding Scores
            if(currentScore > best)
            {
              third = second;
              thirdUsername = secondUsername;
              second = best;
              secondUsername = bestUsername;
              best = currentScore;
              bestUsername = username;
            }
            else if(currentScore > second)
            {
              third = second;
              thirdUsername = secondUsername;
              second = currentScore;
              secondUsername = username;
            }
            else if(currentScore > third)
            {
              third = currentScore;
              thirdUsername = username;
            }
            scoreSaved = true;
          }
        }
      }
    }
    if(mode == 10)
    {
      // Buttons only, also help setup game.
      if (mouseClickDelay == 0)
      {
        for(int i = 3; i < 8; i ++)
        {
          if (mouseButton == LEFT && mouseX > 200 * i - 590 && mouseX < 200 * i - 410 && mouseY > 348 && mouseY < 492) // Choosing 3 puzzles
          {
            transitionToMode = 6;
            transitionTime = 0;
            inTransition = true;
            puzzleType = i + 1;
            mouseClickDelay = 10;
            if(puzzleType == 4)
              scoreMultiplier = 1;
            if(puzzleType == 5)
              scoreMultiplier = 2;
            if(puzzleType == 6)
              scoreMultiplier = 3;
            if(puzzleType == 7)
              scoreMultiplier = 2;
            if(puzzleType == 8)
              scoreMultiplier = 5;
          }
        }
        if (mouseButton == LEFT && dist(mouseX, mouseY, width - 60, height - 60) < 50) // Back
        {
          transitionToMode = 5;
          transitionTime = 0;
          inTransition = true;
          mouseClickDelay = 10;
        }
      }
    }
  }
}
