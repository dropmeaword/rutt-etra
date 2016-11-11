class SensorPlayground extends SensorBaseLayer {
  
  public SensorPlayground(Shader shader) {
    super(shader);
  }
  
  // /////////////////////////////////////////////////////////////////////////////
  // /////////////////////////////////////////////////////////////////////////////
  // You can change the code below this point to implement your
  // own mappings between sensor data and shader parameters.
  // /////////////////////////////////////////////////////////////////////////////
  // /////////////////////////////////////////////////////////////////////////////
  
  public void accelerometer(float a, float b, float c) {
    v0( (a / 16000), (b / 16000), (c / 16000) );
    
    ControllerInterface ctrl = cp5.get("rate");
    if(null != ctrl) {
      ctrl.setValue( a );
    }
  }

  public void gyroscope(float a, float b, float c) {
    v1( (a * .8), (b * .82), (c * .7) );
  }

  public void magnetometer(float a, float b, float c) {
    v2( .0, .0, .0 );
  }

  public void gravity(float a, float b, float c) {
    v3(a, b, c);
  }

  public void rotation(float a, float b, float c) {
    v4(a, b, c);
  }

  public void pressure(float val) {
    f0(val);
  }

  public void proximity(float val) {
    f1(val);
  }

  public void humidity(float val) {
    f3(val);
  }

  public void temperature(float val) {
    f4(val);
  }

  public void signalStrength(float val) {
  }

} // class