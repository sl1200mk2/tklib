# copyright (C) 1997-98 Jean-Luc Fontaine (mailto:jfontain@multimania.com)
# this program is free software: please read the COPYRIGHT file enclosed in this package or use the Help Copyright menu

set rcsId {$Id: objselec.tcl,v 1.7 1999/01/31 18:53:01 jfontain Exp $}

# implements selection on a list of object identifiers (sortable list of integer), for a listbox implementation, for example

class objectSelector {

    proc objectSelector {this args} selector {$args} {}

    proc ~objectSelector {this} {}

    ### public procedures follow:

    proc extend {this id} {
        if {[info exists selector::($this,lastSelected)]} {
            set list [lsort -integer [selector::list $this]]
            set last [lsearch -exact $list $selector::($this,lastSelected)]
            set index [lsearch -exact $list $id]
            selector::clear $this
            if {$index>$last} {
                selector::set $this [lrange $list $last $index] 1
            } else {
                selector::set $this [lrange $list $index $last] 1
            }
        } else {
            selector::select $this $id
        }
    }

}
