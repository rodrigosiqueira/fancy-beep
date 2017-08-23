# fancy-beep

# About

> fancy-beep is a simple application to provide a sonorous alert for two
different situations: end of a command execution and Pomodoro. Basically,
fancy-beep work as a wrapper for any long application (e.g.: compile Linux
Kernel or wait for some data processing). Additionally, it is a tool for help
to control your time.

# Install

> To install:

```
./setup -i
```

# How to

> There is two ways to use fancy-beep. First, you can use as a sonorous alert
for a long task. See:

```
fancy-beep make -j5
```

The above command will make a sound at the end of the compilation. You can
use it to any command line that you want.

> Another use is like a Pomodoro or just a timer. See:

```
fancy-beep -t 30m
```

fancy-beep will execute in background and after 30 minutes will make a sound.
You can use three different extensions for time:

* m: Minute
* h: Hour
* s: Second. Other string will be interpreted as a second

# Development

> Dependencies:

* shunit2
