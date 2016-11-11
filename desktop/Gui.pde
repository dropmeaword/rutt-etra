//ControlFrame cf;

ControlP5 cp5;

void initUI() {
  //cf = new ControlFrame(this, 400, 600, "Controls");
  //cf.settings();
  //cf.setup();
  //surface.setLocation(420, 10);
  cp5 = new ControlP5(this);
  cp5.setFont(createFont("Courier", 10));
}

synchronized void uiSetShaders(List<ShaderUI> shaders) {
  PVector guiPosition = new PVector(15, 15); //height-250);
  
  //if(null == cf.controller()) { println("controller is null, shouldn't be"); }
  
  DropdownList guiShaders = cp5.addDropdownList("selectShader");
  guiShaders.setPosition(guiPosition.x, guiPosition.y).setSize(240, height-10).setItemHeight(15).setBarHeight(15);
  guiShaders.setCaptionLabel("shaders");
  //guiShaders.captionLabel().style().marginTop = 1;
  //guiShaders.captionLabel().style().marginLeft = 1;
  int i = 0;
  for (ShaderUI sha : shaders) {
    guiShaders.addItem(sha.path, i++);
  }
}


void controlEvent(ControlEvent evnt)
{
  String name = evnt.getName();
  //println("clicked => " + name);
  //println("    on => " + theEvent.value() );

   if(null != shader.parameters) {
     for (Param p : shader.parameters) {
       if (name.equals(p.name)) {
         if (p.is2d) {
           p.set(evnt.getArrayValue());
         }
         else {
           p.set(evnt.value());
         }
         return;
       }
     }
   } // parameters

  if (name.equals("selectShader")) {
    setShader((int) evnt.value());
  }
}