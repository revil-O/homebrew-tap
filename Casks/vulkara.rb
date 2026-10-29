cask "vulkara" do
  version "0.7.6"
  sha256 "87e0710dc0306a01a8cd6b4e33d764a7c420feca07260a9559cb27f79cab601a"

  url "https://github.com/revil-O/VulKara/releases/download/v#{version}/VulKara-#{version}-arm64.dmg"
  name "VulKara"
  desc "Local AI image generator with high privacy"
  homepage "https://www.vulkara.net/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "VulKara.app"

  # the app's settings, history, runtimes and logs; the models and pictures in ~/VulKara stay
  zap trash: [
    "~/Library/Application Support/VulKara",
    "~/Library/Preferences/de.netfx2.vulkara.plist",
    "~/Library/Saved Application State/de.netfx2.vulkara.savedState",
  ]
end
