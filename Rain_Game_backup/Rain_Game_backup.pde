  import ddf.minim.*;  
Minim minim;
AudioSample sound; 



int y = 0; 
int x = 300;
int score = 0;
void checkCatch () {
  if (x> mouseX && x < mouseX + 100)
    score++;
  else if (score > 0)
    score--;
}

void setup() {
  size(650, 400);
  minim = new Minim (this);
sound = minim.loadSample ("drip.mp3");
  
}
void draw() {
  background(#A4C2E8);
  fill(#066271);
  textSize(14);
  println ("Score: " + score);
  text("Score:  " + score, 20, 20);
 
  fill(#4B6D98);
  ellipse(x, y, 15, 25);
  stroke(#D0D8E3);
  y++;

  
    if (y== height) {
      checkCatch (); 
      y= 0; 
      x= (int) random(width);
       sound.trigger();
    }

    fill(#79624B);
    rect(mouseX, height - 50, 100, 50);
  }