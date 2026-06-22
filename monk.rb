class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.20.9"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.20.9.tar.gz"
  sha256_x64 = "cdb2a8994095f9b092694ed3dea4389c3cc94aeb6e05437cd43f5575da907ef7"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.20.9.tar.gz"
  sha256_arm64 = "4d59fa939bce58b200a16c62cdba6230b13fb7fcd063d0db7027be1465c2032f"

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
