cask "vulkara" do
  version "0.7.9"
  sha256 "4cea6c986f04b205407c32237819e0db99ddd7afa22cfa36dfe48122e59e9d25"

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
