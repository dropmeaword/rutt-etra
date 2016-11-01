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
      //throw e;
    }
  }

} // class