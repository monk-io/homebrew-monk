class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.15.0"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.15.0.tar.gz"
  sha256_x64 = "a6f5e77b61911b9f3be6b06a4ee81ffb0ff51861e97fd811ae4342879b54be86"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.15.0.tar.gz"
  sha256_arm64 = "c8952934625aea48738b4d6436f25a29b34ac558eaeeb7a498a5321eb4ba6ec6"

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
