class Roof {
  int brickX, brickY;  // Brick positions
  int brickW, brickH;  // Brick dimensions
  int brickNum;        // Number of bricks

  int spikeX;          // Spike position
  int spikeW, spikeH;  // Spike dimensions
  int spikeNum;        // Number of spikes

  Roof() {
    //brickX calculated in loop
    brickY = 0;                    
    brickW = 105;                 // If brickW,brickH and brickNum are changed, spikes are generated accordingly automatically                 
    brickH = 40;
    brickNum = 4;
    //spikeX calculated in loop
    spikeW = 20;                  // If spikeW is changed, spikes are generated accordingly automatically
    spikeH = 30;
    spikeNum = (brickNum*brickW)/spikeW;
  }

  void display() {
    for (spikeX = 0; spikeX < spikeNum*spikeW; spikeX += spikeW) {  // Display the spikes
      strokeWeight(3);
      fill(140);
      stroke(50);
      triangle(spikeX, brickH, spikeX+spikeW, brickH, spikeX+(spikeW/2), brickH+spikeH);
    }

    for (brickX = 0; brickX < brickNum*brickW; brickX += brickW) {  // Display the bricks
      strokeWeight(4);
      stroke(100, 60, 30);
      fill(150, 90, 50);
      rect(brickX, brickY, brickW, brickH);
    }
  }
}
