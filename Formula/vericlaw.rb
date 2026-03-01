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
      sha256 "0cacee7d0123edec3b60dd922b35fc383672903cf2a57ad1899725232a44aed0"
    end
    on_intel do
      url "https://github.com/vericlaw/vericlaw/releases/download/v#{version}/vericlaw-v#{version}-macos-universal.tar.gz"
      sha256 "0cacee7d0123edec3b60dd922b35fc383672903cf2a57ad1899725232a44aed0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vericlaw/vericlaw/releases/download/v#{version}/vericlaw-v#{version}-linux-aarch64.tar.gz"
      sha256 "03044f066e0ac2c0436c3a359a681e0b3c13c3315ac3fefc3752d8eb1cc2ca7c"
    end
    on_intel do
      url "https://github.com/vericlaw/vericlaw/releases/download/v#{version}/vericlaw-v#{version}-linux-x86_64.tar.gz"
      sha256 "3881cb9452ea98a75c58a0bbc3d51b0aab6ce195dd1e8896455a1f6b1b614ca4"
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
