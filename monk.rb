class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.11.8"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.11.8.tar.gz"
  sha256_x64 = "7df7510a7ce65adedff74dd451d3091d6b0edf020503eda2bd3d743d2e61fe02"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.11.8.tar.gz"
  sha256_arm64 = "581f53ffbe75d4f28c7707f591ece6e467edb673c63fd68ad7389d59a91b12da"

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
