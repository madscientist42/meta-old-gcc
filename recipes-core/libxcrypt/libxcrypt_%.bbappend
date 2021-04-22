# Explicitly override the flags here- if we are using a GCC 7.X compiler
# with the official recipe (and we are, we need "-Wno-error=missing-attributes"
# gone as it's not supported in anything before 8.x on GCC...
# (Since this helper layer only provides 7.3 of GCC, we are going to only check
# for that and do the "right" things...)
MISSING_ATTRIBUTES_FLAG = "${@bb.utils.contains('GCCVERSION', '7.%', '', '-Wno-error=missing-attributes', d)}"

# Since native sdk is an append for some reason in a manner that we can't handle it
# like we do the other two flag sets (see below...), we need to explicitly remove it 
REMOVE_MISSING_ATTRIBUTES_FLAG = "${@bb.utils.contains('GCCVERSION', '7.%', '-Wno-error=missing-attributes', '', d)}"

TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} ${MISSING_ATTRIBUTES_FLAG}"
CPPFLAGS_append_class-nativesdk = " ${MISSING_ATTRIBUTES_FLAG}"

# Handle the -nativesdk story a bit differently...
CPPFLAGS_remove_class-nativesdk = " ${REMOVE_MISSING_ATTRIBUTES_FLAG}"
