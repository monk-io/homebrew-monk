class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.11.9"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.11.9.tar.gz"
  sha256_x64 = "9ad04adbf26886c2edaa2d0132a115445554f8ce89251cbc99b24f38409e3369"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.11.9.tar.gz"
  sha256_arm64 = "2e63c1dbf803ce67a0d273ba9f9cc0afd9feef051d41943e5e5e0852cb698134"

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
