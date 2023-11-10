class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.12.2"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.12.2.tar.gz"
  sha256_x64 = "15360bf03b8da6b8b36568ee05627b61eb7aa0e29ff0cfede7a8097583a0b2cf"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.12.2.tar.gz"
  sha256_arm64 = "e28efc413275c78dd47927e252d20105a7a5cab46fddd97fc0f263d78f6f7b4d"

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
