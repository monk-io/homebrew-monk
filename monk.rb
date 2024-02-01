class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.12.9"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.12.9.tar.gz"
  sha256_x64 = "8df99ce1555a9f8a9fee98a05eaff86ad67b84087a3b4b7707a2f71372826d45"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.12.9.tar.gz"
  sha256_arm64 = "fa37a2c550dcf825c0487e7e9ac9dcd6b088fa8a3d580bbfb92d296e4964a1ab"

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
