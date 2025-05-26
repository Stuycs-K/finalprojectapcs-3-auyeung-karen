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
      Candy clickedCandy = grid[y][x];
      if (selected == null){
        selected = clickedCandy;
        clickedCandy.select();
      }
      else{
        if (isAdjacent(selected, clickedCandy)){
          swapCandies(selected, clickedCandy);
          selected.deselect();
          clickedCandy.deselect();
          selected = null;
          clickedCandy = null;
        }
        else{
          selected.deselect();
          selected = clickedCandy;
          selected.select();
        }
      }
    }
    
  }
  
  public boolean isAdjacent(Candy one, Candy two){
    return ((abs(one.x - two.x) == 1 && one.y == two.y) || (abs(one.y - two.y) == 1 && one.x == two.x));
  }
  
  public void swapCandies(Candy one, Candy two){
    int tempType = one.getType();
    one.type = two.getType();
    two.type = tempType;
    
    int tempX = one.x;
    int tempY = one.y;
    one.x = two.x;
    one.y = two.y;
    two.x = tempX;
    two.y = tempY;
  }
  
}
