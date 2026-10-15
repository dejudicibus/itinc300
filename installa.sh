#!/bin/bash
# Installa il layout "Italiano Inclusivo 3.0" su Ubuntu (GNOME)
# Copyright (c) 2024 Dario de Judicibus
# SPDX-License-Identifier: MIT
# Licenza MIT: vedi il file LICENSE
# https://github.com/dejudicibus/itinc300
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"

# 1. File del layout
sudo cp "$DIR/itinc" /usr/share/X11/xkb/symbols/itinc

# 2. Voce nell'elenco dei layout di Impostazioni (va ripetuta se un aggiornamento di xkb-data la cancella)
RULES=/usr/share/X11/xkb/rules/evdev.xml
if ! grep -q "<name>itinc</name>" "$RULES"; then
  sudo cp "$RULES" "$RULES.bak"
  sudo python3 - "$RULES" <<'PY'
import sys
p = sys.argv[1]
s = open(p, encoding="utf-8").read()
entry = """    <layout>
      <configItem>
        <name>itinc</name>
        <shortDescription>it</shortDescription>
        <description>Italian (Inclusivo 3.0)</description>
        <languageList><iso639Id>ita</iso639Id></languageList>
      </configItem>
    </layout>
"""
s = s.replace("<layoutList>\n", "<layoutList>\n" + entry, 1)
open(p, "w", encoding="utf-8").write(s)
PY
fi

# 3. Tasti morti
if [ -f "$HOME/.XCompose" ] && ! cmp -s "$DIR/XCompose" "$HOME/.XCompose"; then
  cp "$HOME/.XCompose" "$HOME/.XCompose.bak"
fi
cp "$DIR/XCompose" "$HOME/.XCompose"

# 4. Aggiunge il layout alle sorgenti di input di GNOME
python3 - <<'PY'
import ast, subprocess
cur = subprocess.check_output(["gsettings","get","org.gnome.desktop.input-sources","sources"], text=True).strip()
cur = cur.replace("@a(ss) ", "")
lst = ast.literal_eval(cur) if cur not in ("", "[]") else []
if ("xkb","itinc") not in lst:
    lst.append(("xkb","itinc"))
    val = "[" + ", ".join("('%s', '%s')" % t for t in lst) + "]"
    subprocess.check_call(["gsettings","set","org.gnome.desktop.input-sources","sources", val])
PY

echo "Fatto. Esci dalla sessione e rientra, poi scegli 'Italian (Inclusivo 3.0)' con Super+Spazio."
