//sound import
import processing.sound.*;


Swoosh top;
Swoosh bottom;
Swoosh left;
Swoosh right;
Star star1;
Star star2;
Circles ring1;
Circles ring2;
Zigzag zigzag1;
Zigzag zigzag2;
Bground white;
Bground black;
SoundFile soundfile1;
SoundFile soundfile2;
SoundFile soundfile3;
SoundFile soundfile4;
SoundFile soundfile5;
SoundFile soundfile6;
SoundFile soundfile7;
SoundFile soundfile8;
SoundFile soundfile9;



void setup(){
  size(500,500);
  
  
  rectMode(CENTER);
  
  //sound files
  soundfile1 = new SoundFile( this, "swoosh.mp3");
  soundfile2 = new SoundFile(this, "swoosh2.wav");
  soundfile3 = new SoundFile(this,"circles.wav");
  soundfile4 = new SoundFile(this,"star.mp3");
  soundfile5 = new SoundFile(this,"star2.wav");
  soundfile6 = new SoundFile(this,"circles2.wav");
  soundfile7 = new SoundFile(this,"crash.wav");
  soundfile8 = new SoundFile(this,"crash2.wav");
  soundfile9 = new SoundFile(this,"button.wav");
  
  //swoosh audiovisual
  top = new Swoosh(soundfile1);
  bottom = new Swoosh(soundfile1);
   
  left  = new Swoosh(soundfile2);
  right = new Swoosh(soundfile2);
  
  //star audiovisual
  star1 = new Star(soundfile4);
  star2 = new Star(soundfile5);
  
  //circle audiovisual
  ring1 = new Circles(soundfile6);
  ring2 = new Circles(soundfile3);
  
  //zigzag audiovisual
  zigzag1  = new Zigzag(soundfile7);
  zigzag2  = new Zigzag(soundfile8);
  
  //changes background
  white = new Bground(soundfile9);
  black = new Bground(soundfile9);
  
}


void draw(){
  
  //displays audio visuals
  if(white.isPlaying){
    background(255);
  }
  if(black.isPlaying){
    background(0);
  }
 
  if(top.isPlaying){
    top.update();
    top.displayTop();
  }
  if(bottom.isPlaying){
    bottom.update();
    bottom.displayBottom();
  }
  if(left.isPlaying){
    left.update();
    left.displayLeft();
  }
  if(right.isPlaying){
    right.update();
    right.displayRight();
  }
   if(star1.isPlaying){
    star1.update();
    star1.displayStar1();
  }
  if(star2.isPlaying){
    star2.update();
    star2.displayStar2();
  }
  if(ring1.isPlaying){
    ring1.update();
    ring1.displayGrowingCircles();
  }
   if(ring2.isPlaying){
    ring2.update();
    ring2.displayShrinkingCircles();
  }
   if(zigzag1.isPlaying){
    zigzag1.update();
    zigzag1.displayZigzag1();
  }
  if(zigzag2.isPlaying){
    zigzag2.update();
    zigzag2.displayZigzag2();
  }
  
}

void keyPressed() {
  //play the sounds when the button is clickeda
   if(key == 'a'){
    top.play();
    bottom.play();
  }
  if(key =='s'){
    left.play();
    right.play();
  }
  if(key =='d'){
    star1.play();
  }
  if(key =='f'){
    star2.play();
  }
  if(key =='g'){
    ring1.play();
  }
  if(key =='h'){
    ring2.play();
  }
  if(key =='j'){
    zigzag1.play();
  }
  if(key == 'k'){
    zigzag2.play();
  }
  if(key == 'z'){
    white.play();
  }
  if(key == 'x'){
    black.play();
  }


  
}
