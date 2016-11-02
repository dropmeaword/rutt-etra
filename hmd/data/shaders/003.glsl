#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif


uniform float time;
const float Pi = 3.14159;

void main()
{
    vec2 p=.002*gl_FragCoord.xy;
    for(int i=1;i<5;i++)
    {
        vec2 newp=p;
        newp.x+=1.1/float(i)*sin(float(i)*p.y+(time*3.0)/20.0+0.3*float(i))+4.;
        newp.y+=0.8/float(i)*cos(float(i)*p.x+(time*2.0)/20.0+0.3*float(i*10))-4.0;
        p=newp;
    }
    vec3 col=vec3(0.3+0.5*sin(3.0*p.x)+0.5,0.5+0.4*sin(1.0*p.x),0.2+.5*sin(p.y)+0.5);
    gl_FragColor=vec4(col, 1.0);
}
