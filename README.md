libtorrent-ios
==============

libtorrent-rasterbar-1.0.6 for iOS like Xcode project with boost dependies.

For building library execute in terminal build.sh script, after building you can find buided universal binary (device and simulator) with bitcode support in output/Universal directory (same folder in which the script is).

If you want library without bitcode support run build script with -b/--bitcode=NO|YES flag:

  sh build.sh -b=NO
If you want library only for specefied platform run build script with -p/--platform=all|device|simulator flag:

  sh build.sh -p=device
For cleaning buid directory run script with -c/--clean flag: 

  sh build.sh -c
