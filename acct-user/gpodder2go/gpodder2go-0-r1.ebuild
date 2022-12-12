# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="gpodder2go program user"
ACCT_USER_ID=50
ACCT_USER_GROUPS=( gpodder2go )
ACCT_USER_HOME="/dev/null"
ACCT_USER_SHELL="/sbin/nologin"

acct-user_add_deps

SLOT="0"
