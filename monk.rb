class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.20.6"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.20.6.tar.gz"
  sha256_x64 = "de5de83c264897451ebc1b22ba8ea2b9c541c754e6d0a04710d94cbe0acc10c0"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.20.6.tar.gz"
  sha256_arm64 = "7cd039076339a5a77a6eed75d0c374a92242ddfe3b82b4dacee405b34574df08"

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
