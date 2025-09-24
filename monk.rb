class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.17.10"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.17.10.tar.gz"
  sha256_x64 = "11bc9b4b911e444ba1319855e45ee6262c03b21e3731cf18140e600d5b4ce1a8"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.17.10.tar.gz"
  sha256_arm64 = "07ab4345bbe0a2fc1bfb2439d839c0d0ad4778218f8f4057bfc0d3d27141493d"

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
