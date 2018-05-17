# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{4,5,6} )

inherit distutils-r1 versionator gnome2-utils

TRUNK_VERSION="$(get_version_component_range 1-2)"
DESCRIPTION="lightdm-gtk-greeter setting utility"
HOMEPAGE="https://launchpad.net/lightdm-gtk-greeter-settings"
SRC_URI="
	https://launchpad.net/lightdm-gtk-greeter-settings/${TRUNK_VERSION}/${PV}/+download/lightdm-gtk-greeter-settings-1.2.2.tar.gz
	"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="
	dev-util/gtk-update-icon-cache
	x11-misc/lightdm-gtk-greeter
	dev-python/pygobject[${PYTHON_USEDEP}]
	dev-python/python-distutils-extra
	"
python_prepare_all() {
	distutils-r1_python_prepare_all
}

python_install_all() {
	distutils-r1_python_install_all
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
