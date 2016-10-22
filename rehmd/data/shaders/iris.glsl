#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

// From Processing 2.1 and up, this line is optional
#define PROCESSING_COLOR_SHADER

// if you are using the texture channels, the above should be
// #define PROCESSING_TEXTURE_SHADER

uniform vec2 iResolution;      // viewport resolution (in pixels)
uniform float iGlobalTime;     // shader playback time (in seconds)
uniform vec4 iMouse;           // mouse pixel coords. xy: current (if mouse button down), zw: click
uniform vec4 iDate;            // (year, month, day, time in seconds)



// -------- Below is the code you can directly paste back and forth from www.shadertoy.com ---------

// http://www.pouet.net/prod.php?which=57245

#define t iGlobalTime
#define r iResolution.xy

void main(void) {
	vec3 c;
	float l,z=t;
	for(int i=0;i<3;i++) {
		vec2 uv,p=gl_FragCoord.xy/r;
		uv=p;
		p-=.5;
		p.x*=r.x/r.y;
		z+=.07;
		l=length(p);
		uv+=p/l*(sin(z)+1.)*abs(sin(l*9.-z*2.));
		c[i]=.01/length(abs(mod(uv,1.)-.5));
	}
	gl_FragColor=vec4(c/l,t);
}
