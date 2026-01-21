class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.18.9"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.18.9.tar.gz"
  sha256_x64 = "60aa173f0e6e5ecf1fc48b6f63109c2e04cb87ad8178c9ae992e2089e3298613"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.18.9.tar.gz"
  sha256_arm64 = "20846550910d0d946fad7fdba5de079d6dac2e1efab2b0b3375991c9eca8b147"

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
