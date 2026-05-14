# To get in "$cross_user_path" not /home/user/Ubuntu_Wayland_Build_Qt_widgets but $HOME/Ubuntu_Wayland_Build_Qt_widgets
if [[ "$MyBaseDir" == *"$HOME"* ]]; then
    # Cut (remove) up to "secret:"
    cross_user_path="\$HOME${MyBaseDir#*$HOME}"
fi

export QT_DEBUG_PLUGINS=1
"$MyBaseDir/Qt_themself/build_artifacts_host_powerfull/bin/qt-cmake" -S "$MyBaseDir/example/src" -B "$MyBaseDir/example/build-host" -DCMAKE_BUILD_TYPE=Release --fresh
cmake --build "$MyBaseDir/example/build-host" --parallel
cpack -G DEB --config "$MyBaseDir/example/build-host/CPackConfig.cmake" -B "$MyBaseDir/example/build-host/"
echo "Make installation"
echo "sudo dpkg -i \"$cross_user_path/example/build-host/myexample-0.1.2-Linux.deb\""
echo "Run"
echo "myexample"
echo "If you want remove packet"
echo "sudo dpkg -r myexample"
echo "If you are developer then you can run directly"
echo "\"$cross_user_path/example/build-host/myexample\""
