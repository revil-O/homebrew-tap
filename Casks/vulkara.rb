# The Homebrew cask of the tap revil-O/homebrew-tap, written whole by .github/workflows/release.yml: the placeholders
# for the version and both DMGs' checksums are filled in there. Change it here, not in the tap.
cask "vulkara" do
  arch arm: "arm64", intel: "x64"

  version "0.11.0"
  sha256 arm:   "595b2e9725cede00c8df50f3dbfa9f470bc30cf9056435f6e48456e5a68ac931",
         intel: "caadcdb909b0f1972b84d3c999fd643d14554630711ae114ce62367ab2177f06"

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
