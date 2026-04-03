class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.20.0"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.20.0.tar.gz"
  sha256_x64 = "260f05bca4f7e7f613b489d0756136c0003d511a89dc76232b8d0f45b98a950b"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.20.0.tar.gz"
  sha256_arm64 = "59f13e7cb9ada79e1f6ff3800bd7b1f085c92c71c89878f1056d4035481da79f"

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
