float []date = {0, 0, 0, 0};
float []mouse = {0, 0, 0, 0};
PVector res = new PVector(width, height);

class Shader implements SensorLayer
{
  String path;
  PShader shader;
  ArrayList<Param> parameters;
  
  SensorBaseLayer sensors;

  Shader(String path) {
    this.path = path;
    println("Loading shader " + path);
    shader = loadShader(path);
    sensors = new SensorPlayground( this );
    parameters = new ArrayList<Param>();
  }

  void addParameter(String name, float minVal, float maxVal) {
    Param param = new Param(name, minVal, maxVal);
    parameters.add(param);
  }

  void addParameter(String name, float minVal1, float maxVal1, float minVal2, float maxVal2) {
    Param param = new Param(name, minVal1, maxVal1, minVal2, maxVal2);
    parameters.add(param);
  }

  void setShaderParameters() {
    shader.set("time", (float) millis()/1000.0);
    shader.set("resolution", float(width), float(height));

    date[0] = year();
    date[1] = month();
    date[2] = day();
    date[3] = (hour() *60 * 60) + (minute() * 60) + second();

    mouse[0] = mouseX;
    mouse[1] = mouseY;

    shader.set("iResolution", res);
    shader.set("iGlobalTime", (millis() * 1.0 / 1000.0) );
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

  void printShaderParams() {
    for(Shader s : shaders) {
      println( "Shader => " + s.path );
      for(Param p : s.parameters) {
        println( "        Shader.param => " + p.name );
      }
    }
  }

  public void accelerometer(float a, float b, float c) {
    sensors.accelerometer(a, b, c);
  }
  
  public void gyroscope(float a, float b, float c) {
    sensors.gyroscope(a, b, c);
  }
  
  public void magnetometer(float a, float b, float c) {
    sensors.magnetometer(a, b, c);
  }
  
  public void gravity(float a, float b, float c) {
    sensors.gravity(a, b, c);
  }
  
  public void rotation(float a, float b, float c) {
    sensors.rotation(a, b, c);
  }
  
  public void pressure(float val) {
    sensors.pressure(val);
  }
  
  public void proximity(float val) {
    sensors.proximity(val);
  }
  
  public void humidity(float val) {
    sensors.humidity(val);
  }

  public void temperature(float val) {
    sensors.temperature(val);
  }

  public void signalStrength(float val) {
    sensors.signalStrength(val);
  }

} // class

// ////////////////////////////////////////////////////////////////////////////
List<ShaderUI> shaders;
ShaderUI shader;

String stripExtension(String s)
{
    return s != null && s.lastIndexOf(".") > 0 ? s.substring(0, s.lastIndexOf(".")) : s;
}

void initShaders()
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