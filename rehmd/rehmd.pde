//import processing.cardboard.*;
import controlP5.*;
import java.util.*;
import java.io.*;

PShader sdr;

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

//  sdr = loadShader("data/shaders/landscape.glsl");
  uiInit();
  ////if( cf != null ) { println("Not null anymore"); }
  initShaders();
  uiSetShaders(shaders);

  setShader(0);
}

void draw()
{
  shader.setShaderParameters();
  //shader.set("time", (float) millis()/1000.0);
  //shader.set("resolution", float(width), float(height));

  //shader.set("complexity", 0.8);
  //shader.set("rings", 200);

  //date[0] = year();
  //date[1] = month();
  //date[2] = day();
  //date[3] = (hour() *60 * 60) + (minute() * 60) + second();

  //mouse[0] = mouseX;
  //mouse[1] = mouseY;

  //shader.set("iResolution", res);
  //shader.set("iGlobalTime", (millis() * 1.0 / 1000.0) );
  //shader.set("iDate", date);
  //shader.set("iMouse", mouse);

  shader(shader.shader);
  rect(0, 0, width, height);
}