class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.11.1"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.11.1.tar.gz"
  sha256_x64 = "0e96e5c0c66f876921dfc5241e985b4b4ce78cb2e73fd0090cc8b95033bdaf90"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.11.1.tar.gz"
  sha256_arm64 = "455cf046ecda83e77fc24fa04cff768a2e58885b9ac7b6022e2acda797dc1667"

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
