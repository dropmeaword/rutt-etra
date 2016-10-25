### Known bugs

##### ThreadDeath
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

##### ConcurrentModificationException
Another multi-threading related problem, seems to happen when drawing GUI components.

```
java.util.ConcurrentModificationException
	at java.util.Vector$Itr.checkForComodification(Vector.java:1184)
	at java.util.Vector$Itr.next(Vector.java:1137)
	at controlP5.ControllerGroup.drawControllers(Unknown Source)
	at controlP5.ControllerGroup.draw(Unknown Source)
	at controlP5.ControlWindow.draw(Unknown Source)
	at controlP5.ControlWindow.draw(Unknown Source)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:498)
	at processing.core.PApplet$RegisteredMethods.handle(PApplet.java:1402)
	at processing.core.PApplet$RegisteredMethods.handle(PApplet.java:1395)
	at processing.core.PApplet.handleMethods(PApplet.java:1589)
	at processing.core.PApplet.handleDraw(PApplet.java:2425)
	at processing.awt.PSurfaceAWT$12.callDraw(PSurfaceAWT.java:1540)
	at processing.core.PSurfaceNone$AnimationThread.run(PSurfaceNone.java:316)

```
