class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.12.4"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.12.4.tar.gz"
  sha256_x64 = "326a602b0821acee9c93c02f96be3cafa0bd8d5965f4ba262980397297cf900f"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.12.4.tar.gz"
  sha256_arm64 = "6129ca2d95ddbbcb4a2e0d5518aebd71947253f1bba12ae102536795afa2e102"

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
