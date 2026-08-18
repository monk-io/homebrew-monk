class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.21.3"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.21.3.tar.gz"
  sha256_x64 = "6f3485226a29c42f53d90b8fe94d12bbc5336651dca4f5bc62e065e013a100d1"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.21.3.tar.gz"
  sha256_arm64 = "62a966244f6909177a6f59b503fa379d9023d39444f38e06e7eca395f1edd7e6"

  if Hardware::CPU.intel?
    sha256 sha256_x64
    url url_x64
  else
    sha256 sha256_arm64
    url url_arm64
  end

  depends_on "podman" => :recommended

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end

  def caveats; <<~EOS
    Initialize the monk machine with monk daemon inside
      monk machine init

    Upgrade monk daemon inside the monk machine to the latest version
      monk machine upgrade
    EOS
  end
end
