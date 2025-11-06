class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.18.1"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.18.1.tar.gz"
  sha256_x64 = "b8940b9674144ed748237ae46818535b5fe5187722148e4e18aa539dcf921f2b"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.18.1.tar.gz"
  sha256_arm64 = "92846a51a5623378b483d5bacc058bd420c1cbc0fdf0fbfed69788e0eec605f7"

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
