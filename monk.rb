class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.16.6"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.16.6.tar.gz"
  sha256_x64 = "eda2ef65445e91ab3c217eb9e1f55ef0de892383d18f2c696787ff299612f898"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.16.6.tar.gz"
  sha256_arm64 = "f45054c2b5ada6108263a4a44ea5b614b05bc185c89e64a24c3ffbe8d3736f51"

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
