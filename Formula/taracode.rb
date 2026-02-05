class Taracode < Formula
  desc "DevOps & Cloud AI Assistant - Kubernetes, Terraform, Docker, multi-cloud"
  homepage "https://github.com/tara-vision/taracode"
  version "2.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tara-vision/taracode/releases/download/v2.0.1/taracode-darwin-arm64"
      sha256 "fcdb4ef436cbc2d076dfb18f893a7e1f20620bf7ee38ea211e0aabfc9f1f6615"
    end
    on_intel do
      url "https://github.com/tara-vision/taracode/releases/download/v2.0.1/taracode-darwin-amd64"
      sha256 "4397f2fc78b449bffff8950de7dfc4da445d17cbefc5f59174a386d141a9784a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tara-vision/taracode/releases/download/v2.0.1/taracode-linux-amd64"
      sha256 "be8791d11919bd6db217e8e201de92d70328a5938832dcaf7ffeed0c12c5e4f1"
    end
  end

  def install
    binary_name = if OS.mac?
      Hardware::CPU.arm? ? "taracode-darwin-arm64" : "taracode-darwin-amd64"
    else
      "taracode-linux-amd64"
    end
    bin.install binary_name => "taracode"
  end

  def caveats
    <<~EOS
      taracode requires Ollama for LLM inference:

        brew install ollama
        ollama pull gemma3:27b
        taracode

      For more info: https://github.com/tara-vision/taracode
    EOS
  end

  test do
    assert_match "taracode version", shell_output("#{bin}/taracode --version")
  end
end
