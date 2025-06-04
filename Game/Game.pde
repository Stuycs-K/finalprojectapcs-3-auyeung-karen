private Board board;
private Player p1;
private int cellSize;
private PImage background;
private PFont candycrush;

public void setup(){
  size(1920,1080);
  p1 = new Player(30);
  board = new Board(9, 9);
  cellSize = 900/9;
  background = loadImage("candycrush.jpg");
}

public void draw(){
  background(background);
  drawBoard(board);
  drawScore(p1);
  animate();
}

public void drawBoard(Board board){
   for (int i = 0; i < 9; i++){
     for (int j = 0; j < 9; j++){
       Candy candy = board.grid[i][j];
       if (candy != null){
         if (candy.isSelected()){
           stroke(0);
           strokeWeight(4);
         }
         else{
           noStroke();
         }
         
         if (candy.getType() == 0){
           fill(#E53535); //red
         }
         if (candy.getType() == 1){
           fill(#FCA240); //orange
         }
         if (candy.getType() == 2){
           fill(#FCD94A); //yellow
         }
         if (candy.getType() == 3){
           fill(#40D346); //green
         }
         if (candy.getType() == 4){
           fill(#458EE5); //blue
         }
         if (candy.getType() == 5){
           fill(#B745E5); //purple
         }
         if (candy.getType() == -1){
           fill(255);
         }
         int x = j * cellSize;
         //int y = i * cellSize;
         float animatedY = candy.getAnimatedY() * cellSize;
         rect(x+700, animatedY+25, cellSize, cellSize);
       }
       
     }
   }
}

public void animate(){
  boolean animating = false;
  
  for (int i = 0; i < 9; i++){
    for (int j = 0; j < 9; j++){
      Candy candy = board.grid[i][j];
      if (candy != null){
        float targetY = candy.getY();
        float currentY = candy.getAnimatedY();
        if (abs(currentY - targetY) > 0.01){
          float newY = lerp(currentY, targetY, 0.15); // start, end, increment
          candy.setAnimatedY(newY); // animation
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
  candycrush = createFont("LobsterTwo", 10);
  textFont(candycrush);
  fill(0);
  textSize(36);
  text("Score: " + p1.getScore(), 220, 290);
  text("High Score: " + p1.getHighScore(), 20, 960);
  text("Moves left: " + p1.getNumMoves(), 20, 980);
}

public void mousePressed() {
  board.mouseClick(mouseX, mouseY);
}

public void keyPressed(){
  if (key == 'r' || key == 'R'){
    resetGame();
  }
}

public void resetGame(){
  p1.resetScore();
  board = new Board(9, 9);
}
  
  
