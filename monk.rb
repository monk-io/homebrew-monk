class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.15.7"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.15.7.tar.gz"
  sha256_x64 = "eb7e5dc0ffeafc75a44fd81a0a34174d01d20ec828b1c0bd0db7db3f3dc54821"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.15.7.tar.gz"
  sha256_arm64 = "ad45c8ee1d1255e8edc2ee874734e2a81c9a8614d6cbbb6e18552a796edc6b3b"

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
