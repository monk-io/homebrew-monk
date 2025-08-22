class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.17.5"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.17.5.tar.gz"
  sha256_x64 = "e6c4e99bc37be081fd46ac42912906ffdd3ed11d18e83022aa947969746c5a33"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.17.5.tar.gz"
  sha256_arm64 = "ebc907880226668e7b67abc317ff0fa9db396ebebddb7fa7c884c77529bca958"

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
