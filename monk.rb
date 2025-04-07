class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.16.0"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.16.0.tar.gz"
  sha256_x64 = "6e4ea1d150ff28c3c4e466c7bcfd33038810b243f312a01dd60ef7f448a1f35f"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.16.0.tar.gz"
  sha256_arm64 = "58bfd46e88c44ec51aaa9543d25f836c53117d6ae4ac6ec3a43add7acb06040e"

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
