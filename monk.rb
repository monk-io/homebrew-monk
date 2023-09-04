class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.11.10"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.11.10.tar.gz"
  sha256_x64 = "3ace51806ccfa50319afcc2e241acc1dd188315ee8e48a2057bc2a66343477c2"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.11.10.tar.gz"
  sha256_arm64 = "2c5cb0c2d9fb2009caa5cc5ff0376ea392acd08f536e801339370a805747adde"

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
