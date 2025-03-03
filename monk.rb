class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.15.9"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.15.9.tar.gz"
  sha256_x64 = "e3d355ed36ce801bff5410ca4b7542168205cf9790ab134a32b7d25e59b22477"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.15.9.tar.gz"
  sha256_arm64 = "5c68dc24b5f32359619c807ef34241c3db060cd29c66f4d6785283260d9d7474"

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
