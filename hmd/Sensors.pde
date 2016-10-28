SensorManager sensorManager;
List<Sensor> sensors;
Context context;
HMDSensorEventListener listener;

PVector accel;
PVector linearaccel;
PVector rotation;
PVector orientation;
PVector gyro;
PVector magnet;
PVector gravity;
float lux;
float pressure;
float altitude;
float proximity;
float humidity;
float temperature; // in celsius

void initSensors() {
  accel = new PVector();
  linearaccel = new PVector();
  rotation = new PVector();
  orientation = new PVector();
  gyro = new PVector();
  magnet = new PVector();
  gravity = new PVector();

  context = surface.getActivity();
  sensorManager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE);
  if (sensorManager != null) {
    List<Sensor> sensors = sensorManager.getSensorList(Sensor.TYPE_ALL);
    listener = new HMDSensorEventListener();
    for (Sensor s : sensors) {
      println(s.getName());
      sensorManager.registerListener(listener, s, SensorManager.SENSOR_DELAY_GAME);
    }
  }
}

class HMDSensorEventListener implements SensorEventListener {

   public void onAccuracyChanged(Sensor sensor, int accuracy) {
   }

   
   public void onSensorChanged(SensorEvent evt) {
      switch (evt.sensor.getType()) {
        case Sensor.TYPE_ACCELEROMETER : {
          accel.x = evt.values[0];
          accel.y = evt.values[1];
          accel.z = evt.values[2];
          break;
        }
        case Sensor.TYPE_AMBIENT_TEMPERATURE : {
          temperature = evt.values[0];
          break;
        }
        case Sensor.TYPE_GAME_ROTATION_VECTOR : {
          break;
        }
        case Sensor.TYPE_GEOMAGNETIC_ROTATION_VECTOR : {
          break;
        }
        case Sensor.TYPE_GRAVITY : {
          gravity.x = evt.values[0];
          gravity.y = evt.values[1];
          gravity.z = evt.values[2];
          break;
        }
        case Sensor.TYPE_GYROSCOPE : {
          gyro.x = evt.values[0];
          gyro.y = evt.values[1];
          gyro.z = evt.values[2];
          break;
        }
        case Sensor.TYPE_LIGHT : {
          lux = evt.values[0];
          break;
        }
        case Sensor.TYPE_LINEAR_ACCELERATION : {
          linearaccel.x = evt.values[0];
          linearaccel.y = evt.values[1];
          linearaccel.z = evt.values[2];
          break;
        }
        case Sensor.TYPE_MAGNETIC_FIELD : {
          magnet.x = evt.values[0];
          magnet.y = evt.values[1];
          magnet.z = evt.values[2];
          break;
        }
        //case Sensor.TYPE_PRESSURE : {
        //  pressure = evt.values[0];
        //  altitude = SensorManager.getAltitude(SensorManager.PRESSURE_STANDARD_ATMOSPHERE, pressure);
        //  break;
        //}
        case Sensor.TYPE_PROXIMITY : {
          proximity = evt.values[0];
          break;
        }
        case Sensor.TYPE_RELATIVE_HUMIDITY : {
          humidity = evt.values[0];
          break;
        }
        case Sensor.TYPE_ROTATION_VECTOR : {
          rotation.x = evt.values[0];
          rotation.y = evt.values[1];
          rotation.z = evt.values[2];
          break;
        }
        default : break;
    }
   } // onSensorChanged

} // class

/*

SensorEventListener listen = new SensorEventListener(){

   @Override
   public void onAccuracyChanged(Sensor arg0, int arg1) {
   }

   @Override
   public void onSensorChanged(SensorEvent arg0) {
      switch (mSensor.getType()) {
        case Sensor.TYPE_ACCELEROMETER : {
              txt1.setVisibility(1);
              txt2.setVisibility(1);
              txt3.setVisibility(1);
  
              txt1.setText("x : " + String.valueOf(event.values[0]));
              txt2.setText("y : " + String.valueOf(event.values[1]));
              txt3.setText("z : " + String.valueOf(event.values[2]));
          break;
        }
        case Sensor.TYPE_AMBIENT_TEMPERATURE : {
          // TODO : Fill
          break;
        }
        case Sensor.TYPE_GAME_ROTATION_VECTOR : {
          // TODO : Fill
          break;
        }
        case Sensor.TYPE_GEOMAGNETIC_ROTATION_VECTOR : {
          // TODO : Fill
          break;
        }
        case Sensor.TYPE_GRAVITY : {
          // TODO : Fill
          break;
        }
        case Sensor.TYPE_GYROSCOPE : {
          // TODO : Fill
          break;
        }
        case Sensor.TYPE_LIGHT : {
              txt1.setVisibility(1);
  
              txt1.setText("Light (in lux) : " + String.valueOf(event.values[0]));
          break;
        }
        case Sensor.TYPE_LINEAR_ACCELERATION : {
          // TODO : Fill
          break;
        }
        case Sensor.TYPE_MAGNETIC_FIELD : {
          // TODO : Fill
          break;
        }
        case Sensor.TYPE_PRESSURE : {
          float pressure_value = 0.0f;
            float height = 0.0f;
            
            pressure_value = event.values[0];
              height = SensorManager.getAltitude(SensorManager.PRESSURE_STANDARD_ATMOSPHERE, pressure_value);
              
              txt1.setVisibility(1);
              txt2.setVisibility(1);
              txt1.setText("Pressure Value (in hPa / Millibar) : " + String.valueOf(pressure_value));
              txt2.setText("Height : " + String.valueOf(height));
          break;
        }
        case Sensor.TYPE_PROXIMITY : {
              txt1.setVisibility(1);
  
              txt1.setText("Distance : " + String.valueOf(event.values[0]));
          break;
        }
        case Sensor.TYPE_RELATIVE_HUMIDITY : {
          // TODO : Fill
          break;
        }
        case Sensor.TYPE_ROTATION_VECTOR : {
          // TODO : Fill
          break;
        }
        case Sensor.TYPE_SIGNIFICANT_MOTION : {
          // TODO : Fill
          break;
        }
        case Sensor.TYPE_STEP_COUNTER : {
          // TODO : Fill
          break;
        }
        case Sensor.TYPE_STEP_DETECTOR : {
              // TODO : Fill
          break;
        }
        default : break;
      }
    }
   } // onSensorChanged
};


/*
@Override
  public void onAccuracyChanged(Sensor sensor, int accuracy) {
    // TODO Auto-generated method stub
    
  }

  @Override
  public void onSensorChanged(SensorEvent event) {
    switch (mSensor.getType()) {
      case Sensor.TYPE_ACCELEROMETER : {
            txt1.setVisibility(1);
            txt2.setVisibility(1);
            txt3.setVisibility(1);

            txt1.setText("x : " + String.valueOf(event.values[0]));
            txt2.setText("y : " + String.valueOf(event.values[1]));
            txt3.setText("z : " + String.valueOf(event.values[2]));
        break;
      }
      case Sensor.TYPE_AMBIENT_TEMPERATURE : {
        // TODO : Fill
        break;
      }
      case Sensor.TYPE_GAME_ROTATION_VECTOR : {
        // TODO : Fill
        break;
      }
      case Sensor.TYPE_GEOMAGNETIC_ROTATION_VECTOR : {
        // TODO : Fill
        break;
      }
      case Sensor.TYPE_GRAVITY : {
        // TODO : Fill
        break;
      }
      case Sensor.TYPE_GYROSCOPE : {
        // TODO : Fill
        break;
      }
      case Sensor.TYPE_LIGHT : {
            txt1.setVisibility(1);

            txt1.setText("Light (in lux) : " + String.valueOf(event.values[0]));
        break;
      }
      case Sensor.TYPE_LINEAR_ACCELERATION : {
        // TODO : Fill
        break;
      }
      case Sensor.TYPE_MAGNETIC_FIELD : {
        // TODO : Fill
        break;
      }
      case Sensor.TYPE_PRESSURE : {
        float pressure_value = 0.0f;
          float height = 0.0f;
          
          pressure_value = event.values[0];
            height = SensorManager.getAltitude(SensorManager.PRESSURE_STANDARD_ATMOSPHERE, pressure_value);
            
            txt1.setVisibility(1);
            txt2.setVisibility(1);
            txt1.setText("Pressure Value (in hPa / Millibar) : " + String.valueOf(pressure_value));
            txt2.setText("Height : " + String.valueOf(height));
        break;
      }
      case Sensor.TYPE_PROXIMITY : {
            txt1.setVisibility(1);

            txt1.setText("Distance : " + String.valueOf(event.values[0]));
        break;
      }
      case Sensor.TYPE_RELATIVE_HUMIDITY : {
        // TODO : Fill
        break;
      }
      case Sensor.TYPE_ROTATION_VECTOR : {
        // TODO : Fill
        break;
      }
      case Sensor.TYPE_SIGNIFICANT_MOTION : {
        // TODO : Fill
        break;
      }
      case Sensor.TYPE_STEP_COUNTER : {
        // TODO : Fill
        break;
      }
      case Sensor.TYPE_STEP_DETECTOR : {
            // TODO : Fill
        break;
      }
      default : break;
    }
  }
*/
  

// KetaiSensor sensor;
//
// PVector magneticField, accelerometer;
// float light, proximity;
//
//
// void initSensors() {
//   sensor = new KetaiSensor(this);
//   sensor.start();
//   sensor.list();
//   accelerometer = new PVector();
//   magneticField = new PVector();
// }
//
//
// // ////////////////////////////////////////////////////////////////////////////
// // Sensor events
// // ////////////////////////////////////////////////////////////////////////////
//
// /* from: http://ketai.org/examples/multiplesensors/ */
//
// void onAccelerometerEvent(float x, float y, float z, long time, int accuracy)
// {
//   // do something
// }
//
// // x,y,z rotation in degrees, a=timestamp(nanos), b=accuracy
// void onOrientationEvent(float x, float y, float z, long time, int accuracy)
// {
// }
//
// // x,y,z geomag field in uT, a=timestamp(nanos), b=accuracy
// void onMagneticFieldEvent(float x, float y, float z, long a, int b)
// {
// }
//
// // x,y,z rotation in rads/sec, a=timestamp(nanos), b=accuracy
// void onGyroscopeEvent(float x, float y, float z, long a, int b) {
// }
//
// // x,y,z force of gravity in m/s^2, a=timestamp(nanos), b=accuracy
// void onGravityEvent(float x, float y, float z, long a, int b) {
// }
//
// // d distance from sensor (typically 0,1), a=timestamp(nanos), b=accuracy
// void onProximityEvent(float d, long a, int b) {
// }
//
// // d illumination from sensor in lx
// void onLightEvent(float d, long a, int b) {
// }
//
// // p ambient pressure in hPa or mbar, a=timestamp(nanos), b=accuracy
// void onPressureEvent(float p, long a, int b) {
// }
//
// // t temperature in degrees in degrees Celsius, a=timestamp(nanos), a=timestamp(nanos), b=accuracy
// void onTemperatureEvent(float t, long a, int b) {
// }
//
// // x,y,z acceleration force in m/s^2, minus gravity
// void onLinearAccelerationEvent(float x, float y, float z) {
// }
//
// // x,y,z rotation vector values, a=timestamp(nanos), b=accuracy
// void onRotationVectorEvent(float x, float y, float z, long a, int b) {
// }
//
// // h ambient humidity in percentage
// void onRelativeHumidityEvent(float h) {
// }