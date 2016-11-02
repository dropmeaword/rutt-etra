## How to work with shaders

Shader code must be placed in the `data/shaders` folder. Each shader in it's on file, with extensions `.glsl`. If a file with the same name (but `.meta` as extension) is found it will be loaded and will be used to define shader-specific variables. If no meta file is found the shader will be loaded just fine but no additional variables will be defined. See [Shader metadata](shadermeta.md) for details.

## Shaders on Android

Android only supports a subset of the GLSL spec, the [GLSL ES specification](https://www.khronos.org/registry/gles/specs/3.2/GLSL_ES_Specification_3.20.pdf) specifically, so keep that in mind. 

## Shader variables

The following variables are available to all shaders.

#### Shadertoy compatibility

These variables allow you to use (some) shaders from shadertoy, sound is not supported at the moment:

|uniform|meaning|
|-------|-------|
|uniform vec3      iResolution; | viewport resolution (in pixels)|
|uniform float     iGlobalTime; | shader playback time (in seconds)|
|uniform float     iTimeDelta;  | render time (in seconds)|
|uniform int       iFrame;      | shader playback frame|
|uniform float     iChannelTime[4];| channel playback time (in seconds)|
|uniform vec3      iChannelResolution[4];| channel resolution (in pixels)|
|uniform vec4      iMouse;| mouse pixel coords. xy: current (if MLB down), zw: click|
|~~uniform samplerXX iChannel0..3;~~|~~input channel. XX = 2D/Cube~~|
|uniform vec4      iDate;| (year, month, day, time in seconds)|
|~~uniform float     iSampleRate;~~|~~sound sample rate (i.e., 44100)~~|

#### Android sensor readings

Readings from the different Android sensors can be used by defining the following uniforms:

|uniform|meaning|
|-------|-------|
|uniform vec3 andAccelerometer|x,y,z rotation in degrees|
|uniform vec3 andOrientation||
|uniform vec3 andMagneticField||
|uniform vec3 andGyroscope||
|uniform float andProximity||
|uniform vec3 andGravity||
|uniform float andLight||
|uniform float andAtmosphericPressure|in millibars|
|uniform float andTemperature|in degrees Celsius|
|uniform vec3 andLinearAccel|acceleration force in m/s^2, minus gravity|
|uniform vec3 andRotation||
|uniform float Humidity||
