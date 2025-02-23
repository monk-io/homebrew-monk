class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.15.8"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.15.8.tar.gz"
  sha256_x64 = "b98f46d20029fdc6b64b53da9628d242610bfeeb72694a8b414c79775b8c3586"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.15.8.tar.gz"
  sha256_arm64 = "e8ce79a12c53716b92621ba4c54e4de85bfe78a3681e5fc110952059b18e8769"

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
