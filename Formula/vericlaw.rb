# typed: false
# frozen_string_literal: true

class Vericlaw < Formula
  desc "Formally verified AI agent runtime built with Ada/SPARK"
  homepage "https://github.com/vericlaw/vericlaw"
  version "0.1.0"
  license "Apache-2.0"
  # Pre-built binaries — no source compilation required
  bottle :unneeded

  on_macos do
    on_arm do
      url "https://github.com/vericlaw/vericlaw/releases/download/v#{version}/vericlaw-v#{version}-macos-universal.tar.gz"
      sha256 "ea8e9a28d45e47f53835661043c0c100337eaea83824833b5d5c1c48f4d1e993"
    end
    on_intel do
      url "https://github.com/vericlaw/vericlaw/releases/download/v#{version}/vericlaw-v#{version}-macos-universal.tar.gz"
      sha256 "ea8e9a28d45e47f53835661043c0c100337eaea83824833b5d5c1c48f4d1e993"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vericlaw/vericlaw/releases/download/v#{version}/vericlaw-v#{version}-linux-aarch64.tar.gz"
      sha256 "c8bba2ceb2a2ee4630146fa0abe2b5316127070ce31eecf7daac65441772a00b"
    end
    on_intel do
      url "https://github.com/vericlaw/vericlaw/releases/download/v#{version}/vericlaw-v#{version}-linux-x86_64.tar.gz"
      sha256 "9952df54e4a642279328d970143e4d83019f15ddca67af8ddee051b4a8acc7d5"
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
