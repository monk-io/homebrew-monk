class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "4.0.1"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v4.0.1.tar.gz"
  sha256_x64 = "cd59e55a49a5509496151ca31a21c9df2bd0978073641e00e9fcbb3e5f45e2ac"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v4.0.1.tar.gz"
  sha256_arm64 = "3d05589bbf1b90291c7d3e4895929682bef2c046696a6b1cf88687c9202b85b3"

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
