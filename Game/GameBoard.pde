import java.io.*;
import java.util.*;

class Board{
  private Candy[][] grid;
  private Candy selected = null;
  private Candy clickedCandy = null;
  //private Player p1;
  
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
    mouseX -= 700;
    mouseY -= 25;
    int x = mouseX/cellSize;
    int y = mouseY/cellSize;
    println("Mouse clicked at: (" + mouseX + ", " + mouseY + ")");
    println("Mapped to grid coordinates: (" + x + ", " + y + ")");
    if (x >= 0 && x < 9 && y >= 0 && y < 9){
      clickedCandy = grid[y][x];
      
      if (selected == null){
        selected = clickedCandy;
        selected.setSelected(true);
      }
      else if (selected == clickedCandy){
        selected.setSelected(false);
        selected = null;
      }
      else{
        //println(selected.getX() + ", " + selected.getY());
        //println(clickedCandy.getX() + ", " + clickedCandy.getY());
        if (isAdjacent(selected, clickedCandy)){
          println("adjacent");
          
          if (selected.isMatched() || clickedCandy.isMatched()){
            /*clearMatches();
            refillBoard();
            checkMatches();
            while (hasMatched()){
              clearMatches();
              refillBoard();
              checkMatches();
            }*/
            selected.setSelected(false);
            selected = null;
          }
          else{
            swapCandies(selected, clickedCandy);
            checkMatches();
            if (clickedCandy.isMatched()){
              println("match found");
              p1.numMoves--;
            }
            else{
              println("no match");
              swapCandies(selected, clickedCandy);
            }
            selected.setSelected(false);
            selected = null;
          }
        }
        else{
          println("not adjacent");
          selected.setSelected(false);
          selected = null;
        }
      }
      clearMatches();
      refillBoard();
      checkMatches();
      while (hasMatched()){
        clearMatches();
        refillBoard();
        checkMatches();
      }
    }
    
  }
  
  public boolean isAdjacent(Candy one, Candy two){
    println("Checking adjacency between (" + one.getX() + ", " + one.getY() + ") and (" + two.getX() + ", " + two.getY() + ")");
    boolean horizontal = Math.abs(one.getX() - two.getX()) == 1 && one.getY() == two.getY();
    boolean vertical = Math.abs(one.getY() - two.getY()) == 1 && one.getX() == two.getX();
    
    return horizontal || vertical;
  }
  
  public void swapCandies(Candy one, Candy two){
    int tempType = one.getType();
    one.setType(two.getType());
    two.setType(tempType);
    
    /*int tempX = one.getX();
    int tempY = one.getY();
    one.setX(two.getX());
    one.setY(two.getY());
    two.setX(tempX);
    two.setY(tempY);*/
  }
  
  public void checkHorizontalMatches(){
    for (int i = 0; i < grid.length; i++){
      int count = 1;
      for (int j = 1; j < grid[0].length; j++){
        if (grid[i][j].getType() == grid[i][j-1].getType()){
          count++;
        }
        else{
          if (count >= 3){
            for (int k = 0; k < count; k++){
              grid[i][j-1-k].setMatched(true);
            }
          }
          count = 1;
        }
      }
      if (count >= 3){
        for (int k = 0; k < count; k ++){
          grid[i][grid[0].length-1-k].setMatched(true);
        }
      }
    }
    
  }
  
  public void checkVerticalMatches(){
    for (int j = 0; j < grid[0].length; j++){
      int count = 1;
      for (int i = 1; i < grid.length; i++){
        if (grid[i][j].getType() == grid[i-1][j].getType()){
          count++;
        }
        else{
          if (count >= 3){
            for (int k = 0; k < count; k++){
              grid[i-1-k][j].setMatched(true);
            }
          }
          count = 1;
        }
      }
        
      if (count >= 3){
        for (int k = 0; k < count; k ++){
          grid[grid.length-1-k][j].setMatched(true);
        }
      }
    }
  }
  
  public void checkMatches(){
    checkHorizontalMatches();
    checkVerticalMatches();
  }
  
  public void clearMatches(){
    int numMatched = 0;
    for (int i = 0; i < grid.length; i++){
      for (int j = 0; j < grid[0].length; j++){
        if (grid[i][j].isMatched()){
          grid[i][j].setType(-1);
          grid[i][j].setMatched(false);
          numMatched++;
        }
      }
    }
    p1.addScore(numMatched);
  }
  
  public boolean hasMatched(){
    for (int i = 0; i < grid.length; i++){
      for (int j = 0; j < grid[0].length; j++){
        if (grid[i][j].isMatched()){
          return true;
        }
      }
    }
    return false;
  }
  
  public void refillBoard(){
    for (int j = 0; j < grid[0].length; j++){
      for (int i = grid.length-1; i >= 0; i--){
        if (grid[i][j].getType() == -1){
          for (int k = i-1; k >= 0; k--){
            if (grid[k][j].getType() != -1){
              grid[i][j].setType(grid[k][j].getType());
              grid[k][j].setType(-1);
            }
          }
        }
      }
      for (int i = 0; i < grid.length; i++){
        if (grid[i][j].getType() == -1){
          grid[i][j].setType((int)(Math.random()*6));
        }
      }
      
    }
    checkMatches();
    clearMatches();
  }
  
}
