class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.20.8"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.20.8.tar.gz"
  sha256_x64 = "a280923dcba11dca2f456712f914d47c2e58971d8b7de9e0391d6045575f263d"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.20.8.tar.gz"
  sha256_arm64 = "5b5834d5fb3764ce8014bc1777b5e22ec3de8c8a2cc7921809f1bc1244d0e7ea"

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
