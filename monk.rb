class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.12.10"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.12.10.tar.gz"
  sha256_x64 = "f5a8d052243f041b03059988154769fda0f160817dc20d5c888f5ab4e4bca106"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.12.10.tar.gz"
  sha256_arm64 = "fabec5d0161664a92ae6526526ce56edcbb071176dd6371008ac34420703cea0"

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
