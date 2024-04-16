class Scwrypts < Formula
  desc     "the ultimate dev-ops script runner"
  homepage "https://github.com/wrynegade/scwrypts"
  license  "GPL-3.0"

  url "https://github.com/wrynegade/scwrypts/archive/refs/tags/v4.3.0.tar.gz"
  sha256 "66a010e3b9b5ecea84b29041431c581c3fb0108010f7b5281a4b8e2078c22133"

  depends_on "awscli"
  depends_on "coreutils"
  depends_on "docker"
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
  depends_on "node"
  depends_on "pnpm"
  depends_on "redis"
  depends_on "ripgrep"
  depends_on "texlive"
  depends_on "yamllint"
  depends_on "yq"

  uses_from_macos "zsh"

  def install
    (share/"scwrypts").mkpath
    (share/"scwrypts").install ".config/", "plugins/", "py/", "zsh/" , "zx/", "LICENSE", "README.md", "scwrypts", "scwrypts.plugin.zsh"

    File.open(share/"scwrypts/MANAGED_BY", 'w+') {
      |file|
      file.write("homebrew")
    }

    File.open(share/"scwrypts/VERSION", 'w+') {
      |file|
      file.write("v#{version}")
    }

    bin.install_symlink "#{share}/scwrypts/scwrypts"
  end

  test do
    assert_match "scwrypts v#{version}", shell_output("#{bin}/scwrypts --version")
  end
end
