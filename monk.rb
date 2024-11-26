class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.14.5"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.14.5.tar.gz"
  sha256_x64 = "31c0a0a194f38222c736e235ef96c7e69388a9812ceec1584f2334de83aa6119"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.14.5.tar.gz"
  sha256_arm64 = "4ed56187d3f3852db756290acb65f4c8a58f0ef2aa93d185dabc4417658af3ed"

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
