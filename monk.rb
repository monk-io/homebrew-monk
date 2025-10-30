class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.18.0"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.18.0.tar.gz"
  sha256_x64 = "6e6aaa5e9374c0ca356dd38e58121925af5855dbdfa9b7f31a17c5bf4b8ef5cd"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.18.0.tar.gz"
  sha256_arm64 = "02090e1e54042b7160bcfb4c7fce98ac4a44b5f0d7f703cf2b77441c1b284f8b"

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
