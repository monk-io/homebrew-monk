class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.15.5"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.15.5.tar.gz"
  sha256_x64 = "e5d1df601eb585a8fc72d736256132fce86994ed8cb4de374f5b74208db954b5"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.15.5.tar.gz"
  sha256_arm64 = "b12d80e17e526998713bc474994dd6dafac550e74216f7ade80d7e6f2b48606c"

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
