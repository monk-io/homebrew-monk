class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.21.5"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.21.5.tar.gz"
  sha256_x64 = "56efcb7d582335062b029701159f95aa48f4f0a9d4fad25e9e872280ecd93866"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.21.5.tar.gz"
  sha256_arm64 = "b9485f90a63fcc5f22f269e8e39b3fe17e11ca45a90c8abfb032eedc0644736c"

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
