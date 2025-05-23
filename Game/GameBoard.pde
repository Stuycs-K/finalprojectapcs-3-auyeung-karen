import java.io.*;
import java.util.*;

class Board{
  Candy[][] grid;
  Candy selected = null;
  
  public Board(int rows, int cols){
    grid = new Candy[rows][cols];
    
    for (int i = 0; i < rows; i++){
      for (int j = 0; j < cols; j++){
        grid[i][j] = new Candy(j, i, (int)(Math.random()*6));
        /*if (i > 0 && i < rows-1 && j > 0 && j < cols){
          if (grid[i-1][j].getType() == grid[i][j].getType()){
            grid[i][j] = new Candy(j, i, (grid[i][j].getType()+1)%6);
          }
          if (grid[i][j-1].getType() == grid[i][j].getType()){
            grid[i][j] = new Candy(j, i, (grid[i][j].getType()+1)%6);
            println(j + " " + i);
          }
        }
        else if ((i == 0 || i == rows-1) && j != 0){
          if (grid[i][j-1].getType() == grid[i][j].getType()){
            grid[i][j] = new Candy(j, i, (grid[i][j].getType()+1)%6);
            println(j + " " + i);
          }
          if (i == rows-1){
            if (grid[i-1][j].getType() == grid[i][j].getType()){
              grid[i][j] = new Candy(j, i, (grid[i][j].getType()+1)%6);
            }
          }
        }
        else if ((j == 0 || j == cols-1) && i != 0){
          if (grid[i-1][j].getType() == grid[i][j].getType()){
            grid[i][j] = new Candy(j, i, (grid[i][j].getType()+1)%6);
          }
        }*/
      }
    }
  }
  
  void mouseClick(int mouseX, int mouseY){
    int x= mouseX/9;
    int y = mouseY/9;
    selected = grid[x][y];
    grid[x][y].select();
  }
  
  public boolean isAdjacent(Candy one, Candy two){
    return (abs(one.x - two.x) == 1 && one.y == two.y || abs(one.y - two.y) == 1 && one.x == two.x);
  }
  
  
}
