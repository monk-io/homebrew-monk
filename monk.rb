class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.15.18"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.15.18.tar.gz"
  sha256_x64 = "9357a7bd3747b5dba282317cda62fdaa4b0d31120555350fd2560d32d4dcd78a"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.15.18.tar.gz"
  sha256_arm64 = "5560f85be2e8ca4f5f901e062b9ec020dd58ed03850b19d2ef831d809d6afbb9"

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
