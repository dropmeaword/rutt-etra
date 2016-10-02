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

  List<String> getShaderList() {
    JSONArray shaders = json.getJSONArray("shaders");
    List<String> retval = new ArrayList<String>();

    for(int i = 0; i < shaders.size(); i++) {
      retval.add(shaders.getString(i));
    }

    return retval;
  } // getShaderList

} // class
