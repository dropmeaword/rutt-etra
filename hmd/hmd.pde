//import processing.cardboard.*;
import java.util.*;
import java.io.*;

// from http://android.processing.org/tutorials/sensors/index.html
//import android.content.Context;
//import android.hardware.Sensor;
//import android.hardware.SensorManager;
//import android.hardware.SensorEvent;
//import android.hardware.SensorEventListener;

//PGraphics pg;
int idxShader = -1;

List<Shader> shaders;
Shader shader;

void settings() {
  //fullScreen(P3D);
  //orientation(LANDSCAPE);
  size(600, 600, P3D);
}

void setup()
{
//  initSensors();
  config = new Config("hmdviewer.config");
  
  shaders = new ArrayList<Shader>();
  
  List<String> names = config.getShaderList();
  for(String fname : names) {
    shader = new Shader(fname);
  }
}

void draw()
{
  shader.setShaderParameters();
  shader(shader.shader);
  rect(0, 0, width, height);
}