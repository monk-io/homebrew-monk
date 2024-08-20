class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.13.1"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.13.1.tar.gz"
  sha256_x64 = "e4abbe1d36c136218107f405c5e9f197ba8d74a9b7784ef19da3702009eae793"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.13.1.tar.gz"
  sha256_arm64 = "0366052862df34e92ee67757d9762d339c0f2591ad9e8322c00a4b366972bdca"

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
