class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  url "https://get.monk.io/stable/macos/monk-darwin-v3.0.9.tar.gz"
  sha256 "d926bd884fa87314f50642594ab25d374201ccd7162f7740c7d69b90eda5ecce"
  version "3.0.9"

  bottle :unneeded

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end
end
