## How to work with shaders

Shader code must be placed in the `data/shaders` folder. Each shader in it's on file, with extensions `.glsl`. If a file with the same name (but `.meta` as extension) is found it will be loaded and will be used to define shader-specific variables. If no meta file is found the shader will be loaded just fine but no additional variables will be defined. See [Shader metadata](shadermeta.md) for details.

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
