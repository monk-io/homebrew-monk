class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.13.0"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.13.0.tar.gz"
  sha256_x64 = "28a2ac74e3238c84f4de507285ca5370c09c1645a42c1406519a8aca40bb7574"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.13.0.tar.gz"
  sha256_arm64 = "deb20610bb6b54fdc0800abba1443633d022c2f210529127f8e67319a1bffc68"

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
