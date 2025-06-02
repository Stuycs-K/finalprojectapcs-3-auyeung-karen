private Board board;
private Player p1;
private int cellSize;
private PImage background;

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
         int y = i * cellSize;
         rect(x+700, y+25, cellSize, cellSize);
       }
       
     }
   }
}

public void drawScore(Player p1){
  fill(0);
  rect(10, 0, 100, 300);
  text("Score: " + p1.getScore(), 20, 940);
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
  
  
