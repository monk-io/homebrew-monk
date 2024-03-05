class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.12.12"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.12.12.tar.gz"
  sha256_x64 = "3d471c174f2ee1a77c3f82ae2614b99453e4cb0d200987910a2b109e67b447b8"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.12.12.tar.gz"
  sha256_arm64 = "bf39d07b60ba04fa5f162cfc71211e69dcc6cf524748e981c73986893ecd9ff4"

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
