class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.14.2"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.14.2.tar.gz"
  sha256_x64 = "86d52d9178f822077b68918fd74b96f8ed6af119531ad10da6df161d21345b69"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.14.2.tar.gz"
  sha256_arm64 = "2caf38f30d18d7f93bacecd167a920076ad9d42cf1a146c93bdbfabbd7fbd469"

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
