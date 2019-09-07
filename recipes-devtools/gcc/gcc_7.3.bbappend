FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

# Add a patch to fix variants to work correctly for C++17 rules on clang
# against libstdc++ from GCC which we need for everything else.
SRC_URI += " \
	file://wgv-variant-fixes.patch \
	"

