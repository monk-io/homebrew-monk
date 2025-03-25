class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.15.15"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.15.15.tar.gz"
  sha256_x64 = "8e6587511873b1e3924d04699ccbcc36109a054e045660f4555c4635e895c83d"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.15.15.tar.gz"
  sha256_arm64 = "20e4b2870c5ee6686beaeb1c9fc1e3c948cea276572f5e73267337f637e53717"

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
