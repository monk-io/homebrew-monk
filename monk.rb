class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.16.2"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.16.2.tar.gz"
  sha256_x64 = "af266175ad3d1874ee546604a24cb621ad31a545a4e8615b62ca8d6f9e2f3fd8"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.16.2.tar.gz"
  sha256_arm64 = "64eb51f9f8929b25284bcf15a4b765a82af8bdd0d4d90f05866ba849edf0cd6b"

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
