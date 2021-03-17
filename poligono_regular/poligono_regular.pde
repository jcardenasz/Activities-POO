void setup(){
  frameRate(10);
  size(600,600);
  background(1);
  println("hola");
  println("\nEste programa muestra un poligono regular bajo el mouse del usuario.");
  println("\nPresione clic IZQ para aumentar el número de lados del polígono.");
}
void polygon(float x, float y, float tamano, int lados) {
  float angulo = TWO_PI/lados;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angulo) {
    float sx = x + cos(a) * tamano;
    float sy = y + sin(a) * tamano;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
int x=3;
void draw(){
  background(1);
  strokeWeight(5);
  fill(#8A27C9);
  stroke(#F8F5FA);
  polygon(mouseX,mouseY,70,x);
  if (mousePressed && mouseButton==LEFT){x+=1;}
  if (mousePressed && mouseButton==RIGHT){x-=1;}
}
