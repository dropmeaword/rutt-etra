# Rutt-Etra VR machine

A VR graphic shell to experiment with shaders and sensors.

![vasulkas](docs/img/reminiscence.jpg)

## Software

The Rutt-Etra VR machine is composed of two applications written in Processing 3.

The *desktop* application can be used to compose, test and play around with your shaders, it allows you to define parameters and automatically creates a GUI for you to play around with them. The idea is that you use this desktop application to preview your shaders.

The *hmd* application runs on devices compatible with Google Cardboard. This application loads a config file that specifies which shaders to load and which order to apply them in the stack and then simply renders a rectangle using the Cardboard API, running through the shader stack. The *hmd* application also makes available the sensor readings of the android device as shader uniforms. Read further documentation in the `docs` directory.

### Desktop tool

Place your shaders and meta files in `desktop/data/shaders` and open processing 3 and open the `desktop/desktop.pde` file. You should now see a rudimentary GUI that allows you to select the shader and adjust the parameters specified in the *meta* file.

The preview window will display the result of applying the shader currently selected.

![desktop app](docs/img/app_desktop.png)

NOTE: The desktop application cannot yet simulate sensor inputs from Android to provide a faithful preview. This is planned for the future, perhaps using an OSC message pump from the phone to the desktop.

### HMD viewer

Just like the desktop tool, the *HMD* viewer expects shaders to be in `data/shaders`. The *HMD* tool will ignore any `.meta` files there because it doesn't use them.
