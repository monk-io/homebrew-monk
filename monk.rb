class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.17.2"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.17.2.tar.gz"
  sha256_x64 = "56f58f4cf80526ef9b4adc225d478832707091302fb1082af72c3adfebc5d060"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.17.2.tar.gz"
  sha256_arm64 = "66e1f092807bbbd91b1e151adf7410d730dee77bdf456348c50d65bcf859ede9"

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
