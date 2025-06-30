class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.17.0"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.17.0.tar.gz"
  sha256_x64 = "aae99f03a5c964c263f091abe2f5f330c2361d3f8857085c4a2a73388cd08615"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.17.0.tar.gz"
  sha256_arm64 = "7cd3fe092a2550da0c23643e4ecb18b46c748aae4bd84b041cb684fce012c504"

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
