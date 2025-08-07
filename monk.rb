class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.17.3"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.17.3.tar.gz"
  sha256_x64 = "128ed084e5dc257cc4682271448f1283132f56758b0885b1c09e9e395a715517"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.17.3.tar.gz"
  sha256_arm64 = "6097488e621219f201be2f818dbb1c4da8752cc093e56708237f9fbc611c0f6b"

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
