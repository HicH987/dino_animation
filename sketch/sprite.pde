

class Sprite {
  float x, y, w, speed, index;
  int len;
  ArrayList<PImage> animation;
  boolean leftToRight;
  Sprite(ArrayList<PImage> animation_, float x_, float y_, float speed_, boolean LR) {
    x = x_;
    y = y_;
    animation = animation_;
    w = animation.get(0).width;
    len = animation.size();
    speed = speed_;
    index = 0;
    leftToRight = LR;
  }

  void show() {
    int index = floor(this.index) % len;
    image(animation.get(index), x, y);
  }

  void animate() {
    this.index += this.speed;
    // println(this.index);
    if(leftToRight)
      this.x += this.speed * 15;
    else
      this.x -= this.speed * 15;

    if (this.x > width) {
      this.x = -this.w;
    }
    if(this.x < -w && !leftToRight){
        this.x = width;
    }
  }

}


