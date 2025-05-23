import java.io.*;
import java.util.*;

class Board{
  Candy[][] grid;
  Candy selected = null;
  
  public Board(int rows, int cols){
    grid = new Candy[rows][cols];
    
    for (int i = 0; i < rows; i++){
      for (int j = 0; j < cols; j++){
        grid[i][j] = new Candy(j, i, (int)(Math.random()*4+1));
      }
    }
  }
  
  void mouseClick(int mouseX, int mouseY){
  }
  
  public boolean isAdjacent(Candy one, Candy two){
    return (abs(one.x - two.x) == 1 && one.y == two.y || abs(one.y - two.y) == 1 && one.x == two.x);
  }
  
  
}
