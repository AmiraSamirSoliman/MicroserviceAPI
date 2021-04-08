class Hadolint < Formula
  desc "Smarter Dockerfile linter to validate best practices"
  homepage "https://github.com/hadolint/hadolint"
  url "https://github.com/hadolint/hadolint/archive/v2.1.0.tar.gz"
  sha256 "e631a86392bdf6ebfed737f99f05558b7f06b063215180b41d6e9d7fb8fe6ce4"
  license "GPL-3.0-only"

  depends_on "ghc" => :build
  depends_on "haskell-stack" => :build

  uses_from_macos "xz"

  on_linux do
    depends_on "gmp"
  end

  def install
    unless OS.mac?
      gmp = Formula["gmp"]
      ENV.prepend_path "LD_LIBRARY_PATH", gmp.lib
      ENV.prepend_path "LIBRARY_PATH", gmp.lib
    end

    # Let `stack` handle its own parallelization
    jobs = ENV.make_jobs
    ENV.deparallelize

    system "stack", "-j#{jobs}", "build"
    system "stack", "-j#{jobs}", "--local-bin-path=#{bin}", "install"
  end

  test do
    df = testpath/"Dockerfile"
    df.write <<~EOS
      FROM debian
    EOS
    assert_match "DL3006", shell_output("#{bin}/hadolint #{df}", 1)
  end
end
