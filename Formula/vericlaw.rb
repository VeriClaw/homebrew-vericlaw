# typed: false
# frozen_string_literal: true

class Vericlaw < Formula
  desc "Formally verified AI agent runtime built with Ada/SPARK"
  homepage "https://github.com/vericlaw/vericlaw"
  version "0.1.1"
  license "Apache-2.0"
  # Pre-built binaries — no source compilation required
  bottle :unneeded

  on_macos do
    on_arm do
      url "https://github.com/vericlaw/vericlaw/releases/download/v#{version}/vericlaw-v#{version}-macos-universal.tar.gz"
      sha256 "7ebb8871a69489e07b9a1dc4de078c9bb430637f470b4e7020b7918b2245021c"
    end
    on_intel do
      url "https://github.com/vericlaw/vericlaw/releases/download/v#{version}/vericlaw-v#{version}-macos-universal.tar.gz"
      sha256 "7ebb8871a69489e07b9a1dc4de078c9bb430637f470b4e7020b7918b2245021c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vericlaw/vericlaw/releases/download/v#{version}/vericlaw-v#{version}-linux-aarch64.tar.gz"
      sha256 "81f20919183b12c58f760dc1eed29de293a75ffced55aeebd58c85fbacc8a106"
    end
    on_intel do
      url "https://github.com/vericlaw/vericlaw/releases/download/v#{version}/vericlaw-v#{version}-linux-x86_64.tar.gz"
      sha256 "9e736d8d5783422276e4bcdebe4a4826addd7983b443355cafd34eff1b583fa7"
    end
  end

  def install
    bin.install "vericlaw"
  end

  def caveats
    <<~EOS
      To get started:
        vericlaw init          # Create config file
        vericlaw doctor        # Verify installation
        vericlaw agent         # Start agent
      
      Configuration: ~/.vericlaw/config/agent.json
      Documentation: https://github.com/vericlaw/vericlaw#readme

      Note: Homebrew requires 64-bit ARM (aarch64). For 32-bit ARM
      (Raspberry Pi 2/3 with Raspbian), use the install script:
        curl -fsSL https://get.vericlaw.dev | sh
    EOS
  end

  test do
    assert_match "vericlaw", shell_output("#{bin}/vericlaw --version")
  end
end
