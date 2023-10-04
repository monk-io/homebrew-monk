class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.11.13"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.11.13.tar.gz"
  sha256_x64 = "0e75082643e4accb978dd3cee994cc4f977e85cdeba7b2f78c62ab927741d9d4"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.11.13.tar.gz"
  sha256_arm64 = "69b047781222e868dacebde30e2da1d07fab9fab02865e7408eca7e73b0cbf2a"

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
