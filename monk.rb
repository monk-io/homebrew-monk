class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.9.0"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.9.0.tar.gz"
  sha256_x64 = "8bef10fe78fa228e8c80eb80860b28fe8e498799c3a258efe6826501fd1ade42"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.9.0.tar.gz"
  sha256_arm64 = "e517524027cff6c84ee97e10bbe53db5f61b38d82f96c6fad4e854885b32003b"

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

    Upgrade monk daemon inside the machine machine to the latest version
      monk machine upgrade
    EOS
  end
end
