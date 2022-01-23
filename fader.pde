class Fader {
  float xpos, ypos,x_line_pos,y_line_pos;
  int coef, cmin, cmax;
  //конструкторы. xp,yp - позиция линии фейдера. coef_min и ьфч. Вдруг кому нафик не нужны все эти коэффициенты вообще. Или наоборот, понадобятся
  Fader(float xp, float yp, int coef_min,int coef_max ) {
      //coef_min = 1;
      //coef_max = 1;
      cmin = coef_min;
      cmax = coef_max;
      xpos = xp;
      ypos = yp;
      x_line_pos = xp;
      y_line_pos = yp;
  }
   Fader(float xp, float yp) {
      xpos = xp;
      ypos = yp;
      x_line_pos = xp;
      y_line_pos = yp;
  }
  
  void display() {
    stroke(255);
    strokeWeight(1);
    line(x_line_pos,y_line_pos,x_line_pos+200,y_line_pos);
    fill(255);
    
    ellipse(xpos+120,ypos,30,30);
  }
  
  void update() {
    
    float d = dist(xpos+120,ypos,mouseX-width/2,mouseY-height/2);
     
    if (mousePressed && d<=15) {
      float pmx = pmouseX;
      fill(255,0,0);
      ellipse(xpos+120,ypos,30,30);
      if (mouseX!=pmx) {
        xpos += mouseX-pmx;
        //Ограничиваем движение ползунка линией
        if(xpos<=x_line_pos-120){
          xpos = x_line_pos-120;
        }
        if(xpos>=x_line_pos+80) {
          xpos = x_line_pos+80;
        }
        
      }
     fill(255);
    }
    
  }
  
  int get() {
    coef = int(map(xpos,x_line_pos-120,x_line_pos+80,cmin,cmax));
    return coef;
  }
}


void mousePressed() {

}
