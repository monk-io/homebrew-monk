class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.15.16"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.15.16.tar.gz"
  sha256_x64 = "55bb5a0728c739c1bfd978d1bf51264aba053ac05504bad7d6d31d5c7d507bf2"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.15.16.tar.gz"
  sha256_arm64 = "728e41aeb9f1b88c0336e259917733c7ceda90f5cd8e22e2049300bbe3a15b9f"

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
