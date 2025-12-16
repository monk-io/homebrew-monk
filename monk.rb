class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.18.6"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.18.6.tar.gz"
  sha256_x64 = "fdb97b3c2d8819d5859cdde9c988c169d4fbe7f6fc60041d93081978a184090e"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.18.6.tar.gz"
  sha256_arm64 = "539c991d34c56fdf3dd904af8d18dddaae64f38fb95295e2a8336c5c00e06e58"

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
