class Easing {
	// linear
	float getLinear(float from, float end, float t){
		return (1-t)*from + t*end;
	}

	// based on quadratic equation
	float getQuadInOut(float from, float end, float t){
		float center = (from+end)/2;
		return (t <= .5)?getQuadIn(from, center, t*2): getQuadOut(center, end, (t-.5)*2);
	}
	float getQuadIn(float from, float end, float t){
		return t*t*(end - from) + from;
	}
	float getQuadOut(float from, float end, float t){
		return -(t-1)*(t-1)*(end - from) + end;
	}

 	// based on cubic equation
	float getCubicInOut(float from, float end, float t){
		float center = (from+end)/2;
		return (t <= .5)?getCubicIn(from, center, t*2): getCubicOut(center, end, (t-.5)*2);
	}
	float getCubicIn(float from, float end, float t){
		return t*t*t*(end - from) + from;
	}
	float getCubicOut(float from, float end, float t){
		return (t-1)*(t-1)*(t-1)*(end - from) + end;
	}

	// based on quartic equation
	float getQuartInOut(float from, float end, float t){
		float center = (from+end)/2;
		return (t <= .5)?getQuartIn(from, center, t*2): getQuartOut(center, end, (t-.5)*2);
	}
	float getQuartIn(float from, float end, float t){
		return t*t*t*t*(end - from) + from;
	}
	float getQuartOut(float from, float end, float t){
		return -(t-1)*(t-1)*(t-1)*(t-1)*(end - from) + end;
	}

	// based on quintic equatiion
	float getQuintInOut(float from, float end, float t){
		float center = (from+end)/2;
		return (t <= .5)?getQuintIn(from, center, t*2): getQuintOut(center, end, (t-.5)*2);
	}
	float getQuintIn(float from, float end, float t){
		return t*t*t*t*t*(end - from) + from;
	}
	float getQuintOut(float from, float end, float t){
		return (t-1)*(t-1)*(t-1)*(t-1)*(t-1)*(end - from) + end;
	}

	// based on damping sine wave
	// t_in, t_out and t_in_out mean a duration of dammping at in/out -> 0~1.0
	// num_damp, num_damp_in, num_damp_out mean a number of dampling
	float getDampInOut(float from, float end, float t, float t_in, float t_out, int num_damp_in, int num_damp_out){
		float center = (from+end)/2;
		return (t <= 0.5)? getDampIn(from, center, t*2, t_in, num_damp_in): getDampOut(center, end, (t-.5)*2, t_out, num_damp_out);
	}
	float getDampInOut(float from, float end, float t, float t_in_out, int num_damp){
		return getDampInOut(from, end, t, t_in_out, t_in_out, num_damp, num_damp);	
	}
	float getDampInOut(float from, float end, float t, int num_damp){
		return getDampInOut(from, end, t, num_damp);	
	}
	float getDampInOut(float from, float end, float t){
		return getDampInOut(from, end, t, 0.7, 3);	
	}
	float getDampIn(float from, float end, float t, float t_in, int num_damp){
		return (t < t_in)? ((num_damp%2==0)?-1:1)*0.1*(end-from)*(1-(t_in-t)/t_in)*sin((1-(t_in-t))/t_in*(TWO_PI*(num_damp+.5)))+from: 1.1*(end-from)*sin(((t-t_in)/(1-t_in))*HALF_PI-HALF_PI)+end;
	}
	float getDampIn(float from, float end, float t, int num_damp){
		return getDampIn(from, end, t, 0.7, num_damp);
	}
	float getDampIn(float from, float end, float t){
		return getDampIn(from, end, t, 3);
	}
	float getDampOut(float from, float end, float t, float t_out, int num_damp){
		return (1-t_out < t)? 0.1*(end-from)*(1-(t-(1-t_out))/(t_out))*sin((t-(1-t_out))/t_out*(TWO_PI*num_damp)+HALF_PI)+end: 1.1*(end-from)*sin((t/(1-t_out))*HALF_PI)+from;
	}
	float getDampOut(float from, float end, float t, int num_damp){
		return getDampOut(from, end, t, 0.7, num_damp);
	}
	float getDampOut(float from, float end, float t){
		return getDampOut(from, end, t, 3);
	}
}