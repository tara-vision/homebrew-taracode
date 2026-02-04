class Taracode < Formula
  desc "DevOps & Cloud AI Assistant - Kubernetes, Terraform, Docker, multi-cloud"
  homepage "https://github.com/tara-vision/taracode"
  version "1.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tara-vision/taracode/releases/download/v1.0.2/taracode-darwin-arm64"
      sha256 "f05f4ec392122a38c2dfac6eb7e7be69148f9ae95820499adc5d6bd4073c7cde"
    end
    on_intel do
      url "https://github.com/tara-vision/taracode/releases/download/v1.0.2/taracode-darwin-amd64"
      sha256 "1f8e8e568fe315eeb6f508cc89303403aa6991d90e456e024efba9b43920027b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tara-vision/taracode/releases/download/v1.0.2/taracode-linux-amd64"
      sha256 "1bc8f02a7d3aafad4d2b76d0593c7a8dd27b80d7b8b5c614cf4d870a66288585"
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
