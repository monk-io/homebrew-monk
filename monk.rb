class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.21.4"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.21.4.tar.gz"
  sha256_x64 = "7c044a877c9d99156f0eb8212ba54147ff8000148b090b197dc61b2a6cbf1e09"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.21.4.tar.gz"
  sha256_arm64 = "c06587fbc745538a1e8260b97c4f301ebf75d83565bcb3e16393c1f03f00c493"

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
