class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.12.8"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.12.8.tar.gz"
  sha256_x64 = "079aaaf5864b6765754527a70c501f75889ea7c8461f0bf3343662f2b3809653"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.12.8.tar.gz"
  sha256_arm64 = "4aef31d4de76466e55d2730d5495c7701ffb17cbe18ceb43b817a057c44fecc7"

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
