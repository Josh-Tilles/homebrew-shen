class Shen < Formula
  desc "A sufficiently advanced lisp"  # TODO give credit to deech, or change description
  homepage "http://www.shenlanguage.org/"
  # url "http://www.skynet.ie/~poldy/Shen-SBCL-OSX.zip"
  # url "https://github.com/Shen-Language/shen-sources/archive/shen-19.2.tar.gz"
  url "http://www.shenlanguage.org/Download/Shen.zip"
  version "19.2"
  sha256 "14e5b977701dace10c00200a29e5c54b00edcbd56532c66df8c286d3b1889890"

  depends_on "sbcl"

  def install
    target_platform_dir = buildpath/"Platforms/SBCL"
    target_platform_dir.install Dir["KLambda/*.kl"]
    cd target_platform_dir do
      system "sbcl", "--load", "install.lsp"
      bin.install "Shen.exe" => "shen"
    end
    libexec.install Dir["*"]
  end

  test do
    raise "foo"
  end
end
