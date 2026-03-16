class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.19.0"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.19.0.tar.gz"
  sha256_x64 = "f816abf521769999269416c63aa9471458dc38231908c740492cc015d149df68"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.19.0.tar.gz"
  sha256_arm64 = "196fd104e35797d40d1797e148521d7c4c7fe441133941ffbb0d7d7e266af1a9"

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
