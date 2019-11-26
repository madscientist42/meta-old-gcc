# Tell Yocto that we explictly want it to use GCC 7.x here...
GCCVERSION = "7.%"

# Technically, since the layer provides an older BINUTILS to work with
# we're going to force this as well...
BINUVERSION = "2.30%"

# This is specifically needed to make *ANY* GCC version 7.x or prior compiler 
# build with Warrior and beyond right.
DEBUG_PREFIX_MAP_remove = "-fmacro-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
BUILD_LDFLAGS_remove = "-Wl,--enable-new-dtags"

