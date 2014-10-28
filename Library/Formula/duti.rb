require "formula"

class Duti < Formula
  homepage "http://duti.org/"
  head "https://github.com/moretension/duti.git"
  url "https://github.com/moretension/duti/archive/duti-1.5.2.tar.gz"
  sha1 "1833c0a56646a132fa09bcb31c557d4393f19a3b"

  depends_on "autoconf" => :build

  # Fix for hardcoded SDK paths. See https://github.com/moretension/duti/pull/7
  if MacOS.version == :yosemite
    patch do
        url "https://github.com/moretension/duti/pull/7.patch"
        sha1 "6bbdba1cb3cbfe5aad9c0560046216c68112f6e8"
    end
  end

  def install
    system "autoreconf", "-vfi"
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/duti", "-x", "txt"
  end
end
