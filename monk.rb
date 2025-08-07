class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.17.4"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.17.4.tar.gz"
  sha256_x64 = "02dbe3f9c32004082aaf177c96a2d4f748eafb99c9abddeed63338937808e6bc"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.17.4.tar.gz"
  sha256_arm64 = "cb85ab7a820a4ec9cab33db3ed2b15f82666de191ec52dcc3c8d669903e942bc"

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
