# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-group

DESCRIPTION="Group for the 1Password password manager"
KEYWORDS="alpha amd64 arm arm64 hppa loong ~m68k mips ppc ppc64 riscv s390 sparc x86 ~arm64-macos ~x64-macos ~x64-solaris"
# Needs to be higher than 1000, from previous issues.
ACCT_GROUP_ID=1010
