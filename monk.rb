class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.18.3"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.18.3.tar.gz"
  sha256_x64 = "08a27d626c992821955534f8ad2b90db8d07c0e9d400ad69932c8aadef0521fd"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.18.3.tar.gz"
  sha256_arm64 = "c216fbd9aa3b1202d9e98500fdd0ea8e1e6294411a5a3681cfe345f237f757c9"

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
