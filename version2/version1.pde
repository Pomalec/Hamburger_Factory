import processing.sound.*;
import gifAnimation.*;
import processing.video.*;
Movie myMovie;
Sound s;
SoundFile mintro,maccept,mbleep,mwhoosh,mpoint;
//score
int points=0,score=0,counts=0, pmissed,selec=0,hs=0,screenx=1280,screeny=720,smeat=0,sveg=0;
//load ingredients
PImage pan,panup,ham,ch,let;
//load ui images
PImage start,pause,scontinue,srestart,sexit,sscontinue,ssrestart,ssexit,sscore,shigh,senter, lendscreen,back,pplate,enemy,scross;
ArrayList<Ingredient> tops=new ArrayList<Ingredient>();//create an array of ingredients
ArrayList<Plate> pls=new ArrayList<Plate>();//create array of the product
ArrayList<Enemy> enes=new ArrayList<Enemy>();//create an array of enemy
boolean rota=false,drag=true, gameover=true,pmenu=false,nextl=false,selecc=false,selecr=false,selece=false,selecrot=false,endg=false,swritten=false;

void setup() { 
    frameRate(60);
inizializesound();//sounds are loaded
score=0;
  readhs();//read highscore 
  pmissed=0;//plate missed are initialized to 0
  endg=false;//game end is initialized as false

    
  size(1280, 720);//screen size
  lendscreen=loadImage("levelend.jpg");
  inizializesprites();//sprites are loaded
  //restart();
  

}

void draw() { 

 if(gameover==false){
 update();

 }
 if (gameover==true&&pmenu==false&&endg) {
endscreen();
  }
   if (pmenu) {
    pausedscreen();//pausescreen is displayed
  }
  //if(nextl){gameover=true;
 
  
  //  image(lendscreen, screenx/2, screeny/2);
  //textSize(50);
  //text(score, 600, screeny/1,2);}

}
void endscreen(){
   if(swritten!=true){
   writescore();swritten=true;}//highcore is written in the text file
    if(mintro.isPlaying()){//background music is paused
mintro.pause();}
if(selec==0){
selec=2;}
    image(lendscreen, screenx/2, screeny/2);
     textSize(50);
    image(sscore, screenx/1.2, screeny/1.05);
  text(score, screenx/1.04, screeny/1.03);
   // image(sscore, screenx/8, screeny/1.09);//score 
   //text(score, screenx/5, screeny/1.068);//score is being displayed
   
    image(scross, screenx/2.3, screeny/1.25);
 text(pmissed, screenx/1.8, screeny/1.23);//plates missed count is being displayed
  
  image(ham, screenx/2.3, screeny/1.15);
  text(smeat, screenx/1.8, screeny/1.12);//plates with meat count is being displayed
  
   image(let, screenx/2.3, screeny/1.05);
  text(sveg, screenx/1.8, screeny/1.03);//plates with lettuce count is being displayed
  
      if(selec==2){
    rect(screenx/2.4, screeny/2.15,90.0,10.0);//continue selected if selec is 1
    }
     if(selec==3){
     rect(screenx/1.9, screeny/2.15,90.0,10.0);;//restart selected if selec is 2
    }
     
    
     if (keyPressed&&selecc==false) {//selection of the pause menu
       
       selecc=true;
     if(key==CODED){

  if(keyCode==RIGHT){
  mwhoosh.play();
   if(selec==2){
    selec=3;}else{
   if(selec==0){selec=2;}
 else{if(selec==2){selec=3;}}
 }
    
  }
  if(keyCode==LEFT){
    mwhoosh.play();
   if(selec==0){
    selec=2;}
    else{
   if(selec==3){
    selec=2;}else{
    if(selec==2){
    selec=3;}}
    }
  }
  }
  }

}
void update(){//repeat this code
  background(64);
   image(back, screenx/2, screeny/2);//background is setted
  textSize(50);
  
  
 moveplate();//array of product is moving
 movenemy();//array of enemy is moving
  moveing();//array of components is moving
  collision();//collision is being check
 addpoints();//pints are added
 check4gameover();//program checks if the game is over
 
  image(sscore, screenx/8, screeny/1.09);//score 
   text(score, screenx/5, screeny/1.068);//score is being displayed
   
    image(scross, screenx/3.4, screeny/1.09);
 text(pmissed, screenx/3, screeny/1.068);//plates missed count is being displayed
  
  image(ham, screenx/2.6, screeny/1.09);
  text(smeat, screenx/2.3, screeny/1.068);//plates with meat count is being displayed
  
   image(let, screenx/2, screeny/1.09);
  text(sveg, screenx/1.8, screeny/1.068);//plates with lettuce count is being displayed
   
}  
void inizializesound(){
 mintro = new SoundFile(this,"\\sound\\background.mp3");//background sound file is loaded
  maccept = new SoundFile(this,"\\sound\\MenuAccept.wav");//accpet sound file is loaded
  mbleep = new SoundFile(this,"\\sound\\MenuBleep.wav");//bleep sound file is loaded
  mwhoosh = new SoundFile(this,"\\sound\\MenuWoosh.wav");//whoosh sound file is loaded
    mpoint = new SoundFile(this,"\\sound\\Ring.wav");//point added sound file is loaded
    s=new Sound(this);
  mintro.play();mintro.loop();//background music being played and loop
  s.volume(0.05);//sound set to 0.05 volume
}
void inizializesprites(){//every image is loaded and resized

 
scontinue=loadImage("continue.png");
  srestart=loadImage("restart2.png");
  sexit=loadImage("exit.png");
    sscontinue=loadImage("continues.png");
  ssrestart=loadImage("restarts.png");
  ssexit=loadImage("exits.png");
 
  enemy = loadImage("ratsheetrighleft.png");
  senter=loadImage("enter.png");
  sscore=loadImage("score.png");shigh=loadImage("highschd.png");
  lendscreen=loadImage("gameo.png");
  scross=loadImage("cross.png");
  
  //components images are loaded
  pan=loadImage("pan1.png");
  panup=loadImage("pan2.png");
  pplate=loadImage("plate.png");
  ham=loadImage("ham.png");
   let=loadImage("lettuce.png");
  ch=loadImage("cheese.png");
 
  
  pause= loadImage("pausescreens.png");
  createing();//the array of ingredients is created
  createplate();//the array of plate is created
  createnemy();//the array pf enemies is created
  start= loadImage("start.jpg");
  back=loadImage("background.png");
  stroke(0);
  
  //images are resizes
  scontinue.resize(int(screenx/3.5),int(screeny/7.5));
  srestart.resize(int(screenx/3.5),int(screeny/7.5));
  sexit.resize(int(screenx/3.5),int(screeny/7.5));
   sscontinue.resize(int(screenx/3.5),int(screeny/7.5));
  ssrestart.resize(int(screenx/3.5),int(screeny/7.5));
  ssexit.resize(int(screenx/3.5),int(screeny/7.5));
  sscore.resize(int(screenx/8),int(screeny/20));
  senter.resize(int(screenx/8),int(screeny/20));
   shigh.resize(int(screenx/4),int(screeny/10));
   scross.resize(int(screenx/20),int(screeny/14));
  
  
  start.resize(width, height);
   pause.resize(width, height);
   lendscreen.resize(width, height);
   back.resize(width, height);
  image(start, 0, 0);
  image(senter,screenx/1.2,screeny/1.1);
   textSize(50);
    image(shigh, screenx/1.5, screeny/1.3);
    //image(sscore, screenx/4, screeny/1.2);
 
  text(hs, screenx/1.06, screeny/1.2);
 smeat=0;sveg=0;//score of hambruger with meat and with vegetables is set to 0
}
void writescore(){
if (score>hs){//score is written in the txt. file if its greater than the highscore
String s=String.valueOf(score);
println("win");
String[] l=split(s,' ');
saveStrings("score.txt",l);//score is saved as an array of string
}

}
void readhs(){

String[] sl = loadStrings("score.txt");//highscore value is read from the txt file
String s="";
for (int i = 0 ; i < sl.length; i++) {
  s+=sl[i];
}
hs=Integer.valueOf(s);//hs is set to the high score value read from the txt file
}
void filtere(){//all of the images are applied a grey filter
   back.filter(GRAY);
panup.filter(GRAY);
pan.filter(GRAY);
  pplate.filter(GRAY);
  ham.filter(GRAY);
   let.filter(GRAY);
  ch.filter(GRAY);
  sscore.filter(GRAY);
enemy.filter(GRAY);
  scross.filter(GRAY);
}
void defilter(){//all of the images from the game are loaded again in order to remove the filter
  back=loadImage("background.png");
  pan=loadImage("pan1.png");
  panup=loadImage("pan2.png");
  pplate=loadImage("plate.png");
  ham=loadImage("ham.png");
   let=loadImage("lettuce.png");
   sscore=loadImage("score.png");
    
  ch=loadImage("cheese.png");
enemy = loadImage("ratsheetrighleft.png");
  scross=loadImage("cross.png");
  scross.resize(int(screenx/20),int(screeny/14));
}
void pausedscreen(){
gameover=true;
    if(mintro.isPlaying()){//background music is paused
mintro.pause();}
 
    image(pause, screenx/2, screeny/2);
    image(scontinue, screenx/1.18, screeny/1.95);
    image(srestart, screenx/1.3, screeny/1.5);
    image(sexit, screenx/1.46, screeny/1.2);
    
    
    if(selec==1){
    image(sscontinue, screenx/1.18, screeny/1.95);//continue selected if selec is 1
    }
     if(selec==2){
     image(ssrestart, screenx/1.3, screeny/1.5);//restart selected if selec is 2
    }
     if(selec==3){
    image(ssexit, screenx/1.46, screeny/1.2);//exit program selected if selec is 3
    }
    
     if (keyPressed&&selecc==false) {//selection of the pause menu
       mwhoosh.play();
       selecc=true;
     if(key==CODED){

  if(keyCode==UP){
    if(selec==3){
    selec=2;}
    else{
   if(selec==2){
    selec=1;}else{
    if(selec==1){
    selec=3;}else{if(selec==0){selec=1;}}}
    }
  }
  if(keyCode==DOWN){
    
   if(selec==0){
    selec=1;}
    else{
   if(selec==1){
    selec=2;}else{
    if(selec==2){
    selec=3;}else{if(selec==3){selec=1;}}}
    }
  }
  }
  }
  
  
    textSize(50);
    image(shigh, screenx/1.2, screeny/1.05);
    image(sscore, screenx/4, screeny/1.2);
    if(hs>score)
  text(hs, screenx/1.04, screeny/1.03);
  else{
    text(score, screenx/1.04, screeny/1.03);}
  
}
void mouseReleased(){//when mouse is released the movement of the ingredients is set to true in order to be able to move

 for (int iz=0;iz<tops.size();iz++){
  Ingredient p=tops.get(iz);
p.setmov(true);
}
}

void keyReleased(){//when the key is released the selecrot is able to rotate again
selecc=false;selecrot=false;
}
void keyPressed() {

  if (key==ENTER) {
    if(gameover==true){
    maccept.play();}
    gameover =false;
    //println("start");
    
  }
  if(pmenu||endg){
    
    if (key==ENTER) {
      if(mintro.isPlaying()==false){
      mintro.play();}
      maccept.play();
  if(selec==1){
    
  pmenu=false;
      gameover=false;
      defilter();
  }
  if(selec==2){
    mintro.stop();
   
    setup();
  pmenu=false;
      gameover=false;
      defilter();endg=false;
  }
  if(selec==3){
  exit();
  }}
  
  }

  if (key==BACKSPACE) {
    mbleep.play();
    println("pause");
if(mintro.isPlaying()==false){
      mintro.play();}
    if (pmenu) {
      
      pmenu=false;
      gameover=false;
      defilter();
    } else {
        filtere();
      pmenu=true;
    }
  }
}
void collision(){//
 for(int iz=0;iz<pls.size();iz++ ){
   Plate pl=pls.get(iz);
  for(int i=0;i<tops.size();i++ ){
    Ingredient pan1=tops.get(i);
if ( dist(pan1.getx(), pan1.gety(),  pl.getx(), pl.gety()) < pl.gety()
&&(pan1.gety()<pl.gety())&&
(pan1.getx()+pan1.getw()<pl.getx()+pl.getw()&&(pan1.getx()>pl.getx()))&&//colision between product and component
pl.ispoint()==false//check if the plate have been scored
){
  pan1.sets(-1);//change direction
pan1.setalive(true);
pan1.setinplate(true);
pan1.setx(pl.getx()+(pl.getw()/4));//component is moves with to the product
  }
if(pan1.getx()>pl.getx()+pl.getw()||pan1.getx()+pan1.getw()<pl.getx()){//check if component is separated from the product
  pan1.setinplate(false);pan1.setcounted(false);}
 if ( dist(mouseX, mouseY,  pan1.getx(), pan1.gety()) < pan1.getw()){
    if (mousePressed&&pan1.getmov()&& (mouseButton == LEFT)) {
          for (int iu=0;iu<tops.size();iu++){
  Ingredient p=tops.get(iu);
p.setmov(false);//all of the ingredients cannot move when one of the ingredients is being dragged
}       
      pan1.setx(mouseX);    
      pan1.sety(mouseY);
pan1.setmov(true);
pan1.sets(0);//ingredient clicked by the mouse is dragged
    } 
   if (keyPressed&&selecrot==false) {//rotation of component
     selecrot=true;
     if(key==CODED){
  if(keyCode==RIGHT){
    pan1.rotation();//ingredient is rotated
    
  }
  if(keyCode==LEFT){//ingredient is rotated
    pan1.rotation();
  }
  if(keyCode==UP){
    pan1.rotation();//ingredient is rotated
  }
  if(keyCode==DOWN){
    pan1.rotation();}}}}  //ingredient is rotated
  
  
  //enemy collision
 for (int io=0;io<enes.size();io++){
   Enemy ene=enes.get(io);
   if(ene.gety()+ene.geth()>pan1.gety()&&pan1.gety()+pan1.geth()>ene.gety()){
     
     if(pan1.getx()>ene.getx()&&pan1.getx()+pan1.getw()<ene.getx()+ene.getw()){
     tops.remove(i);
     }
   
 if ( dist(pan1.getx(), pan1.gety(),  ene.getx(), ene.gety()) < pan1.getw()){
 tops.remove(i);
 println("col");
  }
 
  }

 }
}


  


}}

void createing(){

      while(tops.size()>0){//if there are components created the program will remove them from the array
   if(tops.size()>=0){
 for (int i=0;i<tops.size();i++){
 tops.remove(i);
}}
  }
  
for (int i=0;i<120;i++){//the array will add a random ingredient to the array
  float ran=random(0,125);
  if (ran >=0&&ran<50){
  tops.add(new Bread(i*-150,int(screeny/1.2)));
  
  }
   if (ran >=50&&ran<75){
  tops.add(new Meat(i*-150,int(screeny/1.2)));
  
  }
   if (ran >=75&&ran<100){
  tops.add(new Veg(i*-150,int(screeny/1.2)));
  
  }
   if (ran >=100){
  tops.add(new Cheese(i*-150,int(screeny/1.2)));
  
  }
  


}
}

void createplate(){
  while(pls.size()>0){//if there are products created the program will remove them from the array
  if(pls.size()>=0){
 for (int i=0;i<pls.size();i++){
 pls.remove(i);

}}
  }
for (int i=0;i<12;i++){//products are added to the array
  if(i==0){pls.add(new Plate(int(screenx/0.95),int(screeny/3)));}
  else{
    Plate pl=pls.get(i-1);
pls.add(new Plate(pl.getx()+350,int(screeny/3)));}
}
  
}
void createnemy(){
  while(enes.size()>0){//if there are products created the program will remove them from the array
  if(enes.size()>=0){
 for (int i=0;i<enes.size();i++){
 enes.remove(i);

}}
  }
for (int i=0;i<=1;i++){//enemy is added to the array
  float r=random(10,width-200);
  if(i==0){enes.add(new Enemy(int(r),int(screeny/2.4)));}

}


}
void movenemy(){
for (int i=0;i<enes.size();i++){
  Enemy ene=enes.get(i);//each enemy of the array is 
  
ene.move();
ene.display();
ene.drive();
ene.checkd();
}}
void moveplate(){//each product in the array Plate is moved
for (int i=0;i<pls.size();i++){
  Plate pl=pls.get(i);
  
pl.drive();
pl.display();
if(i==pls.size()-1){
  if(pl.getx()+pl.getw()<0){
  gameover=true;endg=true;}//game ends when the last product reach the end of the screen
  
}
}}

void moveing(){//each component in the array Ingredient is moved

for (int i=0;i<tops.size();i++){
  Ingredient p=tops.get(i);
  
p.drive();

p.display();
}
}
 void addpoints(){//score is updated
 
 for(int i=0;i<pls.size();i++){
  Plate pl=pls.get(i);
  points=0;smeat=0;sveg=0;
 for(int iz=0;iz<tops.size();iz++){
   Ingredient pan1=tops.get(iz);
  //Ingredient pan2; pan2=tops.get(iz);
   
       if ( dist(pan1.getx(), pan1.gety(),  pl.getx(), pl.gety()) < pl.gety()
       &&(pan1.gety()<pl.gety())
         &&(pan1.getx()+pan1.getw()<pl.getx()+pl.getw()
         &&(pan1.getx()>pl.getx()&&pl.ispoint()==false))
        )
        {//check if the plate score has been counted
points++;
pan1.setorder(points);
pan1.setplatenum(i);//each component is ordered depending on the position in the stack of the product
pl.setstack(points);//number of components in the product is updated
 if(i==0){
  println(pl.getstack());println("awa");

 }
  }
   
    if(pl.getx()+pl.getw()<0){//check when the product reach the end of the screen

       
     if(pl.ispoint()==false){//check if the plate score has been counted

       if(pl.getstack()>=1){

 pl.setpoint();score=score+pl.getstack();
     } 
     else{
       if(pl.ispoint()==false){
     pmissed++;pl.setpoint();println("missed");}//if there is not a component in the product pmissed is updated
     }
     }
   }
   
    if(pan1.getype()>=50&&pan1.getype()<75&&pan1.order!=0){//check if the product has meat for the meat counter
 smeat++;
 }
  if(pan1.getype()>=100&&pan1.order!=0){//check if the product has lettuce for the lettuce counter
 sveg++;
 }
 }
 }
 
 }
 void check4gameover(){//
 if(pmissed==3){//check the number of pmissed to determine to end the game
 gameover=true;endg=true;
 
 }
 
 
 }
 
