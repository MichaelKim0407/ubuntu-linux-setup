#!/usr/bin/env python3

import os
from configobj import ConfigObj

CONFIG_PATH = os.path.expanduser('~/.config/terminator/config')

SETTINGS = [
    ('global_config', 'suppress_multiple_term_dialog', 'True'),
    (('profiles', 'default'), 'scrollback_infinite', 'True'),
]


def get_section(config, path):
    if isinstance(path, str):
        path = (path,)
    section = config
    for key in path:
        if key not in section:
            section[key] = {}
        section = section[key]
    return section


def main():
    os.makedirs(os.path.dirname(CONFIG_PATH), exist_ok=True)
    config = ConfigObj(CONFIG_PATH)

    changed = False
    for path, key, value in SETTINGS:
        section = get_section(config, path)
        if section.get(key) != value:
            section[key] = value
            print(f"Set {key} = {value}")
            changed = True
        else:
            print(f"Skipping {key} (already set)")

    if changed:
        config.write()


if __name__ == '__main__':
    main()
