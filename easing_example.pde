
Easing easing;
boolean isAnimating = false;

float t, dt;
int mode = 1;
void setup(){
	size(400, 400);
	easing = new Easing();

	clear();
	dt = (float)1/128;
}


void draw(){
	if(isAnimating){

		noStroke();
		fill(#ff0000);

		if(mode == 1)ellipse(t*(width-100)+50, easing.getLinear(height-50, 50, t), 5, 5);
		else if(mode == 2)ellipse(t*(width-100)+50, easing.getQuadIn(height-50, 50, t), 5, 5);
		else if(mode == 3)ellipse(t*(width-100)+50, easing.getCubicOut(height-50, 50, t), 5, 5);
		else if(mode == 4)ellipse(t*(width-100)+50, easing.getQuartInOut(height-50, 50, t), 5, 5);
		else if(mode == 5)ellipse(t*(width-100)+50, easing.getQuintInOut(height-50, 50, t), 5, 5);
		else if(mode == 6)ellipse(t*(width-100)+50, easing.getBackInOut(height-50, 50, t, .1, .3, .3, .05), 5, 5);
		else if(mode == 6)ellipse(t*(width-100)+50, easing.getBackInOut(height-50, 50, t), 5, 5);
		else if(mode == 7)ellipse(t*(width-100)+50, easing.getBackOut(height-50, 50, t, .1), 5, 5);
		else if(mode == 8)ellipse(t*(width-100)+50, easing.getDampOut(height-50, 50, t, .3, -1), 5, 5);
		else if(mode == 9)ellipse(t*(width-100)+50, easing.getDampIn(height-50, 50, t, .4, 1), 5, 5);
		else if(mode == 0)ellipse(t*(width-100)+50, easing.getDampInOut(height-50, 50, t, .4, .6, 4, 3), 5, 5);
		t+=dt;
		if(t > 1)isAnimating = false;
	}
	else t = t;
}

void keyPressed(){
	if((0+48 <= key && key <= 9+48)){
		mode = key-48;
		clear();
		isAnimating = true;
	}
}

void clear(){
	t = 0;
	textMode(CENTER);
	textAlign(CENTER, CENTER);
	rectMode(CENTER);
	background(200);
	noFill();
	stroke(0);
	strokeWeight(1);
	rect(width/2, height/2, height-100, height-100);
	fill(0, 50);
	textSize(200);
	text(mode, width/2, height/2);
}