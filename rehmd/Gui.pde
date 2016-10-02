ControlP5 cp5;

void initGui(List<ShaderUI> shaders) {
  cp5 = new ControlP5(this);
  cp5.setFont(createFont("Courier", 14));

  DropdownList guiShaders = cp5.addDropdownList("selectShader");
  guiShaders.setPosition(480, 25).setSize(240, height-10).setItemHeight(25).setBarHeight(25);
  guiShaders.setCaptionLabel("shaders");
  //guiShaders.captionLabel().style().marginTop = 1;
  //guiShaders.captionLabel().style().marginLeft = 1;
  int i = 0;
  for (ShaderUI sha : shaders) {
    guiShaders.addItem(sha.path, i++);
  }
}

void controlEvent(ControlEvent theEvent)
{
  String name = theEvent.getName();
  println("clicked => " + name);
  println("    on => " + theEvent.value() );

  // if(null != shader.parameters) {
  //   for (Param p : shader.parameters) {
  //     if (name.equals(p.name)) {
  //       if (p.is2d) {
  //         p.set(theEvent.getArrayValue());
  //       }
  //       else {
  //         p.set(theEvent.value());
  //       }
  //       return;
  //     }
  //   }
  // } // parameters

  if (name.equals("selectShader")) {
    setShader((int) theEvent.value());
  }
}
