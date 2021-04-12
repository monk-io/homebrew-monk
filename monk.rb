class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v3.0.7.tar.gz"
  sha256 "7e980616911bac9c48851dc715260fd26362453cf3e8e9b8807de723c670a572"
  version "3.0.7"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
