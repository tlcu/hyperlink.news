#!/usr/bin/env tclsh

package require fileutil
proc date {{fmt "%a %b %e %H:%M:%S %Z %Y"}} {
  clock format [clock seconds] -format $fmt
}
proc ask prompt {
  puts -nonewline "$prompt: "
  flush stdout
  return [gets stdin]
}
proc interrogate prompt {
  puts "$prompt: "
  return [read stdin]
}

::fileutil::writeFile [file join src/links/ [date %Y-%m-%d]-[ask Slug]].md "
<a class='link' href='[ask {Archive link}]'>
<article>

## [ask Headline]

<time datetime=[date %Y-%m-%d]>[date "%d / %m / %Y"]</time>
<em class='source'>[ask Source]</em>

[interrogate Summary]

</article>
</a>"

