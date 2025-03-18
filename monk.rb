class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.15.12"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.15.12.tar.gz"
  sha256_x64 = "4aef5355beccc3c054325a70b7b612de6cfb9f21d9714209d889cf55d864eb64"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.15.12.tar.gz"
  sha256_arm64 = "04ede19679c64b0854ef86ab61d353f9dc65f9f05baf252473dde312099991cc"

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
