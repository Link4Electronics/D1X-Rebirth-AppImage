#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm \
    glu        \
    libdecor   \
    physfs     \
    python     \
    sdl2       \
    sdl2_image \
    sdl2_mixer

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
make-aur-package dxx-rebirth-git

# If the application needs to be manually built that has to be done down here
#echo "Making nightly build of D1X-Rebirth..."
#echo "---------------------------------------------------------------"
#REPO="https://github.com/dxx-rebirth/dxx-rebirth"
#VERSION="$(git ls-remote "$REPO" HEAD | cut -c 1-9 | head -1)"
#git clone "$REPO" ./dxx-rebirth
#echo "$VERSION" > ~/version



#mkdir -p ./AppDir/bin
#cd ./dxx-rebirth
#wget https://www.dxx-rebirth.com/d1x-rebirth_addons.zip
#local -a _common_opts=(
#        "$MAKEFLAGS"
#        '-Cdxx-rebirth'
#        'builddir=./build'
#        'prefix=/usr'
#        'opengl=yes'
#        'sdl2=yes'
#        'sdlmixer=yes'
#        'ipv6=yes'
#        'use_udp=yes'
#        'use_tracker=yes'
#        'screenshot=png')
    
#export CXXFLAGS="${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS/}"
#scons "${_common_opts[@]}" 'd1x=1' 'd2x=0' 'sharepath=/usr/share/d1x-rebirth'
#scons "${_common_opts[@]}" 'd1x=0' 'd2x=1' 'sharepath=/usr/share/d2x-rebirth'

#install -D -m755 dxx-rebirth/build/d1x-rebirth/d1x-rebirth -t "${pkgdir}/usr/bin"
#install -D -m644 'd1x-rebirth addons'/d1xr-hires.dxa -t "${pkgdir}/usr/share/d1x-rebirth"
#install -D -m644 'd1x-rebirth addons'/"d1xr-${_music}-music.dxa" -t "${pkgdir}/usr/share/d1x-rebirth"
#install -D -m644 dxx-rebirth/d1x-rebirth/d1x-rebirth.desktop -t "${pkgdir}/usr/share/applications"
#install -D -m644 dxx-rebirth/d1x-rebirth/d1x-rebirth.xpm -t "${pkgdir}/usr/share/pixmaps"
