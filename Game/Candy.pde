import java.io.*;
import java.util.*;

class Candy{
  private int type;
  private int x, y;
  private float animatedY;
  private boolean selected;
  private boolean matched;
  private boolean falling;
  
  Candy(int x, int y, int type){
    this.x = x;
    this.y = y;
    this.animatedY = y;
    this.type = type;
    selected = false;
    matched = false;
  }
  
  //getters
  public int getX(){
    return x;
  }
  
  public int getY(){
    return y;
  }
  
  public float getAnimatedY(){
    return animatedY;
  }
  
  public int getType(){
     return type;
  }
  
  public boolean isFalling(){
    return falling;
  }
  
  public boolean isSelected(){
     return selected;
  }
  
  public boolean isMatched(){
    return matched;
  }
  
  //setters
  public void setX(int x){
    this.x = x;
  }
  
  public void setY(int y){
    this.y = y;
  }
  
  public void setAnimatedY(float animatedY){
    this.animatedY = animatedY;
  }
  
  public void setType(int type){
    this.type = type;
  }
  
  public void setSelected(boolean selected){
    this.selected = selected;
  }
  
  public void setMatched(boolean matched){
    this.matched = matched;
  }
  
  public void setFalling(boolean falling){
    this.falling = falling;
  }
  
  
}
