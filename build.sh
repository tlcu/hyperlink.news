#!/bin/sh

cp src/style.css src/images/* docs

find src/links/*.md                   \
| sort -r                             \
| xargs cat                           \
| cat src/head.md - src/tail.md       \
| pandoc --standalone                 \
         --output docs/index.html     \
         --css style.css              \
         --template src/template.html

