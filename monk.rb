class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.17.8"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.17.8.tar.gz"
  sha256_x64 = "473c25200e3bc366e82ebfdcf34332ed98f75fe1e5c340cddf5504675af172d9"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.17.8.tar.gz"
  sha256_arm64 = "13f0a40bea96be2ec632cc3302a30138b3085606f8ca2d4f1c1d3511f1ce2bf3"

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
