class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.17.7"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.17.7.tar.gz"
  sha256_x64 = "569f73eeae555879923fbdc2c9a22f78f25c3e2a7ac2ad1dac1c9e427c4aec6f"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.17.7.tar.gz"
  sha256_arm64 = "be12e19318f25624deeefa90a35a2d8250b85e96a6c60444815f1a9c56e806c9"

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
