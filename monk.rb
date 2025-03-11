class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.15.11"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.15.11.tar.gz"
  sha256_x64 = "46ad4631523b458308427d06655abd875a825c02ca01d7e05c575431c863c5ff"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.15.11.tar.gz"
  sha256_arm64 = "fdf400faea70392bb807768b24e5fc992a35943428daef2ebba973cad30a49d1"

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
