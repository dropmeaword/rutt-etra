PVector accel;
PVector linearaccel;
PVector rotation;
PVector orientation;
PVector gyro;
PVector magnet;
PVector gravity;
float lux;
float pressure; // mPh
float altitude; // metres
float proximity;  // 0 or 1
float humidity; // percent
float temperature; // in celsius

void initSensors() {
  accel = new PVector();
  linearaccel = new PVector();
  rotation = new PVector();
  orientation = new PVector();
  gyro = new PVector();
  magnet = new PVector();
  gravity = new PVector();
}

void updateSensors() {
  // vector sensor readings
  shader.accelerometer(accel.x, accel.y, accel.z);
  shader.rotation(rotation.x, rotation.y, rotation.z);
  shader.gyroscope(gyro.x, gyro.y, gyro.z);
  shader.magnetometer(magnet.x, magnet.y, magnet.z);
  shader.gravity(gravity.x, gravity.y, gravity.z);
  
  // scalar sensor readings  
  shader.pressure(pressure);
  shader.proximity(proximity);
  shader.humidity(humidity);
  shader.temperature(temperature);
}