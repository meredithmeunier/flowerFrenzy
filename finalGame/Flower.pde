class Flower{
  
  /////////////
  //variables
  /////////////
  int x;
  int y;
  int w;
  int h;
  
  boolean isMoving;
  
  int flowerSpeed;
  
  int top;
  int bottom;
  int left;
  int right;
  
  /////////////
  //constructor
  /////////////
  Flower(int startingX,int startingY,int startingW,int startingH){
    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;
    
   isMoving = false;
   
   flowerSpeed=5;
   
   top = y-h/2;
   bottom = y+h/2;
   left = x-w/2;
   right = x+w/2;
    
  }
    
  /////////////
  //functions
  /////////////
  
  void render(){
    //draw player
    //fill(200,0,200);
    //rect(x,y,w,h);
    image(flowers,x,y);
  }
  
  void move(){
    if (isMoving == true){
      x-=flowerSpeed;
      
      top = y-h/2;
      bottom = y+h/2;
      left = x-w/2;
      right = x+w/2;
    }
    
  }
  
  
}
