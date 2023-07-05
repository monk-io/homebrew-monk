class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.11.4"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.11.4.tar.gz"
  sha256_x64 = "8fe91840fa70ca1662ea19b7dac3d3771ccae172fafa61fba3d9e0cbbf480025"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.11.4.tar.gz"
  sha256_arm64 = "a7380f2016848deee5413c23fe1f5d1bdd7b09d89e804a569d57b3d92e143f03"

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
