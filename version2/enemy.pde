public class Enemy extends Entity{
  int ofsetx,ofsety,dx,dy;
  int hold, delay;
  int currentframe,totalframes,row;
  public Enemy(int xp,int yp){
  this.xpos=xp;
  this.ypos=yp;this.xspeed=3;
  this.dx=0;this.dy=0;
  this.w=554/3;this.h=180/2;
 this.hold=0;this.delay=5;//speed of the sprite 
 this.currentframe=0;
 this.totalframes=3;
 this.row=0;
  }
  void move(){
    if(xspeed>0){
  row=1;}//select sprites that are facing right
  if(xspeed<0){
  row=0;}//select sprites that are facing left
  dx=currentframe*w;//selects x portion of the sprite sheet
  dy=row*h; //selects the y portion of the sprite sheet
  hold=(hold+1)%delay;
  if(hold==0){
  currentframe=(currentframe+1)%totalframes; } }//speed of the moving sprite sheet is slowed down
  void display(){
copy(enemy, 
 dx, dy,w, h, //copy a portion of the image
xpos, ypos, w,h);//position and size
}
void checkd(){//check if the enemy is at the end of the screen 
if (xpos<0||xpos+w>width){
xspeed=xspeed*-1;//change direction
}}}
