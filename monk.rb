class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.16.5"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.16.5.tar.gz"
  sha256_x64 = "18cdd74c630e6644b4dc6af3363f085bbdabdab4f9500b9c549a9195be8ff136"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.16.5.tar.gz"
  sha256_arm64 = "f754e733fc1bbca2d4e0cb95112549af3f7f1c698b13b3c6b0baf5a9179dcd34"

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
