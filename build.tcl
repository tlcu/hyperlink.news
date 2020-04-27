#!/usr/bin/env tclsh
package require fileutil
set assets [glob -directory src/assets *]
set links  [lsort -decreasing [glob -directory src/links *]]
set markup [::fileutil::cat src/head.md {*}$links src/tail.md]

file copy -force {*}$assets docs
exec pandoc --standalone              \
            --css style.css           \
            --template src/master.htm \
            --output docs/index.html  \
            << $markup
