class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.18.13"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.18.13.tar.gz"
  sha256_x64 = "01ed77eec8f97b8da2447337eb3f1f34d6bb034e285c2154ac916494506ae621"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.18.13.tar.gz"
  sha256_arm64 = "11fc1366cde488f0766e39f9c0f16db6faa8915fe3d2b319f3196041a902adf9"

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
