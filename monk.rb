class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.12.3"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.12.3.tar.gz"
  sha256_x64 = "a646571c59cbafa1d6967e16a73fd345e77fec547e54c4210d9ea91bf4f653f0"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.12.3.tar.gz"
  sha256_arm64 = "834746f7c4d37345154c5afbc1ff62e635443694125bdc30a2bf2961876fc18d"

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
