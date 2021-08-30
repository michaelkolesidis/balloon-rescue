class Balloon {
  float x, y;        // Balloon positions
  float w, h;        // Balloon dimensions
  float r;           // Balloon radius
  float speedX;      // Balloon horizontal speed
  float speedY;      // Balloon vertical speed

  Balloon() {
    x = random(2*r, width-2*r);    // Balloons start at a random position
    y = height+4*r;                // Balloon start below screen
    r = 30;
    speedX = random(-0.5, 0.5);
    speedY = random(-1, -4);
  }

  // Check if balloon is popped
  boolean popped() {
    // If it touches the spikes
    if (x <= roof.brickNum*roof.brickW+r && y == roof.brickH + roof.spikeH*2) {  
      return true;
    } else {
      return false;
    }
  }

  // Pop the balloon
  void pop() {
    speedX = 0;
    speedY = 0;
    x = width/2;
    y = 2*height;
  }

  // Display the balloon
  void display() {
    strokeWeight(2);
    stroke(10);
    line(x, y, x, y+r*3.5);
    strokeWeight(3);
    stroke(125, 0, 0);
    fill(255, 0, 0);
    circle(x, y, 2*r);
    triangle(x, y+r, x+r/4, y+r+r/3, x-r/4, y+r+r/3);
    noStroke();
    fill(255);
    ellipseMode(CENTER);
    ellipse(x-r+r/4, y, r/4, r/2);
  }

  // Move the balloon up
  void move() {
    x += speedX;
    y += speedY;
    x = constrain(x, r, width-r);    // Keep the balloons in screen
  }
}
