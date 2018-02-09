/*
Made by Purple Alpaca Coding
 02/08/18
 
 Bouncing Ball Example
 */

//Declare an array of balls
int numObjs = 25;
Ball[] balls = new Ball[numObjs];

void setup()
{
  //Create canvas
  //size(600, 600);
  fullScreen();

  //Set our ball array to be a 'new' instances of object ball
  for (int i = 0; i < numObjs; i++)
  {
    balls[i] = new Ball();
  }
}

void draw()
{
  background(150, 0, 150);
  for (int i = 0; i < numObjs; i++)
  {
    balls[i].edges();
    balls[i].update();
    balls[i].show();
  }
}

//This is our Ball object
class Ball
{
  //Vectors for position, velocity, and size
  PVector position;
  PVector velocity;
  PVector acceleration;
  PVector scale;
  float baseScale;

  //default constructor
  Ball()
  {
    position = new PVector(random(width), random(height));
    velocity = new PVector(random(-3, 3), 0);
    baseScale = random(30, 100);
    scale = new PVector(baseScale, baseScale);
    acceleration = new PVector(0, 0.5);
  }

  //How the ball looks
  void show()
  {
    noStroke();
    fill(0, 0, 0);
    ellipse(position.x, position.y, scale.x, scale.y);
  }

  //Update function
  void update()
  {
    velocity.add(acceleration);
    position.add(velocity);
    if(velocity.y > 0)
    {
      scale.y = map(velocity.y, 0, 10, baseScale, baseScale*1.2);
    } else
    {
      scale.y = baseScale;
    }
  }

  //What does the ball do when it encounters an edge
  void edges()
  {
    //Bounce off of top side
    if (position.y - (scale.y/2) < 0)
    {
      position.y = scale.y/2;
      velocity.y = -velocity.y;
    }
    //Bounce off of left side
    if (position.x - (scale.x/2) < 0)
    {
      position.x = scale.x/2;
      velocity.x = -velocity.x;
    }
    //Bounce off of right side
    if (position.x + (scale.x/2) > width)
    {
      position.x = width - scale.x/2;
      velocity.x = -velocity.x;
    }
    //Bounce off of bottom side
    if (position.y + (scale.y/2) > height)
    {
      position.y = height - scale.y/2;
      velocity.y = -velocity.y;
    }
  }
}