# libtorrent-ios

libtorrent-rasterbar-1.0.6 for iOS like Xcode project with boost dependies.
For building library execute in terminal build.sh script, after building you can find buided universal binary (device and simulator) with bitcode support in output/Universal directory (same folder in which the script is).

##### Additional params:
- If you want library without bitcode support run build script with -b/--bitcode=NO|YES flag:
    ```sh
    sh build.sh -b=NO
    ```

- If you want library only for specefied platform run build script with -p/--platform=all|device|simulator flag:
    ```sh
    sh build.sh -p=device
    ```

- For cleaning buid directory run script with -c/--clean flag:
    ```sh
    sh build.sh -c
    ```
##### TvOS support:
  Added appletvos support. For building library for tvOS run build script with platform:
  - tvosdevice - for build only for device
    ```sh
    sh build.sh -p=tvosdevice
    ```
  - tvossimulator - for build only for tvOS simulator
    ```sh
    sh build.sh -p=tvossimulator
    ```
  - tvosall - for building univarsal(fat) library for both platform
    ```sh
    sh build.sh -p=tvosall
    ```
