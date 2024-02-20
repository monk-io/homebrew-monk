class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.12.11"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.12.11.tar.gz"
  sha256_x64 = "f14ac7f0b79f3252acb04d03504793a19dad022b09b290833c84b342135bdfb0"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.12.11.tar.gz"
  sha256_arm64 = "3d90cca06375ca390a66a40c75a7dd8672b745d6f32e6c435d89a6e154974811"

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
