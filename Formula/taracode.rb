class Taracode < Formula
  desc "DevOps & Cloud AI Assistant - Kubernetes, Terraform, Docker, multi-cloud"
  homepage "https://github.com/tara-vision/taracode"
  version "2.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tara-vision/taracode/releases/download/v2.0.3/taracode-darwin-arm64"
      sha256 "13aa3767515ee783ca2934609dbfbab2816f1f0d554f6e3529b5b34733390906"
    end
    on_intel do
      url "https://github.com/tara-vision/taracode/releases/download/v2.0.3/taracode-darwin-amd64"
      sha256 "6b390d321d3eb89224a935a99f2b1526626f7ab0098eba773deafd99f5b97de5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tara-vision/taracode/releases/download/v2.0.3/taracode-linux-amd64"
      sha256 "0cee541073084fef2417b04277a020d550ee28cc49be7dcc8ad48a4b3d58b9e4"
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
