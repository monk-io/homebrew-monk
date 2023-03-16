class Monk < Formula
  desc "Monk is the stack orchestration platform. K8s alternative."
  homepage "https://monk.io"
  version "3.9.0"

  url_x64 = "https://get.monk.io/stable/macos/monk-darwin-v3.9.0.tar.gz"
  sha256_x64 = "8bef10fe78fa228e8c80eb80860b28fe8e498799c3a258efe6826501fd1ade42"
  url_arm64 = "https://get.monk.io/stable/macos/monk-arm-darwin-v3.9.0.tar.gz"
  sha256_arm64 = "e517524027cff6c84ee97e10bbe53db5f61b38d82f96c6fad4e854885b32003b"

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
