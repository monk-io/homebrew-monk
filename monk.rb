class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.14.4"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.14.4.tar.gz"
  sha256_x64 = "b0f9586a872afa4fcc2d4892dbc731d85a66edc5f7d43a659bf48a4e32114437"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.14.4.tar.gz"
  sha256_arm64 = "b21e1f0068d533650edf41bddd96d05736923a80f2a8f28f04740f18ae0876c4"

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
