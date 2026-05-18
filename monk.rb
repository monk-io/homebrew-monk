class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.20.5"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.20.5.tar.gz"
  sha256_x64 = "749537dc3241891050a1986d960fee26169adbbb2d8d5cbfa53da59cffa8e966"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.20.5.tar.gz"
  sha256_arm64 = "b0fb4e5dda0dd282f8e7f93feee13f542376fc2dcbc0fc166d0da3cc96d0779e"

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
