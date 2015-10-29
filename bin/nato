#!/usr/bin/env python2
# -*- coding: utf-8 -*-

import os
import sys

nato = {'A': 'alpha',
        'B': 'bravo',
        'C': 'charlie',
        'D': 'delta',
        'E': 'echo',
        'F': 'foxtrot',
        'G': 'golf',
        'H': 'hotel',
        'I': 'india',
        'J': 'juliett',
        'K': 'kilo',
        'L': 'lima',
        'M': 'mike',
        'N': 'november',
        'O': 'oscar',
        'P': 'papa',
        'Q': 'quebec',
        'R': 'romeo',
        'S': 'sierra',
        'T': 'tango',
        'U': 'uniform',
        'V': 'victor',
        'W': 'whiskey',
        'X': 'x-ray',
        'Y': 'yankee',
        'Z': 'zulu',
        '0': 'zero',
        '1': 'one',
        '2': 'two',
        '3': 'tree',
        '4': 'fower',
        '5': 'fife',
        '6': 'six',
        '7': 'seven',
        '8': 'ate',
        '9': 'niner',
        ' ': 'space',
        '~': 'tilde',
        '`': 'backtick',
        '!': 'exclamation-point',
        '@': 'at-sign',
        '#': 'octothorpe',
        '$': 'dollar-sign',
        '%': 'percent',
        '^': 'carat',
        '&': 'ampersand',
        '*': 'asterisk',
        '(': 'left-parenthesis',
        ')': 'right-parenthesis',
        '-': 'dash',
        '_': 'underscore',
        '=': 'equals',
        '+': 'plus-sign',
        '{': 'left-curly-brace',
        '}': 'right-curly-brace',
        ':': 'colon',
        ';': 'semicolon',
        '\'': 'single-quote',
        '"': 'double-quote',
        '<': 'less-than-sign',
        '>': 'greater-than-sign',
        ',': 'comma',
        '.': 'period',
        '?': 'question-mark',
        '/': 'forward-slash',
        '\\': 'backslash',
        '|': 'pipe'
        }

source = ' '.join(sys.argv[1:])
outarr = []
for s in source:
  if s.upper() in nato.keys():
     if s.isupper():
       outarr.append('UPPERCASE ' + nato[s.upper()].upper())
     else:
       outarr.append(nato[s.upper()])
  else:
     outarr.append(s)

print source
print ' '.join(outarr)
