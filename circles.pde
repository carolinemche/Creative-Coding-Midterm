class Circles {  
  int xPos;
  int yPos;
  SoundFile sound;
  color green;
  color blue;
  color purple;
  float[] xP;
  float[] yP;
  
  boolean isPlaying = false;
  float startTime;


  Circles(SoundFile _sound) { //class Rect Constructor
   sound = _sound;
   xPos = width/2;
   yPos = height/2;
   green = color(#B4EAAF);
   blue = color(#AFDEEA);
   purple = color(#BDAFEA);
   

   
   
  }
  
  //plays the sound
  void play(){
    sound.play(1.0,1.0);
    isPlaying = true;
    startTime = millis();

  }
  
  //updates the screen, visual disapears when sound is over
  void update(){
    float now = millis();
    float playbackPosition = now - startTime;
    float duration = sound.duration() * 1000 ;
    if (playbackPosition >= duration) {
      isPlaying = false;
      }
    }
    
  
  void displayGrowingCircles(){
    //animation time
    float now = millis();
    float playbackPosition = now - startTime;
    float duration = sound.duration() * 1000;
    
    fill(purple);
    
    //outer ring
    pushMatrix();
    translate(width/2,height/2);
    float speed = map(playbackPosition, 0, duration, 0,360);
    rotate(radians(speed));
    float scaleSize= map(playbackPosition, 0, duration, 0,5);
    scale(scaleSize);
    drawRingOfCircles(20);
    popMatrix();
    
    //inner ring
    pushMatrix();
    translate(width/2,height/2);
    speed = map(playbackPosition, 0, duration, 0,360);
    rotate(radians(speed));
    scaleSize= map(playbackPosition, 0, duration, 2,5);
    scale(scaleSize);
    drawRingOfCircles(20);
    popMatrix();
    
    //middle ring
    pushMatrix();
    translate(width/2,height/2);
    speed = map(playbackPosition, 0, duration, 0,360);
    rotate(radians(speed));
    scaleSize= map(playbackPosition, 0, duration, 1,5);
    scale(scaleSize);
    drawRingOfCircles(20);
    popMatrix();
    
  }
  
    void displayShrinkingCircles(){
    
    float now = millis();
    float playbackPosition = now - startTime;
    float duration = sound.duration() * 1000;
    
    //outer ring
    fill(blue);
    pushMatrix();
    translate(width/2, height/2);
    float speed = map(playbackPosition, 0, duration, 0,360);
    rotate(radians(speed));
    float scaleSize= map(playbackPosition, 0, duration, 7,1);
    scale(scaleSize);
    drawRingOfCircles(20);
    popMatrix();  
    
    //inner ring
    fill(blue);
    pushMatrix();
    translate(width/2, height/2);
    speed = map(playbackPosition, 0, duration, 0,360);
    rotate(radians(speed));
    scaleSize= map(playbackPosition, 0, duration, 4,1);
    scale(scaleSize);
    drawRingOfCircles(20);
    popMatrix();   
  }
  
  void drawRingOfCircles(int radius){
    noStroke();
    //array to store the circle values
    float [] xP = {80, 50 ,0 ,0, 50, -50, -80, -50, 50,80};
    float [] yP = {0, 50, 80, -80, -50, 50, 0, -50, 50, 0};
    for(int i = 0; i < xP.length - 1; i++){
      //draws the circles
      xP[i] = xP[i + 1];
      yP[i] = yP[i + 1];
      ellipse(xP[i], yP[i], radius,radius);
      }
    }
   
  }
    
    
 
