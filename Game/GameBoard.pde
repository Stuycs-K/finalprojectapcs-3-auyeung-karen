import java.io.*;
import java.util.*;

class Board{
  private Candy[][] grid;
  private Candy selected = null;
  
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
    Candy clickedCandy = null;
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
        println(selected.getX() + ", " + selected.getY());
        println(clickedCandy.getX() + ", " + clickedCandy.getY());
        if (isAdjacent(selected, clickedCandy)){
          println("adjacent");
          swapCandies(selected, clickedCandy);
          if (checkMatches()){
            println("match found");
            
          }
          else{
            println("no match");
            swapCandies(selected, clickedCandy);
          }
          selected.setSelected(false);
          selected = null;
        }
        else{
          println("not adjacent");
        }
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
    one.type = two.getType();
    two.type = tempType;
    
    /*int tempX = one.getX();
    int tempY = one.getY();
    one.setX(two.getX());
    one.setY(two.getY());
    two.setX(tempX);
    two.setY(tempY);*/
  }
  
  public boolean checkHorizontalMatches(){
    boolean hasMatch = false;
    for (int i = 0; i < grid.length; i++){
      int count = 1;
      int currentType = grid[i][0].getType();
      for (int j = 1; j < grid[0].length; j++){
        if (grid[i][j].getType() == currentType){
          count++;
        }
        else{
          currentType = grid[i][j].getType();
          count = 1;
        }
        
        if (count >= 3){
          hasMatch = true;
          println(i + ", " + j);
        }
      }
    }
    return hasMatch;
  }
  
  public boolean checkVerticalMatches(){
    boolean hasMatch = false;
    for (int j = 0; j < grid[0].length; j++){
      int count = 1;
      int currentType = grid[0][j].getType();
      for (int i = 1; i < grid.length; i++){
        if (grid[i][j].getType() == currentType){
          count++;
        }
        else{
          currentType = grid[i][j].getType();
          count = 1;
        }
        
        if (count >= 3){
          hasMatch = true;
          println(i + ", " + j);
        }
      }
    }
    return hasMatch;
  }
  
  public boolean checkMatches(){
    return checkHorizontalMatches() || checkVerticalMatches();
  }
  
}
