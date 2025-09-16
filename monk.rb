class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.17.9"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.17.9.tar.gz"
  sha256_x64 = "97a8cafc2c4862e39f7f20759bf0a69a87982cbc74c5f7ad09d100d4f2b7424a"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.17.9.tar.gz"
  sha256_arm64 = "54b920b0e50855b61bb2607ed447189fa397589e3e63f520251a421477447fb7"

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
