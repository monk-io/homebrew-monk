class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.21.0"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.21.0.tar.gz"
  sha256_x64 = "ca99f8a3aad485dd581d8f1ae913b61def390f6c9f32b941f4d308c62862aa4e"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.21.0.tar.gz"
  sha256_arm64 = "270aff89c46ebd902562a7e78669512f43da85a0ad0221e8e79f725b4f1cd036"

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
