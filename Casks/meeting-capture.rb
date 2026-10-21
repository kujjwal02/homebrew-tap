cask "meeting-capture" do
  version "0.6.1"
  sha256 "d5d9b0b62b00afceceb86eeb5111c85eee93da412bd6ca4709a0d3e3da8c99fb"

  url "https://github.com/kujjwal02/meeting-capture/releases/download/v#{version}/Meeting-Capture_#{version}_aarch64.dmg"
  name "Meeting Capture"
  desc "Turns Google Meet and Slack huddle captions into meeting notes in your vault"
  homepage "https://github.com/kujjwal02/meeting-capture"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app updates itself, so `brew upgrade` leaves it alone unless run with --greedy.
  auto_updates true
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
