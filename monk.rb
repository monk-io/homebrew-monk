class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "4.0.0"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v4.0.0.tar.gz"
  sha256_x64 = "66e22881240473588be84c817e096db5605afeeada69074ce4ad3bb2a30dcb64"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v4.0.0.tar.gz"
  sha256_arm64 = "f4beb50ef270510931c1bab6e7379fbd3c21a4bbbac9f0093a51af70324e8456"

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
