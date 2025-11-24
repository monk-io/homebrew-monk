class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.18.4"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.18.4.tar.gz"
  sha256_x64 = "9702f68017bbef7e7b1990b2766f67f20dc7678861602e97bb9cacb5a6ae4ad2"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.18.4.tar.gz"
  sha256_arm64 = "34c15791c44404f9e8bef3912c01c0c161443eb1b7ab0a5bf5a2651d7b76094d"

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
