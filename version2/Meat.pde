public class Meat extends Ingredient{
  
public Meat( int x,int y){
super (x,y);
this.type=50;
}
void display() {
  imageMode(CENTER); //this version for a PImage
    pushMatrix(); //store everything on canvas
    translate(this.xpos, this.ypos); //move origin to centre of rotation
    if(r){ 
      float ang=PI/2;
    rotate(ang);
  } 
 
    ham.resize(w,h);
    image(ham,0,0);
    
   
     popMatrix(); //put everything back}
   
  }



}
