class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.18.5"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.18.5.tar.gz"
  sha256_x64 = "25103b8f31c0956314b7cd03eb37ae75ea05f2e4aead60eaac912d7800c59b64"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.18.5.tar.gz"
  sha256_arm64 = "309fcd1ba0e9230c062a8794a15e2925f215a44df556dd8db4278f80aa181603"

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
