class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.15.10"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.15.10.tar.gz"
  sha256_x64 = "e702e3fc7ac17aaf7b4da586b01631508343242f1752c6826ca9184b841323b3"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.15.10.tar.gz"
  sha256_arm64 = "998f02f3a8ad7165c3ebdd990861c43fa9a59dcf3f6ef69e635e42e2f98a52a7"

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
