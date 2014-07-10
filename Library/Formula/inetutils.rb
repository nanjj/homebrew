require 'formula'

class Inetutils < Formula
  homepage 'http://www.gnu.org/software/inetutils'
  head 'git://git.savannah.gnu.org/inetutils.git'

  depends_on 'autoconf' => :build if MacOS.xcode_version.to_f >= 4.3

  def install
    system "autoconf", "-v"
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking", "--with-conf=#{config_file}"

    system "make"
    system "make install"

  end

end
