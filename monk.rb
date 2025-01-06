class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.15.6"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.15.6.tar.gz"
  sha256_x64 = "36ba024f96306f9c939901b0e482f6cba11a02a61ee2b318612a0196ad1d4192"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.15.6.tar.gz"
  sha256_arm64 = "91c774072324c28cd9f08f8ce0c3866ac99ed9e5715920ed311ebc46e2327176"

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
