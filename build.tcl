#!/usr/bin/env tclsh
package require fileutil

set assets [append src/style.css [glob -directory src/images *]]
set links  [lsort -decreasing [glob -directory src/links *]]
set markup [::fileutil::cat src/head.md {*}$links src/tail.md]

file copy -force {*}$assets docs
exec pandoc --standalone                 \
            --css style.css              \
            --template src/template.html \
            --output docs/index.html << $markup
