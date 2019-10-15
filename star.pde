class Star {  // class Rect Variables
  int xPos;
  int yPos;
  SoundFile sound;
  color green;
  color blue;
  color purple;
  color yellow;
  float[] xP;
  float[] yP;
  
  boolean isPlaying = false;
  float startTime;


  Star(SoundFile _sound) { 
   sound = _sound;
   xPos = width/2;
   yPos = height/2;
   green = color(#B4EAAF);
   blue = color(#AFDEEA);
   purple = color(#BDAFEA);
   yellow = color(#F7EC98);
  }
  
   //plays the sound
   void play(){
    sound.play(1.0,1.0);
    isPlaying = true;
    startTime = millis();

  }
  
  //updates the screen, visual disapears when stound is over
  void update(){
    float now = millis();
    float playbackPosition = now - startTime;
    float duration = sound.duration() * 1000 ;
    if (playbackPosition >= duration) {
      isPlaying = false;
      }
    }
    
  //two stars move across the screen diagonally
  void displayStar1(){
    float now = millis();
    float playbackPosition = now - startTime;
    float duration = sound.duration() * 1000;
    
    stroke(yellow);
    strokeWeight(6);
    
    //left star
    pushMatrix();
    float xPosition1 = map(playbackPosition, 0, duration, 0,width);
    float yPosition1 = map(playbackPosition, 0, duration, 0,height);
    translate(xPosition1,yPosition1);
    float speed = map(playbackPosition, 0, duration, 0,360);
    rotate(radians(speed));
    drawRing();
    popMatrix();
      
    //right star
    pushMatrix();
    float xPosition2 = map(playbackPosition, 0, duration, width,0);
    float yPosition2 = map(playbackPosition, 0, duration, height,0);
    translate(xPosition2,yPosition2);
    //does 360 turn during the duration
    speed = map(playbackPosition, 0, duration, 0,360);
    rotate(radians(speed));
    drawRing();
    popMatrix();  
    
  }
  
  //growing star
   void displayStar2(){
    float now = millis();
    float playbackPosition = now - startTime;
    float duration = sound.duration() * 1000;
    stroke(green);
    strokeWeight(8);

    pushMatrix();
    translate(width/2, height/2);
    //does 360 turn during the duration
    float speed = map(playbackPosition, 0, duration, 0,360);
    rotate(radians(speed));
    //increases in size
    float scaleSize= map(playbackPosition, 0, duration, 0.5,4);
    scale(scaleSize);
    drawRing();
    popMatrix();
     
    
  }
  
  //draws ring
   void drawRing(){
     line(0,0,80,0);
     line(0,0,50,50);
     line(0,0,0,80);
     line(0,0,0,-80);
     line(0,0, 50,-50);
     line(0,0,-50, 50);
     line(0,0,-80,0);
     line(0,0,-50,-50);
     
     
  
}
  
  
}
