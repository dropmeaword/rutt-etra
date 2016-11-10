import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 
import java.util.*; 
import java.io.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class desktop extends PApplet {

//import processing.cardboard.*;




//PShader sdr;

// import android.content.Context;
// import android.hardware.Sensor;
// import android.hardware.SensorEvent;
// import android.hardware.SensorEventListener;
// import android.hardware.SensorManager;

//PGraphics pg;
int idxShader = -1;

public void settings() {
  size(800, 460, P3D);
}

public void setup()
{
  config = new Config("hmdviewer.config");

//  sdr = loadShader("data/shaders/landscape.glsl");
  uiInit();
  initShaders();
  uiSetShaders(shaders);

  setShader(0);
}

public void draw()
{
  shader.setShaderParameters();
  shader(shader.shader);
  rect(0, 0, width, height);
}
Config config;

class Config
{
  String path;
  JSONObject json;

  Config(String path) {
    this.path = path;
    try {
      json = loadJSONObject(path);
      println("Loading config from " + path);
    } catch(Exception e) {
      println("...but failed!");
    }
  }  // ctor

  public List<String> getShaderList() {
    JSONArray shaders = json.getJSONArray("shaders");
    List<String> retval = new ArrayList<String>();

    for(int i = 0; i < shaders.size(); i++) {
      retval.add(shaders.getString(i));
    }

    return retval;
  } // getShaderList

} // class
class ControlFrame extends PApplet {

  int w, h;
  PApplet parent;
  ControlP5 cp5;

  ControlFrame(PApplet _parent, int _w, int _h, String _name) {
    super();
    parent = _parent;
    parent.registerMethod("dispose", this);
    w=_w;
    h=_h;
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  // void dispose() {
  //   parent.dispose();
  // }

  public void settings() {
    size(w, h);
  }

  public ControlP5 controller() {
    return this.cp5;
  }

  public void setup() {
    surface.setLocation(10, 10);
    cp5 = new ControlP5(this);
  }

  public void draw() {
    background(190);
  }

  public void controlEvent(ControlEvent theEvent)
  {
    String name = theEvent.getName();
    //println("clicked => " + name);
    //println("    on => " + theEvent.value() );

     if(null != shader.parameters) {
       for (Param p : shader.parameters) {
         if (name.equals(p.name)) {
           if (p.is2d) {
             p.set(theEvent.getArrayValue());
           }
           else {
             p.set(theEvent.value());
           }
           return;
         }
       }
     } // parameters

    if (name.equals("selectShader")) {
      setShader((int) theEvent.value());
    }
  }

} // class ControlFrame
ControlFrame cf;

public void uiInit() {
  cf = new ControlFrame(this, 400, 600, "Controls");
  cf.setup();
  surface.setLocation(420, 10);
}

public void uiSetShaders(List<ShaderUI> shaders) {
  PVector guiPosition = new PVector(15, height-250);
  
  //if(null == cf.controller()) { println("controller is null, shouldn't be"); }
  
  DropdownList guiShaders = cf.controller().addDropdownList("selectShader");
  guiShaders.setPosition(guiPosition.x, guiPosition.y).setSize(240, height-10).setItemHeight(25).setBarHeight(25);
  guiShaders.setCaptionLabel("shaders");
  //guiShaders.captionLabel().style().marginTop = 1;
  //guiShaders.captionLabel().style().marginLeft = 1;
  int i = 0;
  for (ShaderUI sha : shaders) {
    guiShaders.addItem(sha.path, i++);
  }
}
class Param 
{
  String name;
  float value;
  PVector value2;
  float minValue, maxValue;
  PVector minValue2, maxValue2;
  boolean is2d;

  Param(String name, float minValue, float maxValue) {
    this.name = name;
    this.minValue = minValue;
    this.maxValue = maxValue;
    this.value = 0.5f * (minValue + maxValue);
    is2d = false;
  }

  Param(String name, float minValue1, float maxValue1, float minValue2, float maxValue2) {
    this.name = name;
    this.minValue2 = new PVector(minValue1, minValue2);
    this.maxValue2 = new PVector(maxValue1, maxValue2);
    this.value2 = new PVector(0.5f * (this.minValue2.x + this.maxValue2.x),
                              0.5f * (this.minValue2.y + this.maxValue2.y) );
    is2d = true;
  }

  public void set(float value) {
    this.value = value;
  }

  public void set(float[] value) {
    this.value2.set(value[0], value[1]);
  }

} // class
// SensorManager sensorManager;
// SensorListener sensorListener;
// Sensor accelerometer;
// float[] accelData;


// KetaiSensor sensor;
//
// PVector magneticField, accelerometer;
// float light, proximity;
//
//
// void initSensors() {
//   sensor = new KetaiSensor(this);
//   sensor.start();
//   sensor.list();
//   accelerometer = new PVector();
//   magneticField = new PVector();
// }
//
//
// // ////////////////////////////////////////////////////////////////////////////
// // Sensor events
// // ////////////////////////////////////////////////////////////////////////////
//
// /* from: http://ketai.org/examples/multiplesensors/ */
//
// void onAccelerometerEvent(float x, float y, float z, long time, int accuracy)
// {
//   // do something
// }
//
// // x,y,z rotation in degrees, a=timestamp(nanos), b=accuracy
// void onOrientationEvent(float x, float y, float z, long time, int accuracy)
// {
// }
//
// // x,y,z geomag field in uT, a=timestamp(nanos), b=accuracy
// void onMagneticFieldEvent(float x, float y, float z, long a, int b)
// {
// }
//
// // x,y,z rotation in rads/sec, a=timestamp(nanos), b=accuracy
// void onGyroscopeEvent(float x, float y, float z, long a, int b) {
// }
//
// // x,y,z force of gravity in m/s^2, a=timestamp(nanos), b=accuracy
// void onGravityEvent(float x, float y, float z, long a, int b) {
// }
//
// // d distance from sensor (typically 0,1), a=timestamp(nanos), b=accuracy
// void onProximityEvent(float d, long a, int b) {
// }
//
// // d illumination from sensor in lx
// void onLightEvent(float d, long a, int b) {
// }
//
// // p ambient pressure in hPa or mbar, a=timestamp(nanos), b=accuracy
// void onPressureEvent(float p, long a, int b) {
// }
//
// // t temperature in degrees in degrees Celsius, a=timestamp(nanos), a=timestamp(nanos), b=accuracy
// void onTemperatureEvent(float t, long a, int b) {
// }
//
// // x,y,z acceleration force in m/s^2, minus gravity
// void onLinearAccelerationEvent(float x, float y, float z) {
// }
//
// // x,y,z rotation vector values, a=timestamp(nanos), b=accuracy
// void onRotationVectorEvent(float x, float y, float z, long a, int b) {
// }
//
// // h ambient humidity in percentage
// void onRelativeHumidityEvent(float h) {
// }
float []date = {0, 0, 0, 0};
float []mouse = {0, 0, 0, 0};
PVector res = new PVector(width, height);

class Shader
{
  String path;
  PShader shader;
  ArrayList<Param> parameters;

  Shader(String path) {
    this.path = path;
    println("Loading shader " + path);
    shader = loadShader(path);
    parameters = new ArrayList<Param>();
  }

  public void addParameter(String name, float minVal, float maxVal) {
    Param param = new Param(name, minVal, maxVal);
    parameters.add(param);
  }

  public void addParameter(String name, float minVal1, float maxVal1, float minVal2, float maxVal2) {
    Param param = new Param(name, minVal1, maxVal1, minVal2, maxVal2);
    parameters.add(param);
  }

  public void setShaderParameters() {
    shader.set("time", (float) millis()/1000.0f);
    shader.set("resolution", PApplet.parseFloat(width), PApplet.parseFloat(height));

    date[0] = year();
    date[1] = month();
    date[2] = day();
    date[3] = (hour() *60 * 60) + (minute() * 60) + second();

    mouse[0] = mouseX;
    mouse[1] = mouseY;

    shader.set("iResolution", res);
    shader.set("iGlobalTime", (millis() * 1.0f / 1000.0f) );
    shader.set("iDate", date);
    shader.set("iMouse", mouse);

    if(null != parameters) {
      for (Param p : parameters) {
        if (p.is2d) {
          shader.set(p.name, p.value2.x, p.value2.y);
        } else {
          shader.set(p.name, p.value);
        }
      } // for
    } // if
  } // setShaderParameters

  public void printShaderParams() {
    for(Shader s : shaders) {
      println( "Shader => " + s.path );
      for(Param p : s.parameters) {
        println( "        Shader.param => " + p.name );
      }
    }
  }
  
} // class

// ////////////////////////////////////////////////////////////////////////////
List<ShaderUI> shaders;
ShaderUI shader;

public String stripExtension(String s)
{
    return s != null && s.lastIndexOf(".") > 0 ? s.substring(0, s.lastIndexOf(".")) : s;
}

public void initShaders()
{
  ShaderUI ashader;
  ShaderMeta ameta;
  shaders = new ArrayList<ShaderUI>();

  // shaders are expected on 'data/shaders/' path
  String path = dataPath("shaders");
  println("Loading shaders from " + path); // print path for debugging
  java.io.File folder = new java.io.File(path);
  // get list of glsl files in that directory
  File[] files = folder.listFiles(new FilenameFilter() {
      public boolean accept(File dir, String name) {
          return name.toLowerCase().endsWith(".glsl");

      }
    });

  for(File f : files) {
    // load shader file
    ashader = new ShaderUI("shaders/" + f.getName());

    // compute name of .meta file based on shader filename
    String base = stripExtension(f.getName());
    String fmeta = base+".meta";

    // load shader metadata only if .meta file exists
    if( new File(path + File.separator + fmeta).isFile() ) {
      ameta   = new ShaderMeta("shaders/"+fmeta, ashader);
    }

    // add shader to global list
    shaders.add( ashader );
  }
}
class ShaderMeta
{
  String name;
  JSONObject json;

  ShaderMeta(String fname, Shader shader) {
    this.name = fname;
    try {
      println("Loading metadata for shader " + fname);
      json = loadJSONObject(fname);
      attachShaderParams( shader );
    } catch(Exception e) {
      println("...but failed!");
    }
  }  // ctor

  public void attachShaderParams(Shader ashader) {
    try {
      JSONArray params = json.getJSONArray("params");

      for(int i = 0; i < params.size(); i++) {
        JSONObject param = params.getJSONObject(i);

        String name = param.getString("name");
        float min = param.getFloat("min");
        float max = param.getFloat("max");
        String mapping = param.isNull("mapping") ? null : param.getString("mapping");
        /// @TODO at the moment we don't do anything with the mapping but this 
        /// should be used to map this parameter to a sensor
        ashader.addParameter(name, min, max);
      } // for
    } catch (Exception e) {
      println("Metadata couldn't be parsed, .meta file probably contains a typo. Fix it and try again.");
      throw e;
    }
  }

} // class
class ShaderUI extends Shader {

    ShaderUI(String path) {
      super(path);
    }

    public void addGui() {
      PVector guiPosition = new PVector(15, 50);
      if(null != parameters) {
        for (Param p : parameters) {
          if (p.is2d) {
            cf.controller().addSlider2D(p.name)
               .setArrayValue(new float[]{p.value2.x, p.value2.y})
               .setMinX(p.minValue2.x).setMinY(p.minValue2.y)
               .setMaxX(p.maxValue2.x).setMaxY(p.maxValue2.y)
               .setPosition(guiPosition.x, guiPosition.y)
               .setSize(300, 300);
            guiPosition.y += 330;
          }
          else {
            cf.controller().addSlider(p.name)
               .setValue(p.value)
               .setRange(p.minValue, p.maxValue)
               .setPosition(guiPosition.x, guiPosition.y)
               .setSize(300, 25);
            guiPosition.y += 35;
          } // if else
        } // for
      } // if
    }

    public void removeGui() {
      if(null != parameters) {
        for (Param p : parameters) {
          cf.controller().remove(p.name);
        }
      }
    }

} // class


public void setShader(int idxNextShader) {
  if (idxShader > -1) {
    shader.removeGui();
  }
  idxShader = idxNextShader;
  shader = shaders.get(idxShader);
  shader.addGui();
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "desktop" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
