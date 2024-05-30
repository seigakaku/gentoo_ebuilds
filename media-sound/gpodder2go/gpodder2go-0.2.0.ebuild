# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
#
EAPI=8

inherit go-module

DESCRIPTION="simple self-hosted, drop-in replacement for gpodder/mygpo"
HOMEPAGE="https://github.com/oxtyped/gpodder2go"
LICENSE="AGPL-3"

SRC_URI="https://github.com/oxtyped/$PN/archive/v$PV.tar.gz -> $P.tar.gz"
SRC_URI="$SRC_URI https://github.com/seigakaku/gentoo_ebuilds/releases/download/$PN-$PV/$PN-vendor-$PV.tar.xz"

SLOT="0"
KEYWORDS=""
DEPEND=""

RDEPEND="$DEPEND"

BDEPEND="dev-lang/go dev-db/sqlite acct-group/gpodder2go acct-user/gpodder2go"

DATA_DIR="/usr/share/$PN"

src_compile() {
	go build -o gpodder2go main.go
}

src_install() {
	dobin gpodder2go

	initfile="$FILESDIR/$PN.init"
	[[ -f "$FILESDIR/$PN.init-$PV" ]] && initfile="$initfile-$PV"
	sed -e "s|@_DATA_DIR_@|$DATA_DIR|g" "$initfile" | newinitd - "$PN"

	conffile="$FILESDIR/$PN.conf"
	[[ -f "$FILESDIR/$PN.conf-$PV" ]] && conffile="$conffile-$PV"
	newconfd "$conffile" "$PN"
}
