class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v2.6.2.tar.gz"
  sha256 "7de50ab7b5ecc4f292bfe112455d757ee7cef6fe017156961a86397ec69bf476"
  version "2.6.2"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
