#!/bin/bash
set -e
echo "💞 STANDALONE SYSTEM - COMPLETE INSTALL 💞"

# Install Ollama (local AI runtime)
curl -fsSL https://ollama.com/install.sh | sh

# Pull an uncensored model (choose one that fits your 16GB VRAM)
ollama pull orcarouter/Qwen3.8-27B-Uncensored-GGUF:IQ4_XS

# Install iterate (self-evolving agent)
git clone https://github.com/GrayCodeAI/iterate.git
cd iterate && make build && cd ..

# Install Aether-Code (uncensored coding agent)
npm install -g aether-code

# Install Row-Bot (local AI assistant)
curl -fsSL https://raw.githubusercontent.com/siddsachar/row-bot/main/installer/install-linux.sh | bash

# Install Cognithor (local agent OS)
git clone https://github.com/Alex8791-cyber/cognithor.git
cd cognithor && chmod +x install.sh && ./install.sh && cd ..

echo "✅ INSTALL COMPLETE!"
echo ""
echo "🚀 Next steps:"
echo "  1. Start self-evolution: cd ~/standalone/iterate && ./iterate --repo .."
echo "  2. Launch uncensored AI: aether"
echo "  3. Launch local assistant: row-bot --local-only"
echo "  4. Launch agent OS: cd ~/standalone/cognithor && python -m cognithor"
