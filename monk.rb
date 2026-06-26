class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.20.10"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.20.10.tar.gz"
  sha256_x64 = "a558e04c80c3d0c5d17ea6a5ce31cc54a635dbfe8093778f7594c5eb889cb6cc"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.20.10.tar.gz"
  sha256_arm64 = "4e9c9ddea97a9985cb3d7ddfa78d447c0007e75b13f6a4be653dbd5a8d970da3"

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
