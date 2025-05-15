#!/usr/bin/env python

import sys
import os
from PIL import Image

if len(sys.argv) < 2:
	print("Requires an argument")
	sys.exit(1)

characters = {
	' ': "space",
	'a': "a",
	'b': "b",
	'c': "c",
	'd': "d",
	'e': "e",
	'f': "f",
	'g': "g",
	'h': "h",
	'i': "i",
	'j': "j",
	'k': "k",
	'l': "l",
	'm': "m",
	'n': "n",
	'o': "o",
	'p': "p",
	'q': "q",
	'r': "r",
	's': "s",
	't': "t",
	'u': "u",
	'v': "v",
	'w': "w",
	'x': "x",
	'y': "y",
	'z': "z",
	'0': "0",
	'1': "1",
	'2': "2",
	'3': "3",
	'4': "4",
	'5': "5",
	'6': "6",
	'7': "7",
	'8': "8",
	'9': "9",
	'.': "period",
	',': "comma",
	'\"': "quote",
	'\'': "apostrophe",
	'?': "qmark",
	'!': "emark",
	'@': "at",
	'_': "underscore",
	'*': "star",
	'#': "pound",
	'$': "dollar",
	'%': "percent",
	'&': "and",
	'(': "lrb",
	')': "rrb",
	'+': "plus",
	'-': "minus",
	'/': "fslash",
	':': "colon",
	';': "semicolon",
	'<': "ltb",
	'=': "equal",
	'>': "rtb",
	'[': "lsb",
	'\\': "bslash",
	']': "rsb",
	'^': "up",
	'`': "backtick",
	'{': "lcb",
	'|': "line",
	'}': "rcb",
	'~': "tilde",
}

text = ' '.join(sys.argv[1:]).lower()
escaped = ""

for c in text:
	escaped += characters[c]

path = os.path.dirname(os.path.abspath(__file__)) + "\\text\\" + escaped + ".png"
#print("Attempting to make", path)
# f = open(path, "w")

characterpath = os.path.dirname(os.path.abspath(__file__)) + "\\characters\\"

# https://stackoverflow.com/questions/30227466/combine-several-images-horizontally-with-python
images = [Image.open(characterpath + "padding.png")] + [Image.open(characterpath + characters[c] + ".png") for c in text]
widths, heights = zip(*(i.size for i in images))

total_width = sum(widths)
max_height = max(heights)

new_im = Image.new('RGBA', (total_width, max_height))

x_offset = 0
for im in images:
  new_im.paste(im, (x_offset,0))
  x_offset += im.size[0]

new_im.save(path)

print(path)
sys.exit(0)