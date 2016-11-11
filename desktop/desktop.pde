//import processing.cardboard.*;
import controlP5.*;
import java.util.*;
import java.io.*;

import oscP5.*;
import netP5.*;

OscP5 oscrx;

PGraphics pg;
int idxShader = -1;

void settings() {
  size(1200, 700, P3D);
}

void setup()
{
  initUI();
  initSensors();
  //initOsc();
  oscrx = new OscP5(this, 9000);

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

void oscEvent(OscMessage msg) {
  if( msg.checkAddrPattern("/gravity/X") ) {
      gravity.x = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/gravity/Y") ) {
      gravity.y = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/gravity/Z") ) {
      gravity.z = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/accelerometer/X") ) {
      accel.x = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/accelerometer/Y") ) {
      accel.y = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/accelerometer/Z") ) {
      accel.z = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/linearacceleration/X") ) {
      linearaccel.x = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/linearacceleration/Y") ) {
      linearaccel.y = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/linearacceleration/Z") ) {
      linearaccel.z = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/rotationvector/X") ) {
      rotation.x = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/rotationvector/Y") ) {
      rotation.y = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/rotationvector/Z") ) {
      rotation.z = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/gyroscope/X") ) {
      gyro.x = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/gyroscope/Y") ) {
      gyro.y = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/gyroscope/Z") ) {
      gyro.z = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/magneticfield/X") ) {
      magnet.x = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/magneticfield/Y") ) {
      magnet.y = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/magneticfield/Z") ) {
      magnet.z = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/gravity/X") ) {
      gravity.x = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/gravity/Y") ) {
      gravity.y = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/gravity/Z") ) {
      gravity.z = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/light") ) {
      lux = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/proximity") ) {
      proximity = msg.get(0).floatValue();
  } else {
    println("### received an osc message. with address pattern " + msg.addrPattern());
  }
}