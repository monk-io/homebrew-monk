class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.18.14"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.18.14.tar.gz"
  sha256_x64 = "45d76f8bd86cbcdb2ae3de248c7f71202a1d45669a365ad366d966afe086bd08"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.18.14.tar.gz"
  sha256_arm64 = "c17bf4d5f3294420c055e38234a0130f1ce2cf134e7be9a69aae34d68f130e0d"

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
