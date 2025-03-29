class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.15.19"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.15.19.tar.gz"
  sha256_x64 = "ef6ae8750fdf95a6a83c1d7cb35e6718fa76974eb7d947cf539fc6ccbed20f91"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.15.19.tar.gz"
  sha256_arm64 = "c5032014aa210868bda78b462829a14ee6b0fb560c72f85249a8796875f5f255"

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
