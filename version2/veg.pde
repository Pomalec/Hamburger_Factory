public class Veg extends Ingredient{
  
public Veg( int x,int y){
super (x,y);
this.type=100;
}
void display() {
  imageMode(CENTER); //this version for a PImage
    pushMatrix(); //store everything on canvas
    translate(this.xpos, this.ypos); //move origin to centre of rotation
    if(r){ 
      float ang=PI/2;
    rotate(ang);
  } 
 
    let.resize(w,h);
    image(let,0,0);
    
   
     popMatrix(); //put everything back}
   
  }



}
