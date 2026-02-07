class Taracode < Formula
  desc "DevOps & Cloud AI Assistant - Kubernetes, Terraform, Docker, multi-cloud"
  homepage "https://github.com/tara-vision/taracode"
  version "2.0.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tara-vision/taracode/releases/download/v2.0.4/taracode-darwin-arm64"
      sha256 "1fd028827bb26d411f75fe2039519976569e4d12935205c78b20e650cbdcc377"
    end
    on_intel do
      url "https://github.com/tara-vision/taracode/releases/download/v2.0.4/taracode-darwin-amd64"
      sha256 "fb133c46a25fabf62018bdb9f416f437e673041726b3e273b3cddba562f77b9c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tara-vision/taracode/releases/download/v2.0.4/taracode-linux-amd64"
      sha256 "2618ffa5b8d89778511b9970a1f622b70eee804364da3cc03897444055eb77c8"
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
