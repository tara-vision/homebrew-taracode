class Taracode < Formula
  desc "DevOps & Cloud AI Assistant - Kubernetes, Terraform, Docker, multi-cloud"
  homepage "https://github.com/tara-vision/taracode"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tara-vision/taracode/releases/download/v1.0.0/taracode-darwin-arm64"
      sha256 "08db37ab20021aaba1b46016ccb82ea8a477954667f300b6a8c3ea7675e483a9"
    end
    on_intel do
      url "https://github.com/tara-vision/taracode/releases/download/v1.0.0/taracode-darwin-amd64"
      sha256 "09c04a28395eaa01f2face23a833850b6ef06ed21d64186e7019eae678a8b62e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tara-vision/taracode/releases/download/v1.0.0/taracode-linux-amd64"
      sha256 "a088b32be6d9aa177458e8076e924ebcda6d4e3b70b6c6abb0bec03b4a6590bb"
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
