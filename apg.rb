class Apg < Formula
  desc "Tool set for random password generation."
  homepage "https://fossies.org/linux/privat/old/apg-2.2.3.tar.gz/"
  url "https://fossies.org/linux/privat/old/apg-2.2.3.tar.gz"
  version "1.0.0"
  sha256 "69c9facde63958ad0a7630055f34d753901733d55ee759d08845a4eda2ba7dba"

  def install
    puts "#{ENV.cc}"
    puts "#{ENV.cflags}"

    system "make", "standalone",
                   "CC=#{ENV.cc}",
                   "FLAGS=#{ENV.cflags}",
                   "LIBS=", "LIBM="

    bin.install "apg", "apgbfm"
    man1.install "doc/man/apg.1", "doc/man/apgbfm.1"
  end

  test do
    system bin/"apg", "-a", "1", "-M", "n", "-n", "3", "-m", "8", "-E", "23456789"
  end
end
