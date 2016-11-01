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

    // set uniforms in shader 
    // these values come form Android sensor readings (thus the 'and' prefix)
    shader.set("andAccel", accel);
    shader.set("andLinearAccel", linearaccel);
    shader.set("andRotation", rotation);
    shader.set("andOrientation", orientation);
    shader.set("andGyro", gyro);
    shader.set("andMagnet", magnet);
    shader.set("andGravity", gravity);
    shader.set("andLux", lux);
    shader.set("andPressure", pressure);
    shader.set("andAltitude", altitude);
    shader.set("andProximity", proximity);
    shader.set("andHumidity", humidity);
    shader.set("andTemperature", temperature);

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
    println( "Shader => " + this.path );
    for(Param p : this.parameters) {
      println( "        Shader.param => " + p.name );
    }
  }
  
} // class