// ArrayList<PImage> expAnim;
// Sprite boom;

PImage bg;

ArrayList<PImage> dinoAnim;
ArrayList<PImage> birdAnim;

ArrayList<Sprite> dinos;
ArrayList<Sprite> birds;
ArrayList<Rain> meteors;


void setup() {
    size(1000,400); 
    frameRate(15);
    bg = loadImage("/assets/bg.png");

    dinoAnim = new ArrayList<PImage>();
    birdAnim = new ArrayList<PImage>();

    for (int i=1; i<=2; i++){
        dinoAnim.add(loadImage("/assets/dino-0"+i+".png"));
        birdAnim.add(loadImage("/assets/bird-0"+i+".png"));
    }

    // expAnim = new ArrayList<PImage>();
    // for(int i=1; i<=7; i++)
    //     expAnim.add(loadImage("/assets/explosion/Explosion"+i+".png"));
    // boom = new Sprite(expAnim, 10,265-50, 0.1);

new Sprite(birdAnim, 1000,30, 0.9, false);
    dinos = new ArrayList<Sprite>();
    for (int i = 0; i < 5; i++) 
        dinos.add(
           new Sprite(dinoAnim, 450+i+floor(random(10, 700)), 220+i*20, random(0.2, 0.4), true)
        );

    birds = new ArrayList<Sprite>();
    for (int i = 0; i < 3; i++) 
        birds.add(
           new Sprite(birdAnim, (i+1)*floor(random(100,1000)), (i)*50, random(0.2, 0.4), false)
        );

    meteors = new ArrayList<Rain>();
    for (int i = 0; i < 15; i++) {
        int size = floor(random(50, 100));
        meteors.add(
            new Rain(loadImage("/assets/meteor2.png"), 200+ i*300, 0, size, size, random(0.1, 0.3))
        );
    }
}

void draw() {
    background(0);
    backgroundScroll(bg);


    for (Sprite dino: dinos) {
        dino.show();
        dino.animate();
    }
    for (Sprite bird: birds) {
        bird.show();
        bird.animate();
    }

    for (Rain meteor: meteors) {
        meteor.show();
        meteor.animate();
    }

    println(mouseX," ", mouseY);
}




void backgroundScroll(PImage img) {
     //NB image is wider than screen
    int x = frameCount % img.width;
    copy(img, x, 0, img.width, height, 0, 0, img.width, height);
    
    int x2 = img.width - x;
    if(x2 < width)
        copy(img, 0, 0, img.width, height, x2, 0, img.width, height);
}

