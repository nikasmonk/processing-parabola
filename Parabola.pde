Fader a1,b1,c1;

float y = 0;
int  a,b,c;
void setup() {
  size(800,800);
  c1 = new Fader(-350,350,-350,350);
  b1 = new Fader(-350,300,-10,10);
  a1 = new Fader(-350,250,-50,50);
    

  
}

void draw() {
  background(0);
  translate(width/2, height/2);
  

  //Оси координат
  stroke(255);
  strokeWeight(1);
  line(0,-height,0,height);
  line(-width,0,width,0);
  fill(255);
  triangle(0,-height/2,-5,-(height/2)+15,5,-(height/2)+15);
  triangle(width/2,0,(width/2)-15,5,(width/2)-15,-5);
  ellipse(0,0,7,7);
  text("O(0;0)",10,-10);
   
    //Парабола. Коэффициет 0.01 - чтобы она была пошире, как в учебниках.
  noFill();
  stroke(255,0,0);
  strokeWeight(2);
  beginShape();
  for (int x = -width;x<=width;x++){
    y=(0.005*a1.get()*x*x+b1.get()*x+c1.get())*-1;
    
    vertex(x,y);
  }
  endShape();
  
  //ползунки забубеним
  //stroke(255);
  //line(-300,300,-100,300);
  a1.display();
  b1.display();
  c1.display();
 
  a1.update();
  b1.update();
  c1.update();
  
  //Подпишем ползунки
  textSize(20);
  text("a = " +a1.get(),-130,255);
  text("b = " +b1.get(),-130,305);
  text("c = " +c1.get(),-130,355);
  //Уравнение засветим
  fill(255);
  text("ax +bx+c",-350,205);
  /*
  int mx = mouseX-400;
  println(mx);
  
  float d = dist(a1.xpos,a1.ypos,mouseX-width/2,mouseY-height/2);
  println("xpos = "+a1.xpos);
  println("ypos = "+a1.ypos);
  println(d);
  if (d<30){
   
  }
  */
}
