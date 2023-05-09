class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.10.1"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.10.1.tar.gz"
  sha256_x64 = "71e969f3e8e537a12fcee5518f7a1a4d58e3f28b252ca5bbd9d8a40d6d24f1fd"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.10.1.tar.gz"
  sha256_arm64 = "7869cd61579cd12377c056d0b2d1931619ca20fabd12d222028b4550ffccdea4"

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

    Upgrade monk daemon inside the machine machine to the latest version
      monk machine upgrade
    EOS
  end
end
