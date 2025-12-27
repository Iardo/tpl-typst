#!/bin/python

import os
import subprocess
import sys

ansi_red = '\033[31m'
ansi_clr = '\033[0m'

folder_source = './source'
folder_output = './output'
arguments = '' \
    '--format=pdf ' \
    '--font-path=./static/font ' \
    '--root=. '

'''
Disable automatic increment of the patch number
'''
args_disable_patch_autoincrement = True if (len(sys.argv) > 1 and sys.argv[1] == '-dip') else None

# Main
# ---------------
for file in os.listdir(folder_output):
    file_name = os.path.splitext(file)[0]

    # Windows
    if '.~lock.designdoc' in file_name:
        print(f'{ansi_red}Error: Another application or process is using the file.{ansi_clr}')
        sys.exit(1)

for source in os.listdir(folder_source):
    subdir1 = os.path.join(folder_source, source)
    if not os.path.isdir(subdir1):
        continue

    for subdir2 in os.listdir(subdir1):
        if not subdir2 == 'main.typ':
            continue

        src = os.path.join(subdir1, f'main.typ')
        out = os.path.join(folder_output, f'{source}.pdf')

        # Increment Patch Number
        if not args_disable_patch_autoincrement:
            text  = '#let version'
            meta  = os.path.join(subdir1, 'include', '00-metadata.typ')
            file  = open(meta, "r+")
            lines = file.readlines()

            for index, line in enumerate(lines):
                if text in line:
                    version_str = line.split('"')[1::2];
                    break

            version_major, version_minor, version_patch = version_str[0].split('.')
            version_major = int(version_major)
            version_minor = int(version_minor)
            version_patch = int(version_patch) + 1
            lines[index] = f'#let version = "{version_major}.{version_minor}.{version_patch}"\n'
            file.seek(0)
            file.writelines(lines)
            file.close()

        subprocess.call(f'typst compile {arguments} {src} {out}', shell=True)
