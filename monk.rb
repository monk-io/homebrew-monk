class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.11.12"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.11.12.tar.gz"
  sha256_x64 = "da5bd6d745e07e1c6c3ed0eb7e0d76a6c65aabfc74433e01973941d05e3dec06"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.11.12.tar.gz"
  sha256_arm64 = "901b77e4bd6f29519333cddb8ca7a6776c06bec048a73352954e8ed8cfe42dbb"

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
