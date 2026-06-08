class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.20.7"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.20.7.tar.gz"
  sha256_x64 = "240d2c0f8b1728f065f580ce6ecadfe47e665d2b3b56c6db834d5f6f61004387"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.20.7.tar.gz"
  sha256_arm64 = "97a262450f41354bd9b6e17507f440380bcafc55d0ec9a63067455dd11dba2aa"

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
