import gifAnimation.*;
int points=0;
PImage pan;
PImage panup;
PImage ch;
PImage let;
PImage ham;
PImage start;
PImage pause;
PImage pplate;
PImage lendscreen;
Gif piml;
ArrayList<Ingredient> tops=new ArrayList<Ingredient>();
boolean rota=false;
boolean drag=true, gameover=true,pmenu=false,nextl=false;
ArrayList<Plate> pls=new ArrayList<Plate>();
int counts=0;
int score=0;

void setup() { 
    frameRate(60);

 for (int i=0;i<tops.size();i++){
 tops.remove(i);
println("uuuuu");
}

  size(1400, 600);
   piml= new Gif(this, "exxplosion1.gif");
  piml.play();
  piml.ignoreRepeat();
  lendscreen=loadImage("levelend.jpg");
  pan=loadImage("pan1.png");
  panup=loadImage("pan2.png");
  pplate=loadImage("plate.png");
  ham=loadImage("ham.png");
   let=loadImage("lettuce.png");
  ch=loadImage("cheese.png");
  pause= loadImage("pause.png");
  createing();
  createplate();
  start= loadImage("start.jpg");
  stroke(0);
  start.resize(width, height);
   pause.resize(width, height);
   lendscreen.resize(width, height);
  image(start, 0, 0);
  //restart();

}

void draw() { 
 if(gameover==false){
 update();
 println("aaaa");
 }
 if (gameover==true&&pmenu==false) {
    start= loadImage("start.jpg");
    start.resize(width, height);
    image(start, 700, 300);
  }
   if (pmenu) {
    gameover=true;
 
   
    image(pause, 700, 300);
  }
  if(nextl){gameover=true;
 
  
    image(lendscreen, 700, 300);
  textSize(50);
  text(score, 600, 600);}

}
void update(){
   //repeat this code 60 times a second – animate things on screen
  background(64);
  //fill(0, 408, 612);
  //textSize(50);
  score=0;
  for(int i=0;i<pls.size();i++){
    
  Plate pl=pls.get(i);
  text(pl.getstack(), i*50, 100);
  score=score+pl.getstack();
  }
  
 moveplate();
  moveing();
  collision();
 addpoints();
  
  
}  
void mouseReleased(){
 for (int iz=1;iz<tops.size();iz++){
  Ingredient p=tops.get(iz);
p.setmov(true);
}
}

void keyPressed() {
  
 //if (key==ENTER) {
 //   //restart();
 //   setup();
 //   gameover =false;
 //   nextl=false;
 //   println("start");
   
 // }
  
  
  
  if (key==ENTER) {
    gameover =false;
    setup();
    println("start");
  }
  if (key==BACKSPACE) {
    println("pause");
    if (pmenu) {
      pmenu=false;
      gameover=false;
    } else {
      pmenu=true;
    }
  }
}
void collision(){//adjust collsion
 for(int iz=0;iz<pls.size();iz++ ){
   Plate pl=pls.get(iz);
  for(int i=0;i<tops.size();i++ ){
    Ingredient pan1=tops.get(i);
if ( dist(pan1.getx(), pan1.gety(),  pl.getx(), pl.gety()) < pl.gety()&&(pan1.gety()<pl.gety())&&(pan1.getx()+pan1.getw()<pl.getx()+pl.getw()&&(pan1.getx()>pl.getx()))){
  pan1.sets(-1);
pan1.setalive(true);
pan1.setinplate(true);
pan1.setx(pl.getx()+(pl.getw()/4));



  }
  
if(pan1.getx()>pl.getx()+pl.getw()||pan1.getx()+pan1.getw()<pl.getx()){
  pan1.setinplate(false);pan1.setcounted(false);}

  if ( dist(mouseX, mouseY,  pan1.getx(), pan1.gety()) < pan1.getw()){
    if (mousePressed&&pan1.getmov()&& (mouseButton == LEFT)) {
          for (int iu=1;iu<tops.size();iu++){
  Ingredient p=tops.get(iu);
p.setmov(false);
}
       
     
               
      pan1.setx(mouseX);    
      pan1.sety(mouseY);
   
pan1.setmov(true);
pan1.sets(0);
    } 
//    if(mousePressed&&pan1.getmov()&&mouseButton == RIGHT){
// if(rota){rota=false;} else{rota=true;} println("R");

//}

   if (keyPressed) {
     if(key==CODED){
  if(keyCode==RIGHT){
    pan1.rotation();
    println("R");
  }
  if(keyCode==LEFT){
    pan1.rotation();
  }
  if(keyCode==UP){
    pan1.rotation();
  }
  if(keyCode==DOWN){
    pan1.rotation();
  }
  }
  }

  }  
  }  
 }
 
  
}

void createing(){
  if(tops.size()==0){
for (int i=1;i<20;i++){
  float ran=random(0,125);
tops.add(new Ingredient(ran,i*-50,400));
}}else{
 for (int i=0;i<tops.size();i++){
 tops.remove(i);
println("uuuuu");
}

}

}

void createplate(){
  if(pls.size()==0){
for (int i=1;i<2;i++){
  if(i==1){pls.add(new Plate(1400,200));}
  else{
pls.add(new Plate(i*400,200));}
}
  }
}
void moveplate(){
for (int i=0;i<pls.size();i++){
  Plate pl=pls.get(i);
  
pl.drive();
pl.display();
if(i==pls.size()-1){
  if(pl.getx()+pl.getw()<0){
  ;pls.remove(i);gameover=true;}
  
}
}}
void moveing(){
for (int i=0;i<tops.size();i++){
  Ingredient p=tops.get(i);
  
p.drive();
p.display();
if(p.getx()>1600){tops.remove(i);}
}
}
 void addpoints(){
   points=0;
   //int y=0;int or=0;
 for(int i=0;i<pls.size();i++){
  Plate pl=pls.get(i);pl.setstack(0);
  points=0;
 for(int iz=0;iz<tops.size();iz++){
   Ingredient pan1=tops.get(iz);
   if ( dist(pan1.getx(), pan1.gety(),  pl.getx(), pl.gety()) < pl.gety()&&(pan1.gety()<pl.gety())&&(pan1.getx()+pan1.getw()<pl.getx()+pl.getw()&&(pan1.getx()>pl.getx()))){
points++; pan1.setorder(points);pl.setstack(points);pan1.setplatenum(i);

  }
   if(pl.getx()<0){
     if(pl.getstack()>=1){
     if(pan1.getplatenum()==i){
     if((pan1.getype()>=0&&pan1.getype()<50)&&((pan1.getorder()==1)&&(pan1.getorder()==pl.getstack()))){
       points=points+2;
       image(piml,pan1.getx()+pan1.getw(),pan1.gety());
     }
     }
     }
   }
 }
 }
 
 }
 void endlevel(){
   nextl=true;
  
  
 
 
 }
 void restart(){
  
 for (int i=0;i<tops.size();i++){
 tops.remove(i);
println("uuuuu");
}

for (int i=0;i<pls.size();i++){
  pls.remove(i);

}
 }
