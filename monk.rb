class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.11.7"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.11.7.tar.gz"
  sha256_x64 = "d4140855f27d04bb727e07a5a4de2df204b73003ce0001071933bd84ff2dc05d"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.11.7.tar.gz"
  sha256_arm64 = "d27dc753d2cf8d99b783bab23e60296d27c9c03ae6a7760718495b324c2f27fa"

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
