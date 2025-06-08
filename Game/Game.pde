private Board board;
private Player p1;
private int cellSize;

private PImage background;
private PImage redCandy;
private PImage orangeCandy;
private PImage yellowCandy;
private PImage greenCandy;
private PImage blueCandy;
private PImage purpleCandy;

private PFont candycrush;

private static int IDLE = 0;
private static int SWAPPING = 1;
private static int CHECKING = 2;
private static int CLEARING = 3;
private static int REFILLING = 4;
private static int ANIMATING = 5;
private static int MODE = IDLE;

public void setup(){
  size(1920,1080);
  p1 = new Player(30);
  board = new Board(9, 9);
  cellSize = 900/9;
  background = loadImage("candycrush.jpg");
  
  redCandy = loadImage("red.png");
  orangeCandy = loadImage("orange.png");
  yellowCandy = loadImage("yellow.png");
  greenCandy = loadImage("green.png");
  blueCandy = loadImage("blue.png");
  purpleCandy = loadImage("purple.png");
}

public void draw(){
  background(background);
  fill(#5F7AB4);
  rect(700, 25, 900, 900);
  drawBoard(board);
  drawScore(p1);
  animate();
  
  if (MODE == SWAPPING){
    board.checkMatches();
    MODE = CHECKING;
  }
  else if (MODE == CHECKING){
    if (board.hasMatched()){
      p1.numMoves--;
      MODE = CLEARING;
    }
    else{
      board.undoSwap();
      MODE = IDLE;
    }
  }
  else if (MODE == CLEARING){
    board.clearMatches();
    MODE = REFILLING;
  }
  else if (MODE == REFILLING){
    board.refillBoard();
    MODE = ANIMATING;
  }
  else if (MODE == ANIMATING){
    if (!board.isAnimating()){
      board.checkMatches();
      if (board.hasMatched()){
        MODE = CLEARING;
      }
      else{
        MODE = IDLE;
      }
    }
  }
  
  if (p1.getNumMoves() <= 0){
    drawEnd(p1);
  }
}

public void drawBoard(Board board){
  float size = 100;
   for (int i = 0; i < 9; i++){
     for (int j = 0; j < 9; j++){
       Candy candy = board.grid[i][j];
       int x = j * cellSize;
       //int y = i * cellSize;
       float animatedY = candy.getAnimatedY() * cellSize;
         if (candy.isSelected()){
           fill(255);
           rect(x+700, animatedY+25, 100, 100);
           //stroke(0);
           //strokeWeight(4);
         }
         else{
           noStroke();
         }
         if (candy.getType() == 0){
           image(redCandy, x+700, animatedY+25, size, size);
           //fill(#E53535); //red
         }
         if (candy.getType() == 1){
           image(orangeCandy, x+700, animatedY+25, size, size);
           //fill(#FCA240); //orange
         }
         if (candy.getType() == 2){
           image(yellowCandy, x+700, animatedY+25, size, size);
           //fill(#FCD94A); //yellow
         }
         if (candy.getType() == 3){
           image(greenCandy, x+700, animatedY+25, size, size);
           //fill(#40D346); //green
         }
         if (candy.getType() == 4){
           image(blueCandy, x+700, animatedY+25, size, size);
           //fill(#458EE5); //blue
         }
         if (candy.getType() == 5){
           image(purpleCandy, x+700, animatedY+25, size, size);
           //fill(#B745E5); //purple
         }
         if (candy.getType() == -1){
           fill(255);
         }
         //rect(x+700, animatedY+25, cellSize, cellSize);
       }
       
     
   }
}

public void animate(){
  boolean animating = false;
  float frame = 0.075;
  
  for (int i = 0; i < 9; i++){
    for (int j = 0; j < 9; j++){
      Candy candy = board.grid[i][j];
      if (candy != null){
        float targetY = candy.getY();
        float currentY = candy.getAnimatedY();
        
        if (abs(currentY - targetY) > frame){
          if (currentY < targetY){
            candy.setAnimatedY(currentY+frame);
          }
          else{
            candy.setAnimatedY(currentY - frame);
          }
          candy.setFalling(true);
          animating = true;
        }
        else{
          candy.setAnimatedY(targetY);
          candy.setFalling(false); // finish
        }
      }
    }
  }
  board.setAnimating(animating);
}

public void drawScore(Player p1){
  fill(#FFB4D1);
  rect(175, 200, 350, 550, 10);
  fill(#F782AF);
  rect(200, 225, 300, 100, 20);
  rect(200, 350, 300, 100, 20);
  rect(200, 475, 300, 100, 20);
  candycrush = createFont("LobsterTwo", 10);
  textFont(candycrush);
  fill(0);
  textSize(36);
  text("Score: " + p1.getScore(), 220, 290);
  text("High Score: " + p1.getHighScore(), 220, 415);
  text("Moves left: " + p1.getNumMoves(), 220, 540);
  textSize(18);
  text("Press 'r' or 'R' to restart", 220, 610);
  text("Press '-' or '+' to remove/add" , 220, 640);
  text("to the number of moves", 220, 660);
}

public void drawEnd(Player p1){
  fill(#FFB4D1);
  int xCord = 1920/2-300;
  int yCord = 1080/2-100;
  rect(xCord, yCord, 600, 200, 20);
  fill(0);
  textFont(candycrush);
  textSize(40);
  text("Game over! Your score: " + p1.getScore(), xCord+30, yCord+75);
  text("Press r to restart!", xCord+30, yCord+140);
}

public void mousePressed() {
  if (MODE == IDLE){
    boolean swapped = board.mouseClick(mouseX, mouseY);
    if (swapped){
      MODE = SWAPPING;
    }
  }
  
}

public void keyPressed(){
  if (key == 'r' || key == 'R'){
    resetGame();
  }
  if (key == '+'){
    p1.addNumMoves();
  }
  if (key == '-'){
    p1.minusNumMoves();
  }
}

public void resetGame(){
  p1.resetScore();
  board = new Board(9, 9);
}
  
  
