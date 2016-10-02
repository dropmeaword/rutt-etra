KetaiSensor sensor;

PVector magneticField, accelerometer;
float light, proximity;


void initSensors() {
  sensor = new KetaiSensor(this);
  sensor.start();
  sensor.list();
  accelerometer = new PVector();
  magneticField = new PVector();
}


// ////////////////////////////////////////////////////////////////////////////
// Sensor events
// ////////////////////////////////////////////////////////////////////////////

/* from: http://ketai.org/examples/multiplesensors/ */

void onAccelerometerEvent(float x, float y, float z, long time, int accuracy)
{
  // do something
}

// x,y,z rotation in degrees, a=timestamp(nanos), b=accuracy
void onOrientationEvent(float x, float y, float z, long time, int accuracy)
{
}

// x,y,z geomag field in uT, a=timestamp(nanos), b=accuracy
void onMagneticFieldEvent(float x, float y, float z, long a, int b)
{
}

// x,y,z rotation in rads/sec, a=timestamp(nanos), b=accuracy
void onGyroscopeEvent(float x, float y, float z, long a, int b) {
}

// x,y,z force of gravity in m/s^2, a=timestamp(nanos), b=accuracy
void onGravityEvent(float x, float y, float z, long a, int b) {
}

// d distance from sensor (typically 0,1), a=timestamp(nanos), b=accuracy
void onProximityEvent(float d, long a, int b) {
}

// d illumination from sensor in lx
void onLightEvent(float d, long a, int b) {
}

// p ambient pressure in hPa or mbar, a=timestamp(nanos), b=accuracy
void onPressureEvent(float p, long a, int b) {
}

// t temperature in degrees in degrees Celsius, a=timestamp(nanos), a=timestamp(nanos), b=accuracy
void onTemperatureEvent(float t, long a, int b) {
}

// x,y,z acceleration force in m/s^2, minus gravity
void onLinearAccelerationEvent(float x, float y, float z) {
}

// x,y,z rotation vector values, a=timestamp(nanos), b=accuracy
void onRotationVectorEvent(float x, float y, float z, long a, int b) {
}

// h ambient humidity in percentage
void onRelativeHumidityEvent(float h) {
}
