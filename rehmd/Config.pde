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

} // class