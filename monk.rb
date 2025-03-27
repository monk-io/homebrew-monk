class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.15.17"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.15.17.tar.gz"
  sha256_x64 = "7abcdecf58667e0aa0b981abe1e42b23c2bb5c52032aff88005ade1af41b5471"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.15.17.tar.gz"
  sha256_arm64 = "7182c2a7ad50013503006ed69315af4ac56b4a6019d1383980ed81139df9f85e"

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
