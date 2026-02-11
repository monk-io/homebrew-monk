class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.18.12"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.18.12.tar.gz"
  sha256_x64 = "4dcf3eff0aba4522d89cfe519b2081ca899a912907aea46a3c8f37c7c3e14023"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.18.12.tar.gz"
  sha256_arm64 = "e14660052d8a216ecfa9eb10501a1e2ae0e20a860a5db8ed26344d2541b0115a"

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
