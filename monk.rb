class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.20.4"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.20.4.tar.gz"
  sha256_x64 = "f25f5aa3a394a1d528379471324f313d16c2dde8492028d553776359a288d8ba"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.20.4.tar.gz"
  sha256_arm64 = "9de244d1d7391b9bbaf2d57ceafad025bf22d07b9dfe3a1fc1f322ebcebf3b7c"

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
