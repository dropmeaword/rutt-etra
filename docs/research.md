## Notes for graphic shell

#### P5
  * [[http://android.processing.org/tutorials/cardboard_intro/index.html|Processing for Android]]
  * [[https://github.com/ajavamind/Processing-Cardboard|Cardboard VR for Processing]]
  * [[http://ketai.org/|Processing library for sensor access on Android]]
  * [[https://processing.org/tutorials/pshader/|Shaders in P5]]
  * [[https://codeanticode.wordpress.com/2014/05/08/shader_api_in_processing_2/|Shader uniforms available in P5]]

#### Android
  * [[https://developer.android.com/guide/topics/sensors/sensors_overview.html|Types of sensors available from Google API]]
  * [[https://source.android.com/devices/sensors/hal-interface.html|Android HAL interface, C API]]
  * [[https://developers.google.com/vr/android/reference/com/google/vr/sdk/base/Eye.html#getEyeView()|Get eye transformation matrix from Android API]]

## Shaders
  * [[http://www.mtbs3d.com/phpBB/viewtopic.php?f=120&t=21174|SweetFX VR correction shader]]
    * Barrel Distortion
    * Vignette on/off
    * Aspect Ratio Correction on/off
    * ScaleFactor (larger or smaller)
    * Chromatic Aberration Correction
    * Distortion Scaling (Can be tweaked for various lenses)


## Arduino to Android communication
#### Via serial (usb)
  * Android Phone which supports USB Host Mode (i.e OTG Support) - Most devices running Android 3.1+ support this. Check if your phone does using the USB Host Diagnostics App from the Play Store.
  * Arduino - Any version will do. I will be using an Uno R3 .
  * Arduino USB Cable
  * [[http://www.eagleg.com/micro-usb-otg-adapter-for-samsung-galaxy-s3.html?gclid=CjwKEAjw1_KwBRDEz_WvncL4jGwSJAAEym0d8K9lWRxKKIMLGRgZaFIKsTxzMgGZW89XdZunqstphhoCY0Dw_wcB|USB OTG Cable]] - You will need this to connect the USB cable of the Arduino to the micro-USB port of the  Smartphone. It costs about $5 on Amazon.
  * Android Studio - You will need to have this installed and setup. It is pretty easy to do that.  Android Studio makes app development easier with its predictions and code generation. It's one of the best IDEs out there. You could also follow this article to set up Android Studio on your computer.
(from [[http://www.allaboutcircuits.com/projects/communicate-with-your-arduino-through-android/|Android <-> Arduino communication via usb]])

#### Arduino + bluetooth module
  * [[https://diyhacking.com/arduino-bluetooth-basics/|Good basic tutorial]]


#### IOIO Arduino board
  * [[https://github.com/ytai/ioio/wiki|IOIO wiki]]

#### LightBlue Bean
  * [[https://punchthrough.com/bean/reference|Reference API]]
