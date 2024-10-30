class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.14.1"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.14.1.tar.gz"
  sha256_x64 = "6ec24c006efdee5731ea68b3a7c22bc9c534c837fe26b21b40dfcfacd1ea2e4e"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.14.1.tar.gz"
  sha256_arm64 = "3cec9e3da23ef272dd7da3ed9c3c771dfb4e28ed9b3efc4bfd38d53f5301f938"

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
