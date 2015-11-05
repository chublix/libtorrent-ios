#!/bin/bash

pwd=`pwd`
LIPO=$(xcrun -sdk iphoneos -find lipo)

buildPlatform="all"
usingBitcode="YES"
cleanOutput="NO"

findLatestSDKVersion()
{
  SDKVERSION=`xcrun --sdk iphoneos --show-sdk-version`
}

buildIt()
{
  platform=$1

  if [[ $platform == "iphoneos" ]]; then
    archs='armv7 armv7s arm64'
  else
    archs='i386 x86_64'
  fi

  #otherFlags=''
  if [[ $SDKVERSION < 9.0  ]]; then
    usingBitcode == "NO"
  else
    if [[ $usingBitcode == "YES" ]]; then
      otherFlags='-fembed-bitcode'
    fi
  fi

  xcodebuild -workspace Libtorrent-rasterbar.xcworkspace ONLY_ACTIVE_ARCH=NO VALID_ARCHS='armv7 armv7s arm64 i386 x86_64' \
    SYMROOT="$pwd/output" -configuration Release ENABLE_BITCODE=$usingBitcode \
    ARCHS="$archs" -sdk "$platform$SDKVERSION" OTHER_CFLAGS="$otherFlags" -scheme torrent clean build | egrep '^(/.+:[0-9+:[0-9]+:.(error|warning):|fatal|===)'
}

buildForAllPlatform()
{
  buildIt iphoneos
  buildIt iphonesimulator

  mkdir -p $pwd/output/Universal

  LIPO -create $pwd/output/Release-iphoneos/libboost_system.a $pwd/output/Release-iphonesimulator/libboost_system.a -output $pwd/output/Universal/libboost_system.a
  LIPO -create $pwd/output/Release-iphoneos/libboost_filesystem.a $pwd/output/Release-iphonesimulator/libboost_filesystem.a -output $pwd/output/Universal/libboost_filesystem.a
  LIPO -create $pwd/output/Release-iphoneos/libtorrent.a $pwd/output/Release-iphonesimulator/libtorrent.a -output $pwd/output/Universal/libtorrent.a
}

findLatestSDKVersion

for i in "$@"
do
  case $i in
    -p=*|--platform=*)
    buildPlatform="${i#*=}"
    shift
    ;;
    -b=*|--bitcode=*)
    usingBitcode="${i#*=}"
    shift
    ;;
    -c|--clean)
    cleanOutput="YES"
    shift
    ;;
    *)

    ;;
  esac
done

if [[ $cleanOutput == "NO" ]]; then
  if [[ usingBitcode -ne "YES" && usingBitcode -ne "NO" ]]; then
    usingBitcode="YES"
  fi

  echo "Using bitcode: $usingBitcode"
  echo "Platform: $buildPlatform"

  if [[ $buildPlatform == "all" ]]; then
    buildForAllPlatform
  elif [[ $buildPlatform == "device" ]]; then
    buildIt iphoneos
  elif [[ $buildPlatform == "simulator" ]]; then
    buildIt iphonesimulator
  else
    buildForAllPlatform
  fi
else
  `rm -rf $pwd/output`
  echo "Output folder cleaned!"
fi
