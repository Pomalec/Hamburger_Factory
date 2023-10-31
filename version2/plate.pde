public class Plate extends Entity{
  int count=1;int stack=0;
Plate(int x,int y){
this.xpos=x;
this.ypos=y;
this.xspeed=-1;
this.h=25;
this.w=75;
}
void display(){
  stroke(64);
  pplate.resize(w,h);
image(pplate,xpos,ypos);

}
   public int getcount(){
  return this.count;
  }

public int getstack(){
return stack;

}
public void setstack(int a){
stack=a;

}
public void set0(){
this.count=1;
}
}
