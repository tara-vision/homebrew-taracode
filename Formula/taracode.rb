class Taracode < Formula
  desc "DevOps & Cloud AI Assistant - Kubernetes, Terraform, Docker, multi-cloud"
  homepage "https://github.com/tara-vision/taracode"
  version "1.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tara-vision/taracode/releases/download/v1.0.3/taracode-darwin-arm64"
      sha256 "25f94d40117dbbe69fba12d91a00d8336d10926aee847bc829684f9bd8c40e0c"
    end
    on_intel do
      url "https://github.com/tara-vision/taracode/releases/download/v1.0.3/taracode-darwin-amd64"
      sha256 "8cd2aa6b7af532efdcb5ab708a1a7a8fc77f627f6edc77ede9fb736cfb01b303"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tara-vision/taracode/releases/download/v1.0.3/taracode-linux-amd64"
      sha256 "4f3f3cafd0218cbc5e3bf5a909fbf00934a12a3cf18133c2510134e576c4ae3a"
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
