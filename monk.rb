class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.20.1"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.20.1.tar.gz"
  sha256_x64 = "5213c8148ae7ab01db79c34c075ec500e6b93a81586892d44c77852a1b80fcc7"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.20.1.tar.gz"
  sha256_arm64 = "3ab8c1b256ff60bb2a42a8720bc2a26e83c1e8b2314357b1cb93423d040d37cf"

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
