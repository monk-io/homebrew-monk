class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.11.0"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.11.0.tar.gz"
  sha256_x64 = "6cb536f54ae2d332d0ad8e3fa4f9f543a2fa7b49da892f0b99704ca9b3e1410c"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.11.0.tar.gz"
  sha256_arm64 = "6eec091b3d93978bb5678e4623b8c15b1535b4685a681d12878e170b2dc677b6"

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
