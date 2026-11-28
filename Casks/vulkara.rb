# The Homebrew cask of the tap revil-O/homebrew-tap, written whole by .github/workflows/release.yml: the placeholders
# for the version and both DMGs' checksums are filled in there. Change it here, not in the tap.
cask "vulkara" do
  arch arm: "arm64", intel: "x64"

  version "0.11.4"
  sha256 arm:   "0bdb07ddc651bd0d053409e0cb01141055de575eb5fd38b3dae8f0f5e0e7e20f",
         intel: "dc307b4818662bb9fc755f028215b2d5f822381aa8d4cb8f0fab5774619c3b7c"

  url "https://github.com/revil-O/VulKara/releases/download/v#{version}/VulKara-#{version}-#{arch}.dmg"
  name "VulKara"
  desc "Local AI image generator with high privacy"
  homepage "https://www.vulkara.net/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "VulKara.app"

  # the app's settings, history, runtimes and logs; the models and pictures in ~/VulKara stay
  zap trash: [
    "~/Library/Application Support/VulKara",
    "~/Library/Preferences/de.netfx2.vulkara.plist",
    "~/Library/Saved Application State/de.netfx2.vulkara.savedState",
  ]
end
