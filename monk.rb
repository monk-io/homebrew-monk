class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.21.1"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.21.1.tar.gz"
  sha256_x64 = "6165c458c9b1adbd4a0386fc7aee7ae37bd3cdf79b7325d60b8f70857d70906d"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.21.1.tar.gz"
  sha256_arm64 = "b39604c706e5bd99e69c9c211d5dd48e35f65d1c470c802d363e0f2e3fa8096d"

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
