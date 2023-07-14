class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.11.5"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.11.5.tar.gz"
  sha256_x64 = "4a10a39083af96814b5d61d7ab9538cf52ae90f020cbb6df0e31520ca8a5d2c4"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.11.5.tar.gz"
  sha256_arm64 = "f23dac216cad1b65b3431146c942dc6ff44bc2802bcdf4cc4221faccbb54e685"

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
