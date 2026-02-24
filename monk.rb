class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.18.17"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.18.17.tar.gz"
  sha256_x64 = "94c100c449746e6969814bf9677b80d51cac886915cb70ceef17052940394f68"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.18.17.tar.gz"
  sha256_arm64 = "3d745ba850712c633e41f74bdc1f4c68bed40135de0ef0e5c0a0d066504a0f43"

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
