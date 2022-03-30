class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.3.6"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.3.6.tar.gz"
  sha256_x64 = "2ac8457bb021e20d7db2942ad55f3f42ead20cc8c4820afc5a68a367a8e16439"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.3.6.tar.gz"
  sha256_arm64 = "3a6796370ed8590dca4799ba227f8968d03592f32ea126ae09ca69c812f1b4e4"

  if Hardware::CPU.intel?
    sha256 sha256_x64
    url url_x64
  else
    sha256 sha256_arm64
    url url_arm64
  end

  def install
    bin.install "monk" => "monk"
    bin.install "monkd" => "monkd"
  end

  plist_options manual: "monkd"

  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
        <dict>
          <key>Label</key>
          <string>#{plist_name}</string>
          <key>RunAtLoad</key>
          <true/>
          <key>EnableGlobbing</key>
          <true/>
          <key>ProgramArguments</key>
          <array>
            <string>/usr/local/bin/monkd</string>
          </array>
          <key>StandardErrorPath</key>
          <string>/tmp/com.monkd.daemon.plist.error.log</string>
          <key>StandardOutPath</key>
          <string>/tmp/com.monkd.daemon.plist.log</string>
          <key>UserName</key>
          <string>{{USERNAME}}</string>
        </dict>
      </plist>
    EOS
  end

end
