class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.18.15"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.18.15.tar.gz"
  sha256_x64 = "465d315bbbe941f91bdf6f8b503a0d7a36ae39c3b36aa3eb6be0ab45fc517034"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.18.15.tar.gz"
  sha256_arm64 = "96a65fdcbcf380a8e4929012f5d8d0cf5270e459b5b22baacb03743465d73836"

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
