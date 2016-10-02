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

// ////////////////////////////////////////////////////////////////////////////
List<Shader> shaders;
Shader shader;

String stripExtension(String s)
{
    return s != null && s.lastIndexOf(".") > 0 ? s.substring(0, s.lastIndexOf(".")) : s;
}

void initShaders()
{
  Shader ashader;
  ShaderMeta ameta;
  shaders = new ArrayList<Shader>();

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
    ashader = new Shader("shaders/" + f.getName());

    // compute name of .meta file based on shader filename
    String base = stripExtension(f.getName());
    String fnameMeta = "shaders/"+base+".meta";

    // load shader metadata only if .meta file exists
    if( File.exists(fnameMeta) ) {
      ameta   = new ShaderMeta(fnameMeta, ashader);
    }

    // add shader to global list
    shaders.add( ashader );
  }
}


// void setShader(int idxNextShader) {
//   if (idxShader > -1)
//     shader.removeGui();
//   idxShader = idxNextShader;
//   shader = shaders.get(idxShader);
//   shader.addGui();
// }
