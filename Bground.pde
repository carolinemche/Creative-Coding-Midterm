class Bground {  // class Rect Variables
  color white;
  color black;
  SoundFile sound;
  
  boolean isPlaying = false;
  float startTime;


  Bground(SoundFile _sound) { //class Rect Constructor
   sound = _sound;
  }
  
   //plays the sound
  void play(){
    sound.play(1.0,1.0);
    isPlaying = true;
    startTime = millis();

  }
  
  void update(){
    float now = millis();
    float playbackPosition = now - startTime;
    float duration = sound.duration() * 1000 ;
    if (playbackPosition >= duration) {
      isPlaying = false;
      }
    }
    

   
}
    
  
