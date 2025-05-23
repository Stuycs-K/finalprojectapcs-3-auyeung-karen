Board board;
int cellSize;

void setup(){
  size(500,500);
  board = new Board(9, 9);
  cellSize = height/9;
  drawBoard(board);
}

void drawBoard(Board board){
  int r = 0;
   int c = 0;
   for (int i = 0; i < 9; i++){
     for (int j = 0; j < 9; j++){
       noStroke();
       if (board.grid[i][j].getType() == 0){
         fill(#E53535); //red
       }
       if (board.grid[i][j].getType() == 1){
         fill(#FCA240); //orange
       }
       if (board.grid[i][j].getType() == 2){
         fill(#FCD94A); //yellow
       }
       if (board.grid[i][j].getType() == 3){
         fill(#40D346); //green
       }
       if (board.grid[i][j].getType() == 4){
         fill(#458EE5); //blue
       }
       if (board.grid[i][j].getType() == 5){
         fill(#B745E5); //purple
       }
       rect(r, c, cellSize, cellSize);
       r += cellSize;
     }
     r = 0;
     c += cellSize;
   }
   
}
