Ball ball;

void setup() {
  size(200,200);
  textSize(30);
  ball = new Ball(color(255, 0,0),5,100,2,2,10,10);
}

void draw(){
  background(255);
  ball.display();
  ball.move(); 
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
  }
}


