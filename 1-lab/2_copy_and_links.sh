#!/bin/sh
set -e

SCRIPT_DIR=$(cd "${0%/*}" && pwd)
LAB_DIR="${LAB_DIR:-$HOME/lab0}"
cd "$LAB_DIR"

cp nagiev_call claude_monet/owner_office/nagiev_call_copy
cp -R claude_monet/advertising claude_monet/owner_office/advertising_backup
ln -s claude_monet/contracts/supplier_contract owner_contract
ln -s ../hall claude_monet/owner_office/hall_access
ln claude_monet/contracts/supplier_contract claude_monet/contracts/supplier_duplicate
cat claude_monet/owner_office/owner_order claude_monet/chef_office/barinov_reply > claude_monet/owner_office/meeting_notes
cat claude_monet/kitchen/chef_order >> nagiev_call
mv claude_monet/advertising/promo_plan archive/promo_final

ls -lR "$LAB_DIR"
rm -R "$SCRIPT_DIR/lab0"
cp -R "$LAB_DIR" "$SCRIPT_DIR/lab0"
