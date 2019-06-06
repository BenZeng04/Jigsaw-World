PImage bonusBG;

void morePuzzles()
{
  // Title and Logo
  background(bonusBG);
  logoY = 145;
  logoColour = #4B70FF;
  logoTitle = "E X T R A  S E L E C T I O N";
  logo();
  
  // Decoration
  imageMode(CENTER);
  image(decoration, 200, height - 120, 160, 160);
  image(decoration, 800, height - 120, 160, 160);
  
  fill(#FC4517);
  noStroke();
  ellipse(width - 60, height - 60, 100, 100);
  
  for(int i = 3; i < 8; i++)
  {
    noFill();
    rectMode(CENTER);
    strokeWeight(5);
    stroke(100, 180);
    rect(200 * i - 500 + 5, 420 + 5, 190, 154);
    if (mouseX > 200 * i - 590 && mouseX < 200 * i - 410 && mouseY > 348 && mouseY < 492) // Highlights the button if mouse is hovering over it
      stroke(#8FA5FC, 150);
    else 
      stroke(255);
    noFill();
    rect(200 * i - 500, 420, 190, 154);
    // Button Thumbnails
    imageMode(CENTER);
    image(thumbnails[i], 200 * i - 500, 420, 180, 144);
    if(completed[i])
      image(check, 200 * i - 500, 450, 75, 75);
    
    noStroke();
    fill(#A0C5FF, 240);
    rect(200 * i - 500, 390, 165, 40);
  }
  
  textAlign(CENTER, CENTER);
  textSize(20);
  fill(255);
  text("1x  S C O R E", 100, 390);
  text("2x  S C O R E", 300, 390);
  text("3x  S C O R E", 500, 390);
  text("2x  S C O R E", 700, 390);
  text("5x  S C O R E", 900, 390);
  
  textSize(24);
  fill(255);
  text("BACK..", width - 60, height - 60);
}
