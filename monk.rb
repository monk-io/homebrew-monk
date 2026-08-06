class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.21.2"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.21.2.tar.gz"
  sha256_x64 = "cd93eb8c8d92f49f55cc048143bcb1dbb228b13d0a309dfefd0610630e26be4f"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.21.2.tar.gz"
  sha256_arm64 = "19396087145da6ff30a765c16449eb26a36ec14b1b8e6e7e18d8349d0c60b8ed"

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
