class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.20.2"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.20.2.tar.gz"
  sha256_x64 = "06b785fea5e37c695f6f8e0fd78e13c50eb0d54c0a477ab4773067308102fd9e"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.20.2.tar.gz"
  sha256_arm64 = "d1e1e53c3cb08e6b6b5750a78a7513d770783260f254f8936853904a4dac9de3"

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
