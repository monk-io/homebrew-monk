class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.18.16"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.18.16.tar.gz"
  sha256_x64 = "16bb7afa74ba02df9e0ce48bc0b0ecaac3bad9892a46bd3a627258f668ddb140"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.18.16.tar.gz"
  sha256_arm64 = "a57ec61a3551cac5b78700b064879a979f8cffcf376c96213f00a7dc880be27b"

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
