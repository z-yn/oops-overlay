# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit unpacker eutils

DESCRIPTION="N1"
HOMEPAGE="http://www.nylas.com/"

SRC_URI_AMD64="https://edgehill.s3-us-west-2.amazonaws.com/${PV}-b0ec335/linux-deb/x64/N1.deb"
SRC_URI="
        amd64? ( ${SRC_URI_AMD64} )
"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-vcs/git
    gnome-base/gconf
    x11-libs/gtk+:2
    virtual/udev
    dev-libs/libgcrypt
    x11-libs/libnotify
    x11-libs/libXtst
    dev-libs/nss
    dev-lang/python
    gnome-base/gvfs
    x11-misc/xdg-utils
"

S="${WORKDIR}"

RESTRICT="mirror"

src_unpack() {
    unpack_deb ${A}
}

src_install() {
    cp -R "${WORKDIR}/usr" "${D}" || die "install failed!" 
}
