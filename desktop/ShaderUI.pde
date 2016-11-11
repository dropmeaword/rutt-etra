class ShaderUI extends Shader {

    ShaderUI(String path) {
      super(path);
    }

    void addGui() {
      synchronized(this) {
        PVector guiPosition = new PVector(15, 50);
        if(null != parameters) {
          for (Param p : parameters) {
            if (p.is2d) {
              cp5.addSlider2D(p.name)
                  .plugTo(this, p.name)
                 .setArrayValue(new float[]{p.value2.x, p.value2.y})
                 .setMinX(p.minValue2.x).setMinY(p.minValue2.y)
                 .setMaxX(p.maxValue2.x).setMaxY(p.maxValue2.y)
                 .setPosition(guiPosition.x, guiPosition.y)
                 .setSize(300, 300);
              guiPosition.y += 330;
            }
            else {
              cp5.addSlider(p.name)
                 .setValue(p.value)
                 .setRange(p.minValue, p.maxValue)
                 .setPosition(guiPosition.x, guiPosition.y)
                 .setSize(200, 15);
              guiPosition.y += 25;
            } // if else
          } // for
        } // if
      } // synchronized
    }

    void removeGui() {
      synchronized(this) {
        if(null != parameters) {
          for (Param p : parameters) {
            cp5.remove(p.name);
          }
        }
      } // synchronized
    }

} // class


void setShader(int idxNextShader) {
  synchronized(this) {
    if (idxShader > -1) {
      shader.removeGui();
    }
    idxShader = idxNextShader;
    shader = shaders.get(idxShader);
    shader.addGui();
  }
}