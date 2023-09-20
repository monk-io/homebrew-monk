class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.11.11"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.11.11.tar.gz"
  sha256_x64 = "c9bf68130adae027b15c4a894fb6cd9a033e068abbddf88f9c647ad29eca44e5"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.11.11.tar.gz"
  sha256_arm64 = "a9d7868e17105ec186fae770f3a97eeaccd1e40b59b0b88e646e4e9c70d09768"

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
