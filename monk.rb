class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.16.3"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.16.3.tar.gz"
  sha256_x64 = "49b1f668c21237d364f3b801b9a1f8597416d2f16265df1073e0deaa9b1cb29e"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.16.3.tar.gz"
  sha256_arm64 = "34b826badac5fa00e850494deb15a4bd1658d7628c200091d564f7da46cc852e"

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
