class ScwryptsAT43 < Formula
  desc "Ultimate devops script runner"
  homepage "https://github.com/wrynegade/scwrypts"
  url "https://github.com/wrynegade/scwrypts/archive/refs/tags/v4.3.1.tar.gz"
  sha256 "531d6584a19dc67a7007e0e02f314a88b09dbfd0a38869761a764c5efb3a636c"
  license "GPL-3.0"

  depends_on "awscli"
  depends_on "coreutils"
  depends_on "ffmpeg"
  depends_on "findutils"
  depends_on "fzf"
  depends_on "gawk"
  depends_on "git"
  depends_on "gnu-sed"
  depends_on "grep"
  depends_on "helm"
  depends_on "jq"
  depends_on "libnotify"
  depends_on "libpq"
  depends_on "make"
  depends_on "pnpm"
  depends_on "redis"
  depends_on "ripgrep"
  depends_on "yamllint"
  depends_on "yq"

  uses_from_macos "zsh"

  def install
    (share/"scwrypts").mkpath
    (share/"scwrypts").install \
      ".config/", \
      "plugins/", \
      "py/", \
      "zsh/", \
      "zx/", \
      "LICENSE", \
      "README.md", \
      "scwrypts", \
      "scwrypts.plugin.zsh"

    File.write(share/"scwrypts/MANAGED_BY", "homebrew")
    File.write(share/"scwrypts/VERSION", "v#{version}")

    bin.install_symlink "#{share}/scwrypts/scwrypts"
  end

  def caveats
    <<~EOS
      This formula requires docker to be installed for full functionality.
      You can install it with:
        macos: brew install --cask docker
        else:  brew install docker

      This formula requires Node.js to be installed for extended functionality.
      It is recommended to use a version manager like one of the following:
        tj/n:  https://github.com/tj/n
        nvm:   https://github.com/nvm-sh/nvm

      This formula requires texlive to be installed for extended functionality.
      You can install it with:
               brew install texlive
    EOS
  end

  test do
    assert_match "scwrypts v#{version}", shell_output("#{bin}/scwrypts --version")
  end
end
