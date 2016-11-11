ControlFrame cf;

void uiInit() {
  cf = new ControlFrame(this, 400, 600, "Controls");
  cf.settings();
  cf.setup();
  surface.setLocation(420, 10);
}

synchronized void uiSetShaders(List<ShaderUI> shaders) {
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