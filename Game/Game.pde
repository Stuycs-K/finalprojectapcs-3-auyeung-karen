private Board board;
private Player p1;
private int cellSize;

public void setup(){
  size(900,1000);
  board = new Board(9, 9);
  cellSize = 900/9;
  p1 = new Player();
}

public void draw(){
  background(255);
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
         rect(x, y, cellSize, cellSize);
       }
       
     }
   }
}

public void drawScore(Player p1){
}

public void mousePressed() {
  board.mouseClick(mouseX, mouseY);
}
  
  
