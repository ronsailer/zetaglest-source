#!/bin/bash
# Use this script to build MegaGlest Source Code Archive for a Version Release
# ----------------------------------------------------------------------------
# Written by Mark Vejvoda <mark_vejvoda@hotmail.com>
# Copyright (c) 2011 Mark Vejvoda under GNU GPL v3.0+

VERSION=$(./mg-version.sh --version)
RELEASENAME=megaglest-source
PACKAGE="$RELEASENAME-$VERSION.tar.xz"
CURRENTDIR="$(dirname $(readlink -f $0))"
RELEASEDIR="$CURRENTDIR/release/$RELEASENAME-$VERSION/megaglest-$VERSION"
SOURCEDIR="$CURRENTDIR/../../source/"

echo "Creating source package in $RELEASEDIR"

[[ -d "$RELEASEDIR" ]] && rm -rf "$RELEASEDIR"
mkdir -p "$RELEASEDIR"

svn export --force "$SOURCEDIR" "$RELEASEDIR/source"

mkdir -p "$RELEASEDIR/mk/cmake/"
svn export --force "$CURRENTDIR/../cmake/" "$RELEASEDIR/mk/cmake/"
mkdir -p "$RELEASEDIR/mk/macosx/"
svn export --force "$CURRENTDIR/../macosx/" "$RELEASEDIR/mk/macosx/"
mkdir -p "$RELEASEDIR/mk/windoze/"
svn export --force "$CURRENTDIR/../windoze/" "$RELEASEDIR/mk/windoze/"

svn export --force "$CURRENTDIR/../../docs" $RELEASEDIR

svn export --force "$CURRENTDIR/glest.ini" $RELEASEDIR/glest.ini
svn export --force "$CURRENTDIR/glestkeys.ini" $RELEASEDIR/glestkeys.ini
svn export --force "$CURRENTDIR/servers.ini" $RELEASEDIR/servers.ini
svn export --force "$CURRENTDIR/glest.ico" $RELEASEDIR/glest.ico
svn export --force "$CURRENTDIR/megaglest.bmp" $RELEASEDIR/megaglest.bmp
svn export --force "$CURRENTDIR/megaglest.png" $RELEASEDIR/megaglest.png
svn export --force "$CURRENTDIR/megaglest.xpm" $RELEASEDIR/megaglest.xpm
svn export --force "$CURRENTDIR/megaglest.desktop" $RELEASEDIR/megaglest.desktop
svn export --force "$CURRENTDIR/megaglest.6" $RELEASEDIR/megaglest.6
svn export --force "$CURRENTDIR/megaglest_editor.6" $RELEASEDIR/megaglest_editor.6
svn export --force "$CURRENTDIR/megaglest_g3dviewer.6" $RELEASEDIR/megaglest_g3dviewer.6
svn export --force "$CURRENTDIR/../../data/glest_game/megaglest.ico" $RELEASEDIR/megaglest.ico
svn export --force "$CURRENTDIR/../../data/glest_game/g3dviewer.ico" $RELEASEDIR/g3dviewer.ico
svn export --force "$CURRENTDIR/../../data/glest_game/editor.ico" $RELEASEDIR/editor.ico
svn export --force "$CURRENTDIR/start_megaglest" $RELEASEDIR/start_megaglest
svn export --force "$CURRENTDIR/start_megaglest_configurator" $RELEASEDIR/start_megaglest_configurator
svn export --force "$CURRENTDIR/start_megaglest_g3dviewer" $RELEASEDIR/start_megaglest_g3dviewer
svn export --force "$CURRENTDIR/start_megaglest_mapeditor" $RELEASEDIR/start_megaglest_mapeditor
svn export --force "$CURRENTDIR/../../CMakeLists.txt" $RELEASEDIR/CMakeLists.txt

echo "Creating $PACKAGE"
[[ -f "$release/$PACKAGE" ]] && rm "release/$PACKAGE"
tar cJf "release/$PACKAGE" -C "$CURRENTDIR/release/$RELEASENAME-$VERSION" "megaglest-$VERSION"
