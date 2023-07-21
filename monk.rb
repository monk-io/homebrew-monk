class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.11.6"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.11.6.tar.gz"
  sha256_x64 = "83e1448e24e482f2cd04755f99b87b322aecbf8bf8da72be68192352d1fdf8fe"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.11.6.tar.gz"
  sha256_arm64 = "2ce3507e3f2f09fc28f3e2a0a4dec295e818e3872bf74c717506762c5b65a5b1"

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
