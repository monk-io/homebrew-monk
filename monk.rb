class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.21.4"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.21.4.tar.gz"
  sha256_x64 = "476ed0271fd45c49e5a9772f8beeeb63c5b7a5762bf18a03cf577592bee80f4b"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.21.4.tar.gz"
  sha256_arm64 = "738deb9c1e6d9be42ea1a144c1eb14d73b5ab5cdd27dfeb2986857374d8b3126"

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
