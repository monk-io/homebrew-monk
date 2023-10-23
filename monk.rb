class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.12.0"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.12.0.tar.gz"
  sha256_x64 = "58b55a5cfb5446937429def93698416ac390e3f821ca62e2f373d1594089b3f4"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.12.0.tar.gz"
  sha256_arm64 = "ad19804c0ba84d3bdefd7795441eeb2d296471e5cdaa85463f407240356d700e"

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
