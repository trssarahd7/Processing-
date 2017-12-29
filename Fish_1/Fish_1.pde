import ddf.minim.*; 
Minim minim;
AudioSample sound; 

boolean play=true;
int y = 5; 
int x = 350;
int score = 0;
int speed = 1;
String font = "YuppySC-Regular-100.vlw";
void checkCatch () {
  if (x> mouseX && x < mouseX + 100) { 
    score++;
    sound.trigger();
    speed++;
  } else if (score > 0)
    score--; }
    
void setup()
{
  size(700,500);
 minim = new Minim (this);
sound = minim.loadSample ("yay.mp3");
  
}
void draw() {
  if (play) {
   background(#8FF0E8);
     drawFish();
fill(#FF9E00);
stroke(#FAD08D);
ellipse(x, y, 10,10);
textSize(14);
fill(#958FF0);
  println ("Score: " + score);
  text("Score:  " + score, 20, 20);
  if (score == 5) {
    background(#C793D3);
    fill(#B6F58A);
   // PFont f = loadFont(font);
// textFont(f, 32);
    text("You won!",300,200);
   play= false;
  } 
 y+= speed;

if (y > height) {
      checkCatch (); 
      y= 0; 
      x= (int) random(width-200);

    }

  }
}


void drawFish(){

  background(141,233,237);

  noStroke();

  fill(255,255,255);

  ellipse(mouseX-17,mouseY-17,20,20); //back side eye

  fill(255,200,88);

  ellipse(mouseX,mouseY,90,50); //body

  triangle(mouseX+30,mouseY,mouseX+70,mouseY+30,mouseX+70,mouseY-30); //tail

  stroke(0);

  triangle(mouseX,mouseY,mouseX+15,mouseY+10,mouseX+15,mouseY-10); //side fin

  noStroke();

  fill(255,200,88);

  ellipse(mouseX,mouseY,15,15); //side fin cover

  noStroke();

  fill(255,255,255);

  ellipse(mouseX-25,mouseY-15,20,20); //front eye

  fill(0,0,0);

  ellipse(mouseX-25,mouseY-15,5,5); //pupil

  fill(141,233,237);

  ellipse(mouseX-45,mouseY,25,25); //mouth

}