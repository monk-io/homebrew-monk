class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.12.7"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.12.7.tar.gz"
  sha256_x64 = "4d56e9519352c5c5b759d0c6d23ca279249592179281c7cf8e58f7e548408d93"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.12.7.tar.gz"
  sha256_arm64 = "e0ff8008a6a65182a8d6c7c59e2ba4b3d778d6bf77d05377a786953c5f8b8cc8"

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
