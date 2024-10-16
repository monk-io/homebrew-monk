class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.14.0"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.14.0.tar.gz"
  sha256_x64 = "95d49d12f034d7e1213e26696844d03e3a8eadf2a65e44ca8452d88a4b9fefd1"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.14.0.tar.gz"
  sha256_arm64 = "61026f122b864651bac95fa365de603fe4696a3a9670611524625b343a22a68d"

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
