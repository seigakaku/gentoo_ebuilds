# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
#
EAPI=8

inherit git-r3

DESCRIPTION="simple self-hosted, drop-in replacement for gpodder/mygpo"
HOMEPAGE="https://github.com/oxtyped/gpodder2go"
LICENSE="AGPL-3"

EGIT_REPO_URI="https://github.com/oxtyped/gpodder2go.git"
if [[ ${PV} == "9999" ]]; then
	GIT_ECLASS="git-r3"
	SRC_URI=""
else
	SRC_URI="https://github.com/oxtyped/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi
SRC_URI="${SRC_URI}
	     https://github.com/seigakaku/gentoo_ebuilds/releases/download/${PN}-${PV}/${PN}-vendor-${PV}.tar.xz"

SLOT="0"
KEYWORDS=""
DEPEND=""

RDEPEND="${DEPEND}"

BDEPEND="dev-lang/go dev-db/sqlite acct-group/gpodder2go acct-user/gpodder2go"

DATA_DIR="/usr/share/${PN}"

src_prepare() {
	tar -xvf "${DISTDIR}/${PN}-vendor-${PV}.tar.xz" -C "${S}"
	default
}

src_compile() {
	go build -o gpodder2go main.go
}

src_install() {
	dobin gpodder2go

	insinto "${DATA_DIR}"
	doins -r migrations migrations

	initfile="${FILESDIR}/${PN}.init"
	[[ -f "${FILESDIR}/${PN}.init-${PV}" ]] && initfile="${initfile}-${PV}"
	sed -e "s|@_DATA_DIR_@|${DATA_DIR}|g" "${initfile}" | newinitd - "${PN}"

	conffile="${FILESDIR}/${PN}.conf"
	[[ -f "${FILESDIR}/${PN}.conf-${PV}" ]] && conffile="${conffile}-${PV}"
	newconfd "${conffile}" "${PN}"
}
