class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.15.4"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.15.4.tar.gz"
  sha256_x64 = "059c5e415faf83c0477f49bc47569fb35f1fc8eb3c5ab10bc44309c0ce21c2d3"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.15.4.tar.gz"
  sha256_arm64 = "ed663cb4e98bc255bd8d22c78350a114a2b6042f79a8f0d57f73156ccf04aae3"

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
