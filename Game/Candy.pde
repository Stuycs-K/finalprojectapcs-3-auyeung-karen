import java.io.*;
import java.util.*;

class Candy{
  private int type;
  private int x, y;
  private boolean matched;
  private boolean isSelected;
  
  Candy(int x, int y, int type){
    this.x = x;
    this.y = y;
    this.type = type;
    matched = false;
  }
  
  public int getType(){
     return type;
  }
  
  public boolean isMatched(){
     return matched;
  }
  
  public void select(){
     isSelected = true;
  }
  
  public void deselect(){
     isSelected = false;
  }
  
  
}
