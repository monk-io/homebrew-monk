class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.15.13"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.15.13.tar.gz"
  sha256_x64 = "ec5da0d1ee1ebf9927acd221e6bf48550aef14a35a2214b7f82a19bc08f1c9f2"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.15.13.tar.gz"
  sha256_arm64 = "a60a0412f28ef9052bb89f73b3c1f5a0cff542281dacaa51da7e52e4480c89ad"

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
