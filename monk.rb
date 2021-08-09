class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v3.1.9.tar.gz"
  sha256 "84ec3bec27a8ab37df3255375441e8d2b18746bd74b294b65760aad174f4da25"
  version "3.1.9"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
