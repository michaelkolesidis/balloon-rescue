Roof roof;               // One roof object  
Timer timer;             // One timer object
Balloon[] balloons;       // An array of balloon objects

int totalBalloons = 0;   // Total number of balloons
boolean drag = false;
boolean release = false;

void setup() {
  size(600, 400);                 // Set the size of the window
  roof = new Roof();              // Create the roof
  balloons = new Balloon[10];     // Create a number of spots in the array
  timer = new Timer(1000);        // Create a timer that goes off every 1 second
  timer.start();                  // Starting the timer
}

void draw() {
  background(100, 205, 255);            // Display the sky
  roof.display();                       // Display the roof

  // Check the timer
  if (timer.isFinished()) {

    // Initialize one balloon
    balloons[totalBalloons] = new Balloon();
    // Increment totalBalloons
    totalBalloons++;
    // If totalBalloons hit the end of the array
    if (totalBalloons >= balloons.length) {
      totalBalloons = 0;  // Start over
    }
    timer.start();
  }

  // Move and display all ballooms
  for (int i = 0; i < totalBalloons; i++) { 
    if (balloons[i].popped()) {
      balloons[i].pop();
    }
    balloons[i].display();
    balloons[i].move();
  }

  if (drag) {
    for (int i = 0; i < totalBalloons; i++) {
      if (dist(mouseX, mouseY, balloons[i].x, balloons[i].y) >= +balloons[i].r) 
        balloons[i].x = mouseX;
        balloons[i].y = mouseY;
        return;
      }
    }
  }


void mouseDragged() {
  drag = true;
}

void mouseReleased() {
  release = true;
}
