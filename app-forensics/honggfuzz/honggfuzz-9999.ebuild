# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 toolchain-funcs

DESCRIPTION="A general purpose fuzzer with feedback support"
HOMEPAGE="https://honggfuzz.dev/"
EGIT_REPO_URI="https://github.com/google/${PN}"

LICENSE="Apache-2.0"
SLOT="0"
IUSE="clang"

RDEPEND="
	>=sys-libs/binutils-libs-2.29:=
	sys-libs/libunwind:=
	app-arch/xz-utils
	clang? ( sys-libs/blocksruntime )
"

DEPEND="${RDEPEND}
	elibc_musl? ( sys-libs/queue-standalone )"

DOCS=(
	CHANGELOG
	COPYING
	CONTRIBUTING.md
	README.md
)

PATCHES=(
	"${FILESDIR}"/${PN}-2.6-no-werror.patch
	"${FILESDIR}"/${PN}-2.6-soname.patch
)

pkg_pretend() {
	if tc-is-clang; then
		use clang || die "${P}: to use clang enable USE=clang for ${P} (bug #729256)."
	fi
}

src_prepare() {
	default
	tc-export AR CC
	export CFLAGS
	export LDFLAGS
}

src_install() {
	dobin ${PN}
	dobin hfuzz_cc/hfuzz-cc
	dolib.so libhfuzz/libhfuzz.so

	einstalldocs
}
