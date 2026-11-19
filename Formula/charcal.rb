# Ricetta Homebrew della CLI di Charcal. La scrive tools/release-cli.sh nella cartella di Charcal: non modificarla a mano.
class Charcal < Formula
  desc "Command-line client for the Charcal day planner"
  homepage "https://charcal.charstudio.app/developers"
  url "https://raw.githubusercontent.com/char-studio/homebrew-tap/main/releases/charcal-1.0.2-macos.tar.gz"
  sha256 "cbff58edc106cb57e569905f49352878a03013312a95d858c74521b5baa417df"

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
