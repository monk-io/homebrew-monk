class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.15.1"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.15.1.tar.gz"
  sha256_x64 = "a7e6adb0eed7f6eaf2bd9633e5f8ab8d0d00a8eadf0507c2c69b047eba7520cf"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.15.1.tar.gz"
  sha256_arm64 = "279f2ff120e3136ec4322de7aa3a6e370101849ef03f6315289c6c3caad8fb92"

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
