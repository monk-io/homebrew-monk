class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.17.6"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.17.6.tar.gz"
  sha256_x64 = "efa3a6900d8a623a26e12b241ee73a9468410a1ede181eee6c6edffbfe029352"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.17.6.tar.gz"
  sha256_arm64 = "26fc1bbce92ff8c985c444fb865d667df203c487907abb0e89967f01f28d927f"

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
