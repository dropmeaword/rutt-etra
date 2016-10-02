class Shader
{
  String path;
  PShader shader;
  ArrayList<Param> parameters;

  Shader(String path) {
    this.path = path;
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
    shader.set("resolution", float(pg.width), float(pg.height));
    for (Param p : parameters) {
      if (p.is2d) {
        shader.set(p.name, p.value2.x, p.value2.y);
      } else {
        shader.set(p.name, p.value);
      }
    }
  }

} // class
