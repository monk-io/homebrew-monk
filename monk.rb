class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.18.18"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.18.18.tar.gz"
  sha256_x64 = "cb59d529b64fc2b32c503b52b6c976115df762cf50fb2db92e5ef55463d5e258"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.18.18.tar.gz"
  sha256_arm64 = "082230c117803053cc03b62cb232c304d067a7173a62f433889e4717cec525c6"

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
