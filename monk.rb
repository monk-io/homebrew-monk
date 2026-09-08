class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.21.4"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.21.4.tar.gz"
  sha256_x64 = "f4366506618fa07923fe2dec3aeda003f74931f99f7a9222648996646badce3a"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.21.4.tar.gz"
  sha256_arm64 = "9bc28d654e4a2062772ce8cab5dc6fdea91ca5288af8faf94360191a89897c69"

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
