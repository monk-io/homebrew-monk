class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.18.11"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.18.11.tar.gz"
  sha256_x64 = "a586eb246aa535bfbe11b82931fcb70f0d6789042e64b389cf9f976cac019f45"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.18.11.tar.gz"
  sha256_arm64 = "a639122510abab4ec69068cc4a725cfa55e0663c48c058d82970f980d9c7804e"

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
