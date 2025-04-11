class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.16.1"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.16.1.tar.gz"
  sha256_x64 = "d2b20d864754c409a7815ef101ae3f69ba6d319b2e5321a04bd6aab89fbe5acc"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.16.1.tar.gz"
  sha256_arm64 = "bf7f3964887378bff427d80fe11b3c0726e9afc39b59bd6ac4923d8f09a1a6c3"

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
