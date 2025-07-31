class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.17.1"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.17.1.tar.gz"
  sha256_x64 = "da22137f56b4be6796a1f010e6384f57e88e75cfae5bc2a2a77e0e3bb4954f55"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.17.1.tar.gz"
  sha256_arm64 = "a2207e98591dac5a77e079abdf2e07d08e0c8bcc206ec5db18fbd001b7995c00"

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
