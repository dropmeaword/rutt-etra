import controlP5.*;
import java.util.*;
import java.io.*;

import oscP5.*;
import netP5.*;

PGraphics pg;
int idxShader = -1;

void settings() {
  size(1200, 700, P3D);
}

void setup()
{
  initUI();
  initSensors();
  initOsc();

  initShaders();
  uiSetShaders(shaders);

  pg = createGraphics(1000, 700, OPENGL);
  setShader(0);
}

void draw()
{
  shader.setShaderParameters();

  pg.beginDraw();
  pg.shader(shader.shader);
  pg.rect(0, 0, pg.width, pg.height);
  pg.endDraw();

  fill(0);
  rect(0, 0, width, height);
  image(pg, 350, 0);
}