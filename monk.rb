class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.12.13"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.12.13.tar.gz"
  sha256_x64 = "89fab0db44e415688c7aef604515c0b07be792edd4022ee6c971f94e908df169"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.12.13.tar.gz"
  sha256_arm64 = "421822b26d9509dd8afaabca914d19ef58b04606e11a20642dc59ce753382648"

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
