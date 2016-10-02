//import processing.cardboard.*;
import controlP5.*;
import java.util.*;
import java.io.*;

import ketai.data.*;
import ketai.sensors.*;

PGraphics pg;
int idxShader = -1;

void setup()
{
  size(1024, 600, OPENGL);

  config = new Config("hmdviewer.config");

  initShaders();
  // initGui();

  for(Shader s : shaders) {
    println( "Shader => " + s.path );

    for(Param p : s.parameters) {
      println( "        Shader.param => " + p.name );
    }

  }

  pg = createGraphics(960, 720, OPENGL);
}

void draw()
{
  // shader.setShaderParameters();
  //
  // pg.beginDraw();
  // pg.shader(shader.shader);
  // pg.rect(0, 0, pg.width, pg.height);
  // pg.endDraw();
  //
  // fill(0);
  // rect(0, 0, 480, height);
  // image(pg, 480, 0);
}
