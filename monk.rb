class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.8.1"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.8.1.tar.gz"
  sha256_x64 = "169369505060daa9bf183cbb9359e897da726520334fc6e386df3200d63bdc5a"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.8.1.tar.gz"
  sha256_arm64 = "16030b9716d3b33fbf518361c142923019c95d4653154996851dfd9625a2bc7d"

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
