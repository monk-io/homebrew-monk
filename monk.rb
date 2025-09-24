class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.17.11"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.17.11.tar.gz"
  sha256_x64 = "f5314badbe6c68e288530deffab2021f72e1b871699de0451985ad249c9d266c"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.17.11.tar.gz"
  sha256_arm64 = "14d7f36373f9e5a9f7eab8348f32c9cb9b3f94d3faf6bf018c71fdaa468b58fa"

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
