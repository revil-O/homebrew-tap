cask "vulkara" do
  version "0.5.2"
  sha256 "a844a8eadc696e1c2429735652cda560c472751fc3f468e1a24ed0ea09a0c391"

  url "https://github.com/revil-O/VulKara/releases/download/v#{version}/VulKara-#{version}-arm64.dmg"
  name "VulKara"
  desc "Local AI image generator with high privacy"
  homepage "https://www.vulkara.net/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "VulKara.app"

  # the app's settings, history, runtimes and logs; the models and pictures in ~/VulKara stay
  zap trash: [
    "~/Library/Application Support/VulKara",
    "~/Library/Preferences/de.netfx2.vulkara.plist",
    "~/Library/Saved Application State/de.netfx2.vulkara.savedState",
  ]
end
