public class Bread extends Ingredient{
  
public Bread( int x,int y){
super (x,y);
float r=random(0,50);
this.type=r;
}
void display() {
  imageMode(CENTER); //this version for a PImage
    pushMatrix(); //store everything on canvas
    translate(this.xpos, this.ypos); //move origin to centre of rotation
    if(r){ 
      float ang=PI/2;
    rotate(ang);
  } 
    
    pan.resize(w, h);
    panup.resize(w, h);
    if(type>=0&&type<25){
   image(pan,0,0);}
 else{
   image(panup,0,0);
   }
     popMatrix(); //put everything back}
   
  }
}
