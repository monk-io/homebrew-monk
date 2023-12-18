class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.12.6"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.12.6.tar.gz"
  sha256_x64 = "d4dc13c347e5618fe2e78acb1f9ffb783d47ace6bc16b0cb907d6e008d364b32"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.12.6.tar.gz"
  sha256_arm64 = "01fc9181c0dcf123f490439803e5afae1bf33df8bc77f05f37db3c91528aa2b3"

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
