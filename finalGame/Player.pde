class Player{
  
  /////////////
  //variables
  /////////////
  int x;
  int y;
  int w;
  int h;
  
  int speed;
  
  boolean isJumping;
  boolean isFalling;
  
  int jumpHeight; // distance you can jump upwards
  int highestY; // y value of top of jump
  
  int top;
  int bottom;
  int left;
  int right;
  
  int originalPosition;

  
  /////////////
  //constructor
  /////////////
  Player(int startingX, int startingY, int startingW,int startingH){
    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;
    
    speed = 10;
    
    isJumping = false;
    isFalling = false;
    
    jumpHeight = 200;
    highestY = y-jumpHeight;
    
    top = y-h/2;
    bottom = y+h/2;
    left = x-w/2;
    right = x+w/2;
    
    originalPosition=425;
  } 
  
  /////////////
  //functions
  /////////////
  
  void render(){
    //draw player
    fill(255);
    //rect(x,y,w,h);
    dudetteAnimation.display(x,y);
    dudetteAnimation.isAnimating=true;
    println(y);
  }
  
  void jumping(){
    if(isJumping==true){
      y-=speed;
      
      top = y-h/2;
      bottom = y+h/2;
      left = x-w/2;
      right = x+w/2;
    }
    
  }
  
  void falling(){
    if(isFalling==true){
      y+=speed;
      
      top = y-h/2;
      bottom = y+h/2;
      left = x-w/2;
      right = x+w/2;
    }
  }
  
  void topOfJump(){
    if (y <= highestY){
      isJumping = false; // stop jumping upward
      isFalling = true; // start falling downward
      
      top = y-h/2;
      bottom = y+h/2;
      left = x-w/2;
      right = x+w/2;
    }
  }
  
  void land(){
    if (y >= originalPosition){
      isFalling = false; // stop falling
      y = originalPosition; // snap player to original position
      
      top = y-h/2;
      bottom = y+h/2;
      left = x-w/2;
      right = x+w/2;
    }
  }
  
  void collisionDetection(Flower aFlower){
    if (bottom>aFlower.top &&
        right>aFlower.left &&
        top<aFlower.bottom &&
        left<aFlower.right){
          println ("flower hit");  
          state = 7;
            }
  }
  
  
}
