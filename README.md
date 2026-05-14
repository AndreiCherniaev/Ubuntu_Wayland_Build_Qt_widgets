To build a shared version of Qt with widgets for Ubuntu 26 (Wayland), tested with 26.04 (failed on Ubuntu 24.04.4 because of wayland). See also [Building Qt 6.8 LTS for Raspberry Pi on Raspberry Pi OS](https://www.tal.org/tutorials/building-qt-6-8-raspberry-pi).

Test
```
echo $XDG_SESSION_TYPE
```
Should be wayland  

## Prepare
```
git clone https://github.com/AndreiCherniaev/Ubuntu_Wayland_Build_Qt_widgets.git
export MyBaseDir="$PWD/Ubuntu_Wayland_Build_Qt_widgets"
```

## Build Qt themself
Install dependency
```
. "$MyBaseDir/Qt_themself/Ubuntu_dependency.sh"
```
Build Qt themself
```
"$MyBaseDir/Qt_themself/readme.sh" keep
```

## Build example
```
export QT_DEBUG_PLUGINS=1 #usually no need, use in case of error
"$MyBaseDir/example/readme.sh"
```

<p align="center">
  <img alt="This is how example application looks in Ubuntu" src="img/example window.png" width="200">
  <br>
    <em>example application</em>
</p>
