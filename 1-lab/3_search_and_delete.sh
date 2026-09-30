#!/bin/sh
set -e

SCRIPT_DIR=$(cd "${0%/*}" && pwd)
LAB_DIR="${LAB_DIR:-$HOME/lab0}"
cd "$LAB_DIR"
export LC_ALL="${LC_ALL:-C.UTF-8}"

echo "=== 4.1 ==="
ls -lR "$LAB_DIR" 2>/dev/null | grep '^-' | grep -v 'copy' | sort -k5 -nr | head -n 5

echo "=== 4.2 ==="
grep -rhi -e 'нагиев' -e 'баринов' claude_monet archive 2>/dev/null | grep -v 'реклам' | sort -r | head -n 5

echo "=== 4.3 ==="
grep -rli 'поставщик' claude_monet/contracts claude_monet/owner_office 2>/dev/null | wc -l

echo "=== 4.4 ==="
(head -n 1 claude_monet/contracts/*_contract; tail -n 1 claude_monet/contracts/*_contract) \
    | grep -v '^==>' | grep -iE 'поставщик|музыкант|оплат' | sort

echo "=== 4.5 ==="
grep -v 'согласен' claude_monet/owner_office/meeting_notes | grep -E 'меню|кухн' | sort -r | wc -w

echo "=== 4.6 ==="
ls -lR "$LAB_DIR" 2>/dev/null | grep '^l' | sort -k9 -r

echo "=== 4.7 ==="
grep -h 'реклам' claude_monet/owner_office/advertising_backup/* | grep -v 'Нагиев' | sort | wc -w

rm claude_monet/owner_office/nagiev_call_copy
rm owner_contract
rm claude_monet/owner_office/hall_access
rm claude_monet/contracts/supplier_duplicate
rm claude_monet/hall/vip_guests
rmdir claude_monet/hall
rmdir claude_monet/advertising
rm -r claude_monet/owner_office/advertising_backup

ls -lR "$LAB_DIR"
rm -R "$SCRIPT_DIR/lab0"
cp -R "$LAB_DIR" "$SCRIPT_DIR/lab0"
