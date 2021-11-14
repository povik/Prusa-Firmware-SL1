FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"
SRC_URI:append = " \
	   file://0001-kiosk-bg-shell.patch \
	   file://prusa_logo.webp \
"

PACKAGECONFIG ?= "kms egl pam systemd webp"

EXTRA_OEMESON = "-Dbackend-default=drm -Dpipewire=false -Dshell-kiosk=true"

copy_prusa_logo() {
	cp ${WORKDIR}/prusa_logo.webp ${S}/data/
}
do_unpack[postfuncs] = "copy_prusa_logo"
