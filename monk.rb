class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.18.8"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.18.8.tar.gz"
  sha256_x64 = "d5d97d86e96d6109438239b9b103dce4d0a579f5a9912e449a1549f91eca108f"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.18.8.tar.gz"
  sha256_arm64 = "a7949b1c3e685f610b8cdfec067989fe2de5384907c3cdd4b1929822eaf7b708"

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
