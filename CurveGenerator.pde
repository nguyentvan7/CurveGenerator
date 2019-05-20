final int B = 100;
final float M = 0.2;
final int X_POWER = 2;
final int SIZE = 1500;
final int MIDDLE = SIZE/2;
final int STEPS = 100;
int currentStep = 0;


void setup()
{
  background(255);
  frameRate(30);
}

void settings()
{
  size(SIZE, SIZE);
}

// Draw curve incrementally.
void draw()
{
  if (currentStep <= STEPS)
  {
    // Calculate current y value.
    int currentX = currentStep - STEPS/2;
    int currentY = (int) (M*(pow(currentX, X_POWER))) + B;
    //circle(currentStep * (SIZE/STEPS), currentY, 25);
    // Create line that goes through point (currentStep * SIZE/STEPS, currentY).
    // Calculate derivative at currentX to get slope of line.
    float instantSlope = M * X_POWER * currentX;
    
    // Create line +-20 from currentStep.
    int x1 = (currentStep - 20) * (SIZE/STEPS);
    int x2 = (currentStep + 20) * (SIZE/STEPS);
    int y1 = (int) (currentY + (instantSlope * -20));
    int y2 = (int) (currentY + (instantSlope * 20));
    line (x1, y1, x2, y2);
    println("x1: " + x1);
    println("y1: " + y1);
    println("x2: " + x2);
    println("y2: " + y2 + "\n");
    currentStep++;
  }
}
