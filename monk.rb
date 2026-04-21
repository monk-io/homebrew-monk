class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.20.3"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.20.3.tar.gz"
  sha256_x64 = "28131f187816913b839e7979a968d57a604b68784a95e6a5bc9e2b87839618ba"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.20.3.tar.gz"
  sha256_arm64 = "aa9a741c4300b7661b6b4191e5e6a5a6a301a7ace5289c39381441d79e8dde31"

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
