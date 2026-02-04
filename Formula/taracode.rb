class Taracode < Formula
  desc "DevOps & Cloud AI Assistant - Kubernetes, Terraform, Docker, multi-cloud"
  homepage "https://github.com/tara-vision/taracode"
  version "1.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tara-vision/taracode/releases/download/v1.0.1/taracode-darwin-arm64"
      sha256 "57d95ee92ef1cf251944a0fcf2aba7868be0ac9894574a40dc87873f23b5fbd4"
    end
    on_intel do
      url "https://github.com/tara-vision/taracode/releases/download/v1.0.1/taracode-darwin-amd64"
      sha256 "90d5953f2f7db02b6e90caec8a5bef1ba49063095ac0598c260189019ee8fce1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tara-vision/taracode/releases/download/v1.0.1/taracode-linux-amd64"
      sha256 "abc303e1eba0a562b8d551128ed6d43120c2553bdee928258f78d7787b34aacc"
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
