class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.12.5"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.12.5.tar.gz"
  sha256_x64 = "81dba109fb77ef9bf55dac92a70be15bbd8d55ffa9d15092f0babb8bc730f1a3"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.12.5.tar.gz"
  sha256_arm64 = "5445d983d5d8f925ed444c168eaace7c17107394e2218e13d3ea220407af801d"

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
