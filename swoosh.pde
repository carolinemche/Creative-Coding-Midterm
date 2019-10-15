class Swoosh{
  int pos1;
  int pos2;
  int pos3;
  int w;
  int h;
  color pink;
  color yellow;
  int speed;
  SoundFile sound;
  
  boolean isPlaying = false;
  float startTime;

  
  
  Swoosh(SoundFile _sound){
    pos1 = 80;
    pos2 = 420;
    pos3 = 250;
    w = 50;
    h = 300;
    speed = 15;
    sound = _sound;
    yellow = color(#F7EC98);
    pink = color(#F798D5);
  
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
  
  //draws the top rectangles
  void displayTop(){
    float now = millis();
    float playbackPosition = now - startTime;
    float duration = sound.duration() * 1000;
    float yPos = map(playbackPosition, 0, duration, 0,height +120);
    noStroke();
    fill(pink);
    rect(pos1, yPos, w, h);
    rect(pos2,yPos, w,h);

  }
  
  //draws the bottom rectangles
  void displayBottom(){
    float now = millis();
    float playbackPosition = now - startTime;
    float duration = sound.duration() * 1000;
    float yPos = map(playbackPosition, 0, duration, height, -120);
    noStroke();
    fill(yellow);
    rect(pos3, yPos, w,h);

  }
  
  //displays the left rectangles
   void displayLeft(){
    float now = millis();
    float playbackPosition = now - startTime;
    float duration = sound.duration() * 1000;
    float xPos = map(playbackPosition, 0, duration, 0, width + 200 );
    noStroke();
    fill(yellow);
    rect(xPos, pos1, h,w);
    rect(xPos, pos2, h,w);
  }
  
  //displays the right triangle
  void displayRight(){
    float now = millis();
    float playbackPosition = now - startTime;
    float duration = sound.duration() * 1000;
    float xPos = map(playbackPosition, 0, duration, width,-200);
    noStroke();
    fill(pink);
    rect(xPos, pos3, h,w);
  }
  
}
