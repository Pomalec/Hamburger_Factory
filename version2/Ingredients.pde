public class Ingredient extends Entity{
  boolean mov=true;boolean inplate=false;boolean counted=false;int order=0;int platenum=0;boolean r;
  public Ingredient(float t,int x, int y){
  float ran=random(0,100);
  if(ran<=50){r=true;}
  else{
  r=false;
  }
  
  this.w=50;
  this.h=30;
  this.xpos=x;
  this.ypos=y;
  this.alive=true;
  this.type=t;
  // if(type==0){
  //  this.xpos= width;
  this.xspeed = +1; 
  //this.ypos=100;}
  // if(type==1){
  //  this.xpos= 350;
  //this.xspeed = +1; 
  //this.ypos=100;}
  }
  
  
void setinplate(boolean a){
  this.inplate=a;}
void setplatenum(int a){
  this.platenum=a;}
void setcounted(boolean a){
  this.counted=a;}
  
  
void display() {
  imageMode(CENTER); //this version for a PImage
    pushMatrix(); //store everything on canvas
    translate(this.xpos, this.ypos); //move origin to centre of rotation
    if(r){ 
      float ang=PI/2;
    
   
    //pushMatrix();//store everything on canvas
    //move origin to centre of rotation
    rotate(ang);
  } //rotate around x,y}
    if(type>=0&&type<50){
     
    pan.resize(w, h);
    panup.resize(w, h);
    if(type>=0&&type<25){
   image(pan,0,0);}
 else{
   image(panup,0,0);
   }
 }
   
   
    if(type>=50&&type<75){
      
    ham.resize(w,h);
    if(type>=50&&type<=62.5){
      }
    image(ham,0,0);
    }
     if(type>=75&&type<100){
    ch.resize(w,h);
    image(ch,0,0);
    }
     if(type>=100){
    let.resize(w,h);
    image(let,0,0);
    }
     popMatrix(); //put everything back}
   
  }
void setype(float t){
this.type=t;
}
 
void setmov(boolean y){
    this.mov=y;
}
void setorder(int a){
order=a;
}
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

 void rotation() //draws a rotated rectangle
  {
   if(r==true){r=false;}
   else{
   r=true;
   }
   
   println("rota");
  
   
   
  }
}
