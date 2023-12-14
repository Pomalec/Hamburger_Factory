abstract class Entity {
  int xpos,xspeed, yspeed,ypos; int w,h;boolean alive=true;//members are set
  void drive() {
    if (alive){ xpos = xpos + xspeed;}  }
  //get functions are added
 public int getx(){
  return this.xpos;
  }
  public int gety(){
  return this.ypos;
  }
  public int getxspeed(){
  return this.xspeed;
  }
    public int getw(){
  return this.w;
  }
  public int geth(){
  return this.h;
  }
 public float gets(){
  return this.xspeed;
  }
  //set functions are added
  public void setx(int x){
  this.xpos=x;
  }
  public void sety(int y){
  this.ypos=y;
  }
  public void sets(int y){
  this.xspeed=y;
  }

  public boolean isalive(){
   return this.alive; 
  }
   public void setalive(boolean a){
  this.alive=a;
  }
  abstract void display();//abstract void is set to be inherited in the Child class
}
