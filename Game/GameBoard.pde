import java.io.*;
import java.util.*;

class Board{
  private Candy[][] grid;
  private Candy selected = null;
  private Candy clickedCandy = null; 
  private boolean isAnimating = false;
  private boolean isRefilling = false;
  private Candy swappedA = null;
  private Candy swappedB = null;
  
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
  
  public boolean isAnimating(){
    return isAnimating;
  }
  
  public void setAnimating(boolean animating){
    this.isAnimating = animating;
  }
  
  public boolean isRefilling(){
    return isRefilling;
  }
  
  public boolean mouseClick(int mouseX, int mouseY){
    mouseX -= 700;
    mouseY -= 25;
    int x = mouseX/cellSize;
    int y = mouseY/cellSize;
    //println("Mouse clicked at: (" + mouseX + ", " + mouseY + ")");
    //println("Mapped to grid coordinates: (" + x + ", " + y + ")");
    if (x >= 0 && x < 9 && y >= 0 && y < 9 && mouseX%cellSize > 0 && mouseY%cellSize > 0 && !isAnimating && p1.getNumMoves() > 0){
      clickedCandy = grid[y][x];
      
      if (selected == null){
        selected = clickedCandy;
        selected.setSelected(true);
      }
      else if (selected == clickedCandy){
        //deselect same candy
        selected.setSelected(false);
        selected = null;
      }
      else{
        //println(selected.getX() + ", " + selected.getY());
        //println(clickedCandy.getX() + ", " + clickedCandy.getY());
        if (isAdjacent(selected, clickedCandy)){
          //println("adjacent");
          swapCandies(selected, clickedCandy);
          swappedA = selected;
          swappedB = clickedCandy;
          selected.setSelected(false);
          selected = null;
          return true;
        }
        else{
          //println("not adjacent");
          selected.setSelected(false);
          selected = null;
        }
      }
    }
    return false;
  }
  
  public void undoSwap(){
    if (swappedA != null && swappedB != null){
      swapCandies(swappedA, swappedB);
      swappedA = null;
      swappedB = null;
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
    isRefilling = true;
    for (int j = 0; j < grid[0].length; j++){
      // start from bottom to up
      for (int i = grid.length-1; i >= 0; i--){
        
        if (grid[i][j].getType() == -1){
          // look for non-empty spot above
          
          for (int k = i-1; k >= 0; k--){
            if (grid[k][j].getType() != -1 && !grid[k][j].isFalling()){
              //candy moves down
              grid[i][j].setType(grid[k][j].getType());
              grid[i][j].setY(i);
              grid[i][j].setAnimatedY(i-1); // animation starts from up
              grid[i][j].setFalling(true); // above pieces falling
              grid[k][j].setType(-1);
              grid[k][j].setFalling(false);
              break;
            }
          }
          
        }
        
      }
      
    }
    
    for (int j = 0; j < grid[0].length; j++){
      for (int i = 0; i < grid.length; i++){
        if (grid[i][j].getType() == -1){
          grid[i][j].setType((int)(Math.random()*6));
          grid[i][j].setY(i);
          grid[i][j].setAnimatedY(i-1);
          grid[i][j].setFalling(true);
        }
      }
      
    }
    
    isRefilling = false;
  }
  
}
