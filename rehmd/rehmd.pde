//import processing.cardboard.*;
import controlP5.*;
import java.util.*;

Config config;

List<Shader> shaders;
Shader shader;
PGraphics pg;
int idxShader = -1;

void setup()
{
  size(1024, 600, OPENGL);

  config = new Config("hmdviewer.config");

  initShaders();
  initGui();

  //setupShaders();
  //setupGui();
  //setShader(0);
  pg = createGraphics(960, 720, OPENGL);
}

void initShaders() {
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
