class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.21.6"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.21.6.tar.gz"
  sha256_x64 = "7560d90b0a9baa9b47d4cc763e18244ec53ff2a16498df40d101acf4a0f6a8ba"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.21.6.tar.gz"
  sha256_arm64 = "e10652af5c8d64e104998ee98c3458daf24baeca5ccd7cf71b478413d4dc7315"

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
