class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.16.7"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.16.7.tar.gz"
  sha256_x64 = "0e3c287682ad92a683cbb4231c5ea0163262fd217094a4de5c9186f356186262"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.16.7.tar.gz"
  sha256_arm64 = "5fd2584110bd115412a9e98911715486edc3e2af182e7f5a09d8f0055e6f4c58"

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
