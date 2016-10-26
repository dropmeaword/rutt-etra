//import processing.cardboard.*;
import controlP5.*;
import java.util.*;
import java.io.*;

//PShader sdr;

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;

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
  initShaders();
  uiSetShaders(shaders);

  setShader(0);
}

void draw()
{
  shader.setShaderParameters();
  shader(shader.shader);
  rect(0, 0, width, height);
}