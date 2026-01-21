class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.18.10"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.18.10.tar.gz"
  sha256_x64 = "a7a30fc47bb0586e1588886a11f9407d6104cf581ca7b1e347b244e8e0dde12a"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.18.10.tar.gz"
  sha256_arm64 = "9aebea02cf1e9562f1c422fa7aefd7ee1d076d08b15473ae456a3f83e49b8799"

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
