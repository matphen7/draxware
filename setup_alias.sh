#!/bin/bash
# ============================================================
#  DRAXWARE — Termux Alias Installer
#  Jalankan sekali di Termux (tanpa root)
# ============================================================

TOKEN="GANTI_TOKEN_DISINI"
REPO="https://matphen7:${TOKEN}@github.com/matphen7/draxware.git"
INSTALL_DIR="/data/local/tmp/.dw"
BASHRC="$HOME/.bashrc"

echo ""
echo "  [*] Installing DRAXWARE alias..."

# Clone repo jika belum ada
if [ ! -d "$INSTALL_DIR/.git" ]; then
  git clone "$REPO" "$INSTALL_DIR" --quiet && \
    echo "  [✓] Repo cloned." || \
    { echo "  [✗] Clone failed. Cek token!"; exit 1; }
else
  echo "  [✓] Repo already exists, skipping clone."
fi

# Tambah alias ke .bashrc
if ! grep -q "alias draxware=" "$BASHRC" 2>/dev/null; then
  cat >> "$BASHRC" << ALIAS

# DRAXWARE — GhostLock TempRoot Injector
alias draxware='su -c "cd ${INSTALL_DIR} && git pull -q && bash draxware.sh"'
alias draxware-update='git -C ${INSTALL_DIR} pull'
ALIAS
  echo "  [✓] Alias added to .bashrc"
else
  echo "  [!] Alias already exists, skipping."
fi

# Apply langsung ke session ini
source "$BASHRC" 2>/dev/null

echo ""
echo "  ✓ Done! Sekarang tinggal ketik:"
echo ""
echo "      draxware"
echo ""
echo "  setiap habis reboot (setelah GhostLock jalan)."
echo ""
