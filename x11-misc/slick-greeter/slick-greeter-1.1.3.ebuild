# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools vala gnome2

DESCRIPTION="LightDM Slick Greeter"
HOMEPAGE="https://github.com/linuxmint/slick-greeter"
SRC_URI="https://github.com/linuxmint/slick-greeter/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3 LGPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

COMMON_DEPEND="x11-libs/gtk+:3
	>=x11-misc/lightdm-1.2.2"

DEPEND="${COMMON_DEPEND}
	dev-util/intltool
	sys-devel/gettext"

RDEPEND="${COMMON_DEPEND}
	x11-themes/gnome-themes-standard
	>=x11-themes/adwaita-icon-theme-3.14.1"

src_prepare() {
    eapply_user
	vala_src_prepare
    eautoreconf
}

src_configure() {
    econf
}

src_install() {
    emake DESTDIR="${D}" install
	insinto /etc/lightdm
	doins "${FILESDIR}"/slick-greeter.conf
}

pkg_postinst() {
    gnome2_pkg_postinst
}
