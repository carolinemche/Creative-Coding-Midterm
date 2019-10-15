class Zigzag{
  color yellow;
  color orange;
  color red;
  SoundFile sound;
  boolean isPlaying = false;
  float startTime;
  
  Zigzag(SoundFile _sound){
    sound = _sound;
    yellow = color(#FAF435);
    orange = color(#FFA500);
    red = color(#FF6A64);
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
  
  //draws zigzags
  void drawZigzag(){
    line(0,0, 5,10);
    line(5,10,0,20);
    line(0,20,5,30);
    line(5,30,0,40);
  }
  
  //displays 3 zigzags
  void displayZigzag2(){
    strokeWeight(4);
    stroke(orange);
    pushMatrix();
    //displays in middle
    translate(width/2 - 20 ,height/2 - 120);
    scale(6);
    drawZigzag();
    popMatrix();
    
    
    stroke(yellow);
    pushMatrix();
    //displays on left
    translate(width/2 - 60 ,height/2 - 120);
    scale(6);
    drawZigzag();
    popMatrix();
    
    
    pushMatrix();
    //displays on right
    translate(width/2 + 20 ,height/2 - 120);
    scale(6);
    drawZigzag();
    popMatrix();
    
    
  }
  
  //draws a zigzag during the sound
  void displayZigzag1(){
    float now = millis();
    float playbackPosition = now - startTime;
    float duration = sound.duration() * 1000;
    float currentTime =  map(playbackPosition, 0, duration - .2, 0, 1);
    strokeWeight(4);
    stroke(red);
    pushMatrix();
    translate(width/2 - 20 ,height/2 - 220);
    scale(10);
    if(currentTime >= 0.2){
       line(0,0, 5,10);
    }
    if(currentTime >= 0.4){
       line(5,10,0,20);
    }
    if(currentTime >= 0.6){
       line(0,20,5,30);
    }
    if(currentTime >= 0.8){
       drawZigzag();
    }
    popMatrix();
    
    
  }
}
