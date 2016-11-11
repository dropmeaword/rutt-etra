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