cask "meeting-capture" do
  version "0.1.0"
  sha256 "f67a0311ba5008620d8d28d76c5278d38c24033e7cc1db1899225c0790a1267f"

  url "https://github.com/kujjwal02/meeting-capture/releases/download/v#{version}/Meeting-Capture_#{version}_aarch64.dmg"
  name "Meeting Capture"
  desc "Turns Google Meet and Slack huddle captions into meeting notes in your vault"
  homepage "https://github.com/kujjwal02/meeting-capture"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  app "Meeting Capture.app"

  # The app is self-signed, not notarized. Without this, Gatekeeper refuses the first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Meeting Capture.app"]
  end

  uninstall quit: "com.ujjwalkumar.meetingcapture"

  zap trash: [
    "~/Library/Application Support/com.ujjwalkumar.meetingcapture",
    "~/Library/Caches/meeting-capture",
    "~/Library/WebKit/meeting-capture",
  ]
end
