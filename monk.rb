class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.18.2"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.18.2.tar.gz"
  sha256_x64 = "d0723f0b8c9929bbe8f93a1609304d30f0f82683341ee6a223a1666552abec3e"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.18.2.tar.gz"
  sha256_arm64 = "e7919c1393e529b81fcdccf18f034b534456b6909f791875f55e59a6c632585f"

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
