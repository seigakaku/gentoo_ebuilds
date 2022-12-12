# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
#
EAPI=8

inherit git-r3

DESCRIPTION="simple self-hosted, drop-in replacement for gpodder/mygpo"
HOMEPAGE="https://github.com/oxtyped/gpodder2go"
EGIT_REPO_URI="https://github.com/oxtyped/gpodder2go.git"
LICENSE="AGPL-3"
SLOT="0"
KEYWORDS=""
DEPEND=""

RDEPEND="${DEPEND}"

BDEPEND="dev-lang/go dev-db/sqlite acct-group/gpodder2go acct-user/gpodder2go"

DATA_DIR="/usr/share/${PN}"

src_prepare() {
	tar -xvf "${FILESDIR}/${PN}-${PV}-vendor.tar.xz" -C "${S}"
	default
}

src_compile() {
	go build -o gpodder2go main.go
}

src_install() {
	dobin gpodder2go

	insinto "${DATA_DIR}"
	doins -r migrations migrations

	sed -e "s|@_DATA_DIR_@|${DATA_DIR}|g" "${FILESDIR}/${PN}.init-${PV}" | newinitd - "${PN}"
	newconfd "${FILESDIR}/${PN}.conf-${PV}" "${PN}"
}
