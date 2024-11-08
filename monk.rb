class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.14.3"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.14.3.tar.gz"
  sha256_x64 = "d13d0248659217a46b093930fc9370d5e365ed07b0a7de1a2e96bf3a4964c5f0"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.14.3.tar.gz"
  sha256_arm64 = "44edea7a15cc375d6a998d418ad60879017eedda2ed81763475fc46d3bb8d819"

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
