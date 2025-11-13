#!/bin/python

import os
import shutil
import subprocess

dir_src = './source'
dir_out = './output'
arguments = '' \
    '--format=pdf ' \
    '--font-path=./static/font ' \
    '--root=. '

if os.path.isdir(dir_out):
    shutil.rmtree(dir_out)
os.mkdir(dir_out)

for subdir in os.listdir(dir_src):
    dir_sub = f'{dir_src}/{subdir}'
    for file in os.listdir(dir_sub):
        main = "main"
        source = os.path.join(dir_sub, f'{main}.typ')
        output = os.path.join(dir_out, f'{subdir}.pdf')
        if os.path.isdir(file):
            continue
        subprocess.call(f'typst compile {arguments} {source} {output}', shell=True)
