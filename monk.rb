class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.12.1"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.12.1.tar.gz"
  sha256_x64 = "4545de21ab76005284eaeb4814d4067ed28d0da9d91396c9de685fd35786abd5"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.12.1.tar.gz"
  sha256_arm64 = "e213ea0832167583e07271d4d7506bd094296b38377182b5e8c1df460190e0c1"

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
