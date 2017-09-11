class YouGet < Formula
  include Language::Python::Virtualenv

  desc "Dumb downloader that scrapes the web"
  homepage "https://you-get.org/"
  url "https://github.com/soimort/you-get/releases/download/v0.4.900/you-get-0.4.900.tar.gz"
  sha256 "4206d6503d6038af0870ee551cc4bae1c3332829b4eb373e226eb2b1a4fb616b"
  head "https://github.com/soimort/you-get.git", :branch => "develop"

  bottle do
    cellar :any_skip_relocation
    sha256 "8a7e792966bc4f3a645149acc6ae4354a697e3bcb6618d2149b2ca7118b56cad" => :sierra
    sha256 "d0a9ef848bf69f9d6f861dd62aecef245450f293deaab3fe61a396906181329a" => :el_capitan
    sha256 "b0973b83f45db27add99302a5fe7e578c689fb3aa51851b5b76f5ea3ba4e5538" => :yosemite
  end

  depends_on :python3

  depends_on "rtmpdump" => :optional

  def install
    virtualenv_install_with_resources
  end

  def caveats
    "To use post-processing options, `brew install ffmpeg` or `brew install libav`."
  end

  test do
    system bin/"you-get", "--info", "https://youtu.be/he2a4xK8ctk"
  end
end
