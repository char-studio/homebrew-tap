# Ricetta Homebrew della CLI di Charcal. La scrive tools/release-cli.sh nella cartella di Charcal: non modificarla a mano.
class Charcal < Formula
  desc "Command-line client for the Charcal day planner"
  homepage "https://charcal.charstudio.app/developers"
  url "https://raw.githubusercontent.com/char-studio/homebrew-tap/main/releases/charcal-1.0.1-macos.tar.gz"
  sha256 "3f8d50c1b9f57d7f6cd3b3fda3c2b099bc7f94fc91d4cab33cbe4d34feff0fbb"

  depends_on macos: :sequoia

  def install
    bin.install "charcal"
  end

  def caveats
    <<~EOS
      Copy your personal token from the Charcal app (Settings, Account, API token), then run:
        charcal token chc_...
    EOS
  end

  test do
    assert_equal "charcal #{version}", shell_output("#{bin}/charcal --version").strip
    ENV["CHARCAL_LANGUAGE"] = "en"
    assert_match "time: 08:00", shell_output("#{bin}/charcal parse 'tomorrow at 8 dentist'")
  end
end
