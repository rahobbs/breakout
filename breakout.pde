Ball ball;
Paddle paddle;

void setup() {
  size(200,200);
  textSize(30);
  ball = new Ball(color(255, 0,0),5,100,2,2,10,10);
  paddle = new Paddle(color(0,0,255),100, 180, 30, 10, 5);
}

void draw(){
  background(255);
  ball.display();
  ball.move(); 
  paddle.display();
}

void keyPressed(){
  if(key == CODED){
    if (keyCode == LEFT){
      paddle.moveLEFT();
    }
    if (keyCode == RIGHT){
      paddle.moveRIGHT();
    }
  }
}  


class Rectangle {
  color c;
  float xpos;
  float ypos;
  float rectwidth;
  float rectheight;

  Rectangle(color tempC, float tempXpos, float tempYpos, float tempRectWidth,
            float tempRectHeight) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    rectwidth = tempRectWidth;
    rectheight = tempRectHeight;
  }

  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,rectwidth,rectheight);
  }
  
  boolean is_intersecting(Rectangle other) {
    float this_left = this.xpos-this.rectwidth/2;
    float this_right = this.xpos+this.rectwidth/2;
    float this_top = this.ypos-this.rectheight/2;
    float this_bottom = this.ypos-this.rectheight/2;
    float other_left = other.xpos-other.rectwidth/2;
    float other_right = other.xpos+other.rectwidth/2;
    float other_top = other.ypos-other.rectheight/2;
    float other_bottom = other.ypos+other.rectheight/2;
    
    if (((this_left <= other_left && this_right >= other_left) ||
        (this_left <= other_right && this_right >= other_right)) &&
        ((this_top >= other_top && this_bottom <= other_top) ||
        (this_top >= other_bottom && this_bottom <= other_bottom))) {
      return true;
    }
    
    if (((other_left <= this_left && other_right >= this_left) ||
        (other_left <= this_right && other_right >= this_right)) &&
        ((other_top >= this_top && other_bottom <= this_top) ||
        (other_top >= this_bottom && other_bottom <= this_bottom))) {
      return true;
    }
    
    return false;
  }
}

class Ball extends Rectangle {
  float xspeed;
  float yspeed;
  
  Ball(color tempC, float tempXpos, float tempYpos, float tempYspeed, float tempXspeed,
       float tempRectWidth, float tempRectHeight) {
    super(tempC, tempXpos, tempYpos, tempRectWidth, tempRectHeight);
    yspeed = tempYspeed;
    xspeed = tempXspeed;
  }

  void move() {
    ypos = ypos + yspeed;
    if (ypos < 0 + rectheight/2) {
      yspeed = yspeed * -1;
    }
    
    if (ypos > height-rectheight/2) {
      text("game over", width/2-75, height/2);
    }
    
    xpos = xpos + xspeed;
    if (xpos > width - rectwidth/2 || xpos < 0 + rectwidth/2) {
      xspeed = xspeed * -1;
    }
    
    if (is_intersecting(paddle)) {
      yspeed = yspeed * -1;
      xspeed = xspeed * -1;
    }
  }
}

class Paddle extends Rectangle {
  float xspeed;

  Paddle(color tempC, float tempXpos, float tempYpos, float tempRectWidth, 
         float tempRectHeight, float tempXspeed) {
    super(tempC, tempXpos, tempYpos, tempRectWidth, tempRectHeight);
    xspeed = tempXspeed;
  }
  
  void moveLEFT(){
    if (keyCode==LEFT){
      xpos -=6;      
    }
  }
  void moveRIGHT(){
    if (keyCode==RIGHT){
      xpos +=6;      
    }  
  }
}
