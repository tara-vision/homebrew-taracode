class Taracode < Formula
  desc "DevOps & Cloud AI Assistant - Kubernetes, Terraform, Docker, multi-cloud"
  homepage "https://github.com/tara-vision/taracode"
  version "2.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tara-vision/taracode/releases/download/v2.0.0/taracode-darwin-arm64"
      sha256 "a055a1da7178bd8529745933449ffad0858f82c777f3b25994e70230c0fc303e"
    end
    on_intel do
      url "https://github.com/tara-vision/taracode/releases/download/v2.0.0/taracode-darwin-amd64"
      sha256 "781d0cf2ba1355010f09cc117676f3044454d8492a13fb447bf1a524199ebf88"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tara-vision/taracode/releases/download/v2.0.0/taracode-linux-amd64"
      sha256 "941b4891257535155433771c74b2c7076b33af7dc45d95019ef8de2ae0bc719c"
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
