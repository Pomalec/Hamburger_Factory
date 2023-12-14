public class Cheese extends Ingredient{
  
public Cheese( int x,int y){
super (x,y);

}
void display() {
  imageMode(CENTER); //this version for a PImage
    pushMatrix(); //store everything on canvas
    translate(this.xpos, this.ypos); //move origin to centre of rotation
    if(r){ 
      float ang=PI/2;
    rotate(ang);
  } 
 
    ch.resize(w,h);
    image(ch,0,0);
    
   
     popMatrix(); //put everything back}
   
  }



}
