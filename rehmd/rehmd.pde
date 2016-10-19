//import processing.cardboard.*;
import controlP5.*;
import java.util.*;
import java.io.*;

// import android.content.Context;
// import android.hardware.Sensor;
// import android.hardware.SensorEvent;
// import android.hardware.SensorEventListener;
// import android.hardware.SensorManager;

//PGraphics pg;
int idxShader = -1;

void settings() {
  size(800, 460, P3D);
}

void setup()
{
  config = new Config("hmdviewer.config");

  uiInit();
  //if( cf != null ) { println("Not null anymore"); }
  initShaders();
  uiSetShaders(shaders);
/*
  for(Shader s : shaders) {
    println( "Shader => " + s.path );
    for(Param p : s.parameters) {
      println( "        Shader.param => " + p.name );
    }
  }
*/

  setShader(0);
}

void draw()
{
  shader.setShaderParameters();

  shader(shader.shader);
  rect(0, 0, width, height);
/*
  fill(0);
  rect(0, 0, 480, height);
  image(pg, 480, 0);
*/
}