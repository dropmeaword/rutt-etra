//import processing.cardboard.*;

Config config;

void setup() {
  //fullScreen(PCardboard.STEREO);
  size(600, 600, P3D);

  config = new Config("hmdviewer.config");

  JSONArray shaders = config.json.getJSONArray("shaders");
  for(int i = 0; i < shaders.size(); i++) {
    //JSONObject jo = shaders.getJSONObject(i);
    println("shader: " + shaders.getString(i));
  }
}

void draw() {
  background(0);
  ambientLight(150, 150, 150);
  pointLight(255, 255, 255, 0, 0, 0);
  translate(width/2 - 1000, height/2, 500);
}
