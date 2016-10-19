class ShaderUI extends Shader {

    ShaderUI(String path) {
      super(path);
    }

    void addGui() {
      PVector guiPosition = new PVector(15, 50);
      if(null != parameters) {
        for (Param p : parameters) {
          if (p.is2d) {
            //cf.controller().addSlider2D(p.name)
            //   .setArrayValue(new float[]{p.value2.x, p.value2.y})
            //   .setMinX(p.minValue2.x).setMinY(p.minValue2.y)
            //   .setMaxX(p.maxValue2.x).setMaxY(p.maxValue2.y)
            //   .setPosition(guiPosition.x, guiPosition.y)
            //   .setSize(300, 300);
            guiPosition.y += 330;
          }
          else {
            //cf.controller().addSlider(p.name)
            //   .setValue(p.value)
            //   .setRange(p.minValue, p.maxValue)
            //   .setPosition(guiPosition.x, guiPosition.y)
            //   .setSize(300, 25);
            guiPosition.y += 35;
          } // if else
        } // for
      } // if
    }

    void removeGui() {
      if(null != parameters) {
        for (Param p : parameters) {
          //cf.controller().remove(p.name);
        }
      }
    }

} // class


void setShader(int idxNextShader) {
  if (idxShader > -1) {
    shader.removeGui();
  }
  idxShader = idxNextShader;
  shader = shaders.get(idxShader);
  shader.addGui();
}