/*
OscP5 oscP5;

void initOsc() {
  oscP5 = new OscP5(this, 12345);
}

void oscEvent(OscMessage msg) {
  println("shizzle");
  
  if( msg.checkAddrPattern("/gravity/X") ) {
      gravity.x = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/gravity/Y") ) {
      gravity.y = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/gravity/Z") ) {
      gravity.z = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/linearacceleration/X") ) {
      linearaccel.x = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/linearacceleration/Y") ) {
      linearaccel.y = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/linearacceleration/Z") ) {
      linearaccel.z = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/rotationvector/X") ) {
      rotation.x = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/rotationvector/Y") ) {
      rotation.y = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/rotationvector/Z") ) {
      rotation.z = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/gyroscope/X") ) {
      gyro.x = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/gyroscope/Y") ) {
      gyro.y = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/gyroscope/Z") ) {
      gyro.z = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/magneticfield/X") ) {
      magnet.x = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/magneticfield/Y") ) {
      magnet.y = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/magneticfield/Z") ) {
      magnet.z = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/gravity/X") ) {
      gravity.x = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/gravity/Y") ) {
      gravity.y = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/gravity/Z") ) {
      gravity.z = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/light") ) {
      lux = msg.get(0).floatValue();
  } else if ( msg.checkAddrPattern("/proximity") ) {
      proximity = msg.get(0).floatValue();
  } else {
    println("### received an osc message. with address pattern " + msg.addrPattern());
  }
}
*/