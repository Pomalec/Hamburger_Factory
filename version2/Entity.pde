abstract class Entity {
  int xpos,xspeed, ypos; int w,h;boolean alive=true;float type;
 
  //void display() {
    
  //  eneim.resize(w, h);
  //  boss.resize(w, h);
  //  if(alive&&type==1){image(eneim,xpos,ypos);
  //  }
  //  if(alive&&type==0){image(boss,xpos,ypos);
  //  }
  //  if(alive==false){stroke(0);image(piml,xpos,ypos-20);println("uwu");}
  //}
  void drive() {
    if (alive){
    xpos = xpos + xspeed;}
}
//void dead(){
////piml.play();
//    count++;
//    alive=false;
    
//}
 public int getx(){
  return this.xpos;
  }
  public int gety(){
  return this.ypos;
  }
  public void setx(int x){
  this.xpos=x;
  }
  public void sety(int y){
  this.ypos=y;
  }
  public void sets(int y){
  this.xspeed=y;
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

  public boolean isalive(){
   return this.alive; 
  }
   public void setalive(boolean a){
  this.alive=a;
  }
  
}
