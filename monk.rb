class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.15.2"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.15.2.tar.gz"
  sha256_x64 = "cd4fa02620a1cd3d34ed3ba1909d888fd22c194b52cdf4dfad585485dddf36d2"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.15.2.tar.gz"
  sha256_arm64 = "b248d1b9f4485f337e2727f620efcb16b4fb373ed5a1294f31d0700d819ca918"

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
