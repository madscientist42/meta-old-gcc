# Explicitly override the flags here- if we are using a GCC 7.X compiler
# with the official recipe (and we are, we need "-Wno-error=missing-attributes"
# gone as it's not supported in anything before 8.x on GCC...
# (Since this helper layer only provides 7.3 of GCC, we are going to only check
# for that and do the "right" things...)
MISSING_ATTRIBUTES_FLAG = "${@bb.utils.contains('GCCVERSION', '7.%', '', '-Wno-error=missing-attributes', d)}"
TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} ${MISSING_ATTRIBUTES_FLAG}"
CPPFLAGS_append_class-nativesdk = " ${MISSING_ATTRIBUTES_FLAG}"

