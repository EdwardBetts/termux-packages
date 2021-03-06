TERMUX_PKG_HOMEPAGE=http://w3m.sourceforge.net/
TERMUX_PKG_DESCRIPTION="Text based Web browser and pager"
_MAJOR_VERSION=0.5.3
_MINOR_VERSION=20170102
TERMUX_PKG_VERSION=0.5.3.$_MINOR_VERSION
TERMUX_PKG_REVISION=1
# The upstream w3m project is dead, but every linux distribution uses
# this maintained fork in debian:
TERMUX_PKG_SRCURL=https://github.com/tats/w3m/archive/v${_MAJOR_VERSION}+git${_MINOR_VERSION}.tar.gz
TERMUX_PKG_SHA256=7eb8cadfa39daa6e8ecf8244847991f614fdc5319e601f58fc02956bc05b5ab1
TERMUX_PKG_FOLDERNAME=w3m-${_MAJOR_VERSION}-git${_MINOR_VERSION}
TERMUX_PKG_BUILD_IN_SRC=yes
TERMUX_PKG_DEPENDS="libgc, ncurses, openssl"
# ac_cv_func_bcopy=yes to avoid w3m defining it's own bcopy function, which
# breaks 64-bit builds where NDK headers define bcopy as a macro:
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="ac_cv_func_setpgrp_void=yes ac_cv_func_bcopy=yes"

#Overwrite the default /usr/bin/firefox with termux-open-url as default external browser. That way, pressing "M" on a URL will open a link in Androids default Browser.
TERMUX_PKG_EXTRA_CONFIGURE_ARGS+=" --with-browser=termux-open-url"
#Overwrite the default editor to just vi, as the default was /usr/bin/vi.
TERMUX_PKG_EXTRA_CONFIGURE_ARGS+=" --with-editor=vi"
# Avoid trying to build w3mimg:
TERMUX_PKG_EXTRA_CONFIGURE_ARGS+=" --enable-image=no"

# For Makefile.in.patch:
export TERMUX_PKG_BUILDER_DIR
