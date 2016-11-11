interface SensorLayer {  
  public void accelerometer(float a, float b, float c);
  public void gyroscope(float a, float b, float c);
  public void magnetometer(float a, float b, float c);
  public void gravity(float a, float b, float c);
  public void rotation(float a, float b, float c);
  public void pressure(float val);
  public void proximity(float val);
  public void humidity(float val);
  public void signalStrength(float val);
} // iface

abstract class SensorBaseLayer {
  
  protected void v0(float a, float b, float c) {
  }

  protected void v1(float a, float b, float c) {
  }

  protected void v2(float a, float b, float c) {
  }

  protected void v3(float a, float b, float c) {
  }

  protected void v4(float a, float b, float c) {
  }

  protected void f0(float a) {
  }

  protected void f1(float a) {
  }

  protected void f2(float a) {
  }

  protected void f3(float a) {
  }

  protected void f4(float a) {
  }

  abstract public void accelerometer(float a, float b, float c);
  abstract public void gyroscope(float a, float b, float c);
  abstract public void magnetometer(float a, float b, float c);
  abstract public void gravity(float a, float b, float c);
  abstract public void rotation(float a, float b, float c);
  abstract public void pressure(float val);
  abstract public void proximity(float val);
  abstract public void humidity(float val);
  abstract public void signalStrength(float val);
}


class SensorPlayground extends SensorBaseLayer {
  
  public void accelerometer(float a, float b, float c) {
    v0( (a / 16000), (b / 16000), (c / 16000) );
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

  public void signalStrength(float val) {
    f4(val);
  }

} // class