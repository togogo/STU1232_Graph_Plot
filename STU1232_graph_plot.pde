color bg = color(0);
color plotBG = color(200);
color lineCol = color(127, 34, 255);

int nudgeX = 25;
int nudgeY = 25;

int scrW = 1000;
int scrH = 500;

int graphW = scrW - 2*nudgeX;
int graphH = scrH - 2*nudgeY;

//ArrayList<Integer> plots = new ArrayList<Integer>();
ArrayList<Integer> gPlots = new ArrayList<Integer>();

int inVal;
void setup() {
  size(1000, 500);
}

void draw() {

  background(bg);
  plotGraph(nudgeX, nudgeY, graphW, graphH, mouseY, gPlots);
}


void plotGraph(int _x, int _y, int _w, int _h, int _val, ArrayList<Integer> _l) {
/*
NOTE:
A small function to plot the graph of a given intake value.
_x:starting x-pos of the plot 
_y:starting y-pos of the plot
_w:ending x-pos of the plot
_h:ending y-pos of the plot
_val:intake value that needs to be plotted.
_l:empty ArrayList to depict the graph (consecutive numerous lines)  
*/

  //draw a rect to where the plot is going to be drawn
  fill(plotBG);
  noStroke();
  rect(_x, _y, _w, _h);

  //map the incoming value of 0 to 360 to fit within the size of the plot
  //int mappedVal = (int)map(_val, -360, 360, _y, _y + _h);//how it will be in the real thing
  int mappedVal = (int)map((float)_val, 0, (float)height, (float)_y, (float)(_y + _h));

  //always make the last index with the latest values recorded
  _l.add(mappedVal);

  stroke(lineCol);
  strokeWeight(1);

  for (int i = 0; i < gPlots.size(); i++) {
    line(_y + _w - (_l.size() - i), _y + _h/2, _y + _w - (_l.size() - i), _l.get(i));

    //an attempt to make the visualization nicer.
    //beginShape(LINES);
    //fill(lineCol);
    //vertex(nudgeY + graphW - (plots.size() - i), nudgeY + graphH/2);
    //fill(255, 0, 0);
    //vertex(nudgeY + graphW - (plots.size() - i), plots.get(i));
    //endShape();
  } 

  if (_l.size() > _w) {
    _l.remove(0);
  }  
}
