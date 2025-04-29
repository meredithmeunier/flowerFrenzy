
import processing.sound.*;
// declare vars
SoundFile jumpSound;
SoundFile backgroundMusic;

Player p1;

Flower f1;

// state machine vars
int state;

// array list
ArrayList<Flower> flowerList;

//pictures :)
PImage flowerFrenzy;
PImage skyBackground;
PImage flowers;
PImage winScreen;
PImage loseScreen;

//animations
Animation rainAnimation;
PImage [] rain = new PImage[9];
Animation dudetteAnimation;
PImage [] dudette = new PImage[6];

//timer vars
int startTime;
int endTime;
int endTime2;
int startTime2;
int interval = 1000;
int intervalGame = 12000;
int intervalRain = 2600;

boolean gameStop = false;


void setup(){
  size(800,600);
  rectMode(CENTER);
  
  // initialize vars
  
    //sound stuff
  jumpSound = new SoundFile(this, "sparkle.wav");
  backgroundMusic = new SoundFile(this, "theMan.wav");
  
  jumpSound.rate(2);
  jumpSound.amp(.2);
  
    //player stuff
  
  p1 = new Player(150,450,100,150);
  
  //timer 
  startTime2=millis();
 
  //background music
  backgroundMusic.play();
  
  // state vars
  state = 0;
  
  //array list
  flowerList = new ArrayList<Flower>();
  
  for(int x = 700; x<=50000; x+=800){
      Flower f1 = (new Flower(x,480,50,90));
      flowerList.add(f1);
    }
    
   // picture vars
   flowerFrenzy = loadImage("flowerFrenzy.png");
   skyBackground = loadImage("skyBackground.png");
   flowers = loadImage("flower.png");
   winScreen = loadImage("winScreen.png");
   loseScreen = loadImage("loseScreen.png");
   
    // picture settings
    imageMode(CENTER);
    flowerFrenzy.resize(width,height);
    skyBackground.resize(width,height);
    float flowersScale = 1.5;
    flowers.resize(int(flowers.width*flowersScale),int(flowers.height*flowersScale));
    winScreen.resize(width,height);
    loseScreen.resize(width,height);
    
    //array for rain animation
    for (int i=0; i<rain.length; i+=1){
      rain[i] = loadImage("rain"+i+".png");
    }
    rainAnimation = new Animation(rain, 0.1,1);
    //array for dudette animation
    for(int i=0; i<dudette.length; i+=1){
      dudette[i] = loadImage("dudette"+i+".png");
    }
    dudetteAnimation = new Animation(dudette,0.3,1);

}


void draw(){
  background(42);
  
  //println("Player:", p1.top,p1.bottom,p1.left,p1.right);
  //println("Flower:", f1.top,f1.bottom,f1.left,f1.right);
  
  //array list loop
  for(Flower aFlower : flowerList){
    aFlower.render();
    aFlower.move();
  }
  
  //finite state machine
  switch(state){
    
    case 0:
    //start screen
    background(flowerFrenzy);
    
    fill(#7B3595);
    textSize(22);
    text("How to play: Press space to jump",width/2-150,550);
    
    break;
    
    case 1:
   
    // game play: level 1
    background(skyBackground);
    
    endTime=millis();
    if(endTime-startTime>intervalGame){
      state=2;
      startTime=millis();
    }
    if(gameStop==false){
    //call player
    p1.render();
    p1.jumping();
    p1.falling();
    p1.topOfJump();
    p1.land();
    
    // flower stuff
    for(Flower aFlower : flowerList){
    p1.collisionDetection(aFlower);
    aFlower.render();
    aFlower.move();
    aFlower.isMoving = true;
    aFlower.flowerSpeed=5;
      }
      
      break;
    }
    endTime2=millis();
    if(gameStop==true){
      if(endTime2-startTime2<=interval){
        state=7;
      }
    }
    
    
    case 2:
    // in between levels (rain animation)
   rainAnimation.display(width/2,height/2);
   rainAnimation.isAnimating=true;
   
   endTime=millis();
   if(endTime-startTime>intervalRain){
      state=3;
      startTime=millis();
    }
   
    break;
    
    case 3:
    // game play: level 2
    background(skyBackground);
    
    endTime=millis();
    if(endTime-startTime>intervalGame){
      state=4;
      startTime=millis();
    }
    
    //call player
    p1.render();
    p1.jumping();
    p1.falling();
    p1.topOfJump();
    p1.land();
    
    // flower stuff
    for(Flower aFlower : flowerList){
    p1.collisionDetection(aFlower);
    aFlower.render();
    aFlower.move();
    aFlower.isMoving = true;
    aFlower.flowerSpeed=6;
    }
    
    break;
    
    case 4:
    //in between levels 
    rainAnimation.display(width/2,height/2);
    rainAnimation.isAnimating=true;
    
    endTime=millis();
    if(endTime-startTime>intervalRain){
      state=5;
      startTime=millis();
    }
    
    break;
    
    case 5: 
    // game play: level 3
    background(skyBackground);
    
    endTime=millis();
    if(endTime-startTime>intervalGame){
      state=6;
      startTime=millis();
    }
    
    //call player
    p1.render();
    p1.jumping();
    p1.falling();
    p1.topOfJump();
    p1.land();
    
    // flower stuff
    for(Flower aFlower : flowerList){
    p1.collisionDetection(aFlower);
    aFlower.render();
    aFlower.move();
    aFlower.isMoving = true;
    aFlower.flowerSpeed=7;
    }
    
    break;
    
    case 6:
    // win screen
    background(winScreen);
    
    fill(#7B3595);
    textMode(CENTER);
    textSize(22);
    text("Press r to replay",width/2-50,550);
    
    break;
    
    case 7:
    // lose screen
    background(loseScreen);
    
    fill(#7B3595);
    textMode(CENTER);
    textSize(22);
    text("Press r to replay",width/2-50,550);
    
    break;
    
    
  }
  
}

void keyPressed(){
  if (key == ' ' && p1.isJumping == false && p1.isFalling==false){
    p1.isJumping = true; // start new jump
    p1.highestY = p1.y-p1.jumpHeight; 
    jumpSound.play();
  }
  
  if (key =='f'){
    state = 1;
    startTime=millis();
 
  }
  if (key =='r'){
    state = 0;
    }

 }
  
