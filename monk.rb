class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.15.3"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.15.3.tar.gz"
  sha256_x64 = "1cc9fa70c2d163395bf6d677422f547c6041b8c22c9680393c1023659f8c0ded"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.15.3.tar.gz"
  sha256_arm64 = "18db015d7c515c230306110e65d514010faf3113015909aa6cb594c57e8951e0"

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
