class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.11.2"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.11.2.tar.gz"
  sha256_x64 = "d15f14b680065a0006e8e0e3ae618f683605b305a095cb28c6cae3b3b1168b15"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.11.2.tar.gz"
  sha256_arm64 = "18a0b027b5afd930c15eae6bcd65084307053d17947ad039539c613b05af5dad"

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
