
class Rain{
    float x, y, startX,speed;
    int w,h,index;
    PImage rain;

    Rain(PImage r, float x_, float y_, int w_, int h_, float speed_){
        rain = r;
        x = x_;
        y = y_;
        w = w_;
        h = h_;
        speed = speed_;
        index = 0;
        startX = x;
    }

    void show() {
            image(rain, x, y, w, h);
    }

    void animate() {
        // x = x+h;
        // y = x;
        y = y+h * speed;
        x = x-w  * speed;
        if (y > 260 - h) {
            y = -h;
            x = startX+w;
        }
    }
  }

