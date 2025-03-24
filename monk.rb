class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.15.14"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.15.14.tar.gz"
  sha256_x64 = "e3e4e0c386b92d2f7d2a79d9168877842b72de7b53af681aec7a0a54906e39d8"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.15.14.tar.gz"
  sha256_arm64 = "d25d12a6f0dfcc3ffbf0dee324c02f5d58b5955de2f57b51638df2bef82072d4"

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
