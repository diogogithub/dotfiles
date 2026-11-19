#!/usr/bin/env python3
"""Offline checks for PCManFM and Thunar settings migration."""
import importlib.machinery
import importlib.util
import xml.etree.ElementTree as ET
from pathlib import Path

source = Path(__file__).resolve().parents[1] / 'scripts/configure-file-manager-integrations'
loader = importlib.machinery.SourceFileLoader('file_integrations', str(source))
spec = importlib.util.spec_from_loader('file_integrations', loader)
app = importlib.util.module_from_spec(spec)
loader.exec_module(app)

ini = '[config]\nsingle_click=1\nterminal=xterm\n\n[ui]\nicon_size=48\n'
new = app.update_ini_section(ini, 'config', {'terminal': 'kitty', 'archiver': 'engrampa'})
assert new.count('terminal=kitty') == 1 and 'archiver=engrampa' in new
assert '[ui]\nicon_size=48' in new and 'single_click=1' in new
assert app.update_ini_section(new, 'config', {'terminal': 'kitty', 'archiver': 'engrampa'}) == new
assert 'archiver=engrampa' in app.update_ini_section('', 'config', {'archiver': 'engrampa'})
assert app.update_helpers('WebBrowser=firefox\nTerminalEmulator=urxvt\n') == 'WebBrowser=firefox\nTerminalEmulator=kitty\n'
uca = '<actions><action><unique-id>123-1</unique-id><name>Open Terminal Here</name><command>exo-open --launch TerminalEmulator</command><patterns>*</patterns><directories/></action><action><name>Keep Me</name><command>echo hello</command></action></actions>'
updated, uid = app.update_thunar_action(uca)
root = ET.fromstring(updated)
assert uid == '123-1'
assert root.findall('action')[0].findtext('command') == 'kitty --directory %f'
assert root.findall('action')[1].findtext('command') == 'echo hello'
assert app.update_thunar_action(updated)[1] == '123-1'
accels = '(gtk_accel_path "<Actions>/ThunarActions/uca-action-999-1" "F4")\n(gtk_accel_path "<Actions>/ThunarWindow/open-new-window" "<Primary>n")\n'
newaccels = app.update_thunar_accels(accels, uid)
assert 'uca-action-999-1' not in newaccels
assert 'uca-action-123-1" "F4"' in newaccels
assert 'open-new-window' in newaccels
assert app.update_thunar_accels(newaccels, uid) == newaccels
try:
    app.update_thunar_action('<settings/>')
except ValueError:
    pass
else:
    raise AssertionError('Invalid Thunar XML root accepted')
print('File manager integration tests passed')
