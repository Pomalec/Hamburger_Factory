abstract class Ingredient extends Entity{
  boolean mov=true;boolean inplate=false;boolean counted=false;
  int order=0;int platenum=0;boolean r;float  type;
  public Ingredient(int x, int y){
  float ran=random(0,100);
  if(ran<=50){r=true;}
  else{
  r=false;
  }
  this.w=75;
  this.h=46;
  this.xpos=x;
  this.ypos=y;
  this.alive=true;
  this.xspeed = +1; 
  }
  //set methods
void setinplate(boolean a){
  this.inplate=a;}
void setplatenum(int a){
  this.platenum=a;}
void setcounted(boolean a){
  this.counted=a;}
void setmov(boolean y){
    this.mov=y;
}
void setorder(int a){
order=a;
}
//get methods
boolean getmov(){
return mov;}
boolean getinplate(){
return this.inplate;}
boolean getcounted(){
return this.counted;
}
int getorder(){
return this.order;}

float getype(){
return this.type;
}

int getplatenum(){
return this.platenum;
}
void rotation(){//rotate
   if(r==true){r=false;}
   else{
   r=true;
   }
  
  }
}
