//import processing.cardboard.*;
import controlP5.*;
import java.util.*;
import java.io.*;

// from http://android.processing.org/tutorials/sensors/index.html
import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;

//PGraphics pg;
int idxShader = -1;

void settings() {
  size(800, 460, P3D);
}

void setup()
{
  initSensors();
  config = new Config("hmdviewer.config");
}

void draw()
{
  shader.setShaderParameters();
  shader(shader.shader);
  rect(0, 0, width, height);
}