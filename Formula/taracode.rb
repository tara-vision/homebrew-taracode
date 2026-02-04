class Taracode < Formula
  desc "DevOps & Cloud AI Assistant - Kubernetes, Terraform, Docker, multi-cloud"
  homepage "https://github.com/tara-vision/taracode"
  version "1.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tara-vision/taracode/releases/download/v1.0.1/taracode-darwin-arm64"
      sha256 "78fb046bea93fe7f4665fe344f31c7bfbf3b1aa302046e290ea9535c52e75bbf"
    end
    on_intel do
      url "https://github.com/tara-vision/taracode/releases/download/v1.0.1/taracode-darwin-amd64"
      sha256 "2a4b279ed5765022cdf4d89efbb36aa6642e559c3c77343ee80455fe05940d94"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tara-vision/taracode/releases/download/v1.0.1/taracode-linux-amd64"
      sha256 "96b0548ca01e40c004304e03ba66b677675673bf3d14c4f36ee2255d8dd18349"
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
