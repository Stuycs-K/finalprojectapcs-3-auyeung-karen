import java.io.*;
import java.util.*;

class Board{
  Candy[][] grid;
  Candy selected = null;
  
  public Board(int rows, int cols){
    grid = new Candy[rows][cols];
    
    for (int i = 0; i < rows; i++){
      for (int j = 0; j < cols; j++){
        int type = (int)(Math.random()*6);
        
        if (i >= 2 && grid[i-1][j].getType() == type && grid[i-2][j].getType() == type){
          type = (type+1)%6;
        }
        if (j >= 2 && grid[i][j-1].getType() == type && grid[i][j-2].getType() == type){
          type = (type+1)%6;
        }
        grid[i][j] = new Candy(j, i, type);
      }
        
    }
      
      
      
  }
  
  void mouseClick(int mouseX, int mouseY){
    int x = mouseX/cellSize;
    int y = mouseY/cellSize;
    if (x >= 0 && x < 9 && y >= 0 && y < 9){
      if (!board.grid[y][x].isSelected()){
        selected = grid[y][x];
        board.grid[y][x].select();
      }
      else{
        selected = null;
        board.grid[y][x].deselect();
      }
    }
    println(x);
  }
  
  public boolean isAdjacent(Candy one, Candy two){
    return (abs(one.x - two.x) == 1 && one.y == two.y || abs(one.y - two.y) == 1 && one.x == two.x);
  }
  
  
}
