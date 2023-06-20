class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.11.3"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.11.3.tar.gz"
  sha256_x64 = "ba8effc0416c283b504525bd320bae58ab5a56e958fca34454cac0b3c315edb5"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.11.3.tar.gz"
  sha256_arm64 = "451e8a41dd6d732458ae49735eab107ebaff66bc16cf8b3d7ff93c297003f647"

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
