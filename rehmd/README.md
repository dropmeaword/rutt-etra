### Known bugs

Sometimes you can get this exception upon exit. It first started happening when
I separated the control and render panels into two windows. Each of these windows runs it's own animation thread but upon program termination it isn't clear to me how to shut both windows down safely.

```
java.lang.ThreadDeath
	at java.lang.Thread.stop(Thread.java:850)
	at com.jogamp.newt.opengl.GLWindow$GLLifecycleHook$1.run(GLWindow.java:724)
	at java.security.AccessController.doPrivileged(Native Method)
	at com.jogamp.newt.opengl.GLWindow$GLLifecycleHook.shutdownRenderingAction(GLWindow.java:719)
	at jogamp.newt.WindowImpl.shutdown(WindowImpl.java:635)
	at jogamp.newt.WindowImpl.shutdownAll(WindowImpl.java:123)
	at jogamp.newt.DisplayImpl$1.run(DisplayImpl.java:74)
	at com.jogamp.nativewindow.NativeWindowFactory.shutdown(NativeWindowFactory.java:274)
	at com.jogamp.nativewindow.NativeWindowFactory$2$1.run(NativeWindowFactory.java:192)
	at java.lang.Thread.run(Thread.java:745)
```
