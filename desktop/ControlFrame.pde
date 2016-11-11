class ControlFrame extends PApplet {

  int w, h;
  PApplet parent;
  ControlP5 cp5;

  public ControlFrame(PApplet _parent, int _w, int _h, String _name) {
    super();
    parent = _parent;
    parent.registerMethod("dispose", this);
    w=_w;
    h=_h;
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

   public void dispose() {
     parent.dispose();
   }

  void settings() {
    size(w, h, P2D);
  }

  public ControlP5 controller() {
    return this.cp5;
  }

  public void setup() {
    surface.setLocation(10, 10);
    cp5 = new ControlP5(this);
  }

  public void draw() {
    background(190);
  }

  public synchronized void controlEvent(ControlEvent theEvent)
  {
    String name = theEvent.getName();
    //println("clicked => " + name);
    //println("    on => " + theEvent.value() );

     if(null != shader.parameters) {
       for (Param p : shader.parameters) {
         if (name.equals(p.name)) {
           if (p.is2d) {
             p.set(theEvent.getArrayValue());
           }
           else {
             p.set(theEvent.value());
           }
           return;
         }
       }
     } // parameters

    if (name.equals("selectShader")) {
      setShader((int) theEvent.value());
    }
  }

} // class ControlFrame