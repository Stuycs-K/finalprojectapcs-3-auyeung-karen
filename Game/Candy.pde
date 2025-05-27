import java.io.*;
import java.util.*;

class Candy{
  private int type;
  private int x, y;
  private boolean selected;
  
  Candy(int x, int y, int type){
    this.x = x;
    this.y = y;
    this.type = type;
    selected = false;
  }
  
  //getters
  public int getX(){
    return x;
  }
  
  public int getY(){
    return y;
  }
  
  public int getType(){
     return type;
  }
  
  public boolean isSelected(){
     return selected;
  }
  
  //setters
  public void setX(int x){
    this.x = x;
  }
  
  public void setY(int y){
    this.y = y;
  }
  
  public void setSelected(boolean selected){
    this.selected = selected;
  }
  
  
}
