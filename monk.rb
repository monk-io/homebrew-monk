class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.11.14"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.11.14.tar.gz"
  sha256_x64 = "31d128c293ff7aa5aa99153503d91e50806e3f5f2fe1a1b9a52ad3bac8fa2308"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.11.14.tar.gz"
  sha256_arm64 = "1135cf910bbc2f4b453a6ba6211f05c13f2d3bc581f8bc454a8f8b805f99881b"

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
