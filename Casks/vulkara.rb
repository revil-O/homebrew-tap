cask "vulkara" do
  version "0.10.1"
  sha256 "db843d955d25a1eb6d9d91cd8dc3cd31bcea191d6cf7c26e502b28ecbc0ae7bc"

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
