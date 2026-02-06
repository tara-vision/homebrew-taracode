class Taracode < Formula
  desc "DevOps & Cloud AI Assistant - Kubernetes, Terraform, Docker, multi-cloud"
  homepage "https://github.com/tara-vision/taracode"
  version "2.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tara-vision/taracode/releases/download/v2.0.2/taracode-darwin-arm64"
      sha256 "bdc95ab9978810f51b7c1717952db7e696a17e79769b10f358091b462d27fa89"
    end
    on_intel do
      url "https://github.com/tara-vision/taracode/releases/download/v2.0.2/taracode-darwin-amd64"
      sha256 "c9f304a2e5db116db996d127ab25e0825812a88a77b397f78b29c5f57fda94eb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tara-vision/taracode/releases/download/v2.0.2/taracode-linux-amd64"
      sha256 "80c9c974292a5885af6665678b50dcb41675fff5a63eaa87aab11748a61ea82d"
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
