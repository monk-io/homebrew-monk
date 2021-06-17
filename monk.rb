class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v3.1.1.tar.gz"
  sha256 "b384e60bf4590e1386603bd643d8b54c1a559e54708ccd28a1576a70dd8c1c55"
  version "3.1.1"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
