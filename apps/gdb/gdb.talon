os: linux
tag: user.gdb

# XXX - a lot of the stuff in here is probably not suited for inclusion when
# writing the scripts?
tag:user.auto_lang
and code.language: gdb
-
tag(): user.debugger
tag(): user.terminal_program
tag(): user.readline

# XXX - this would be better to be managed with settings maybe
# optional generic debugger plugins
# specify which heap plugin you're using
# similar to the architecture
# userland heap
#tag(): user.libptmalloc
#tag(): user.libdlmalloc
#tag(): user.libheap

# linux kernel
tag(): user.gdb_vmlinux
tag(): user.slabdbg

until <number>: "until {number}"

force clear all break points:
    insert("d br\n")
    insert("y\n")

break [on] clip:
    insert("break ")
    edit.paste()
    key(enter)

clear screen: "shell clear\n"
# information
list [source]: "list\n"
list (base|P C): "list $pc\n"

print: "p "
print (var|variable) <user.text>: 
    insert("p ")
    insert(user.formatted_text(text, "snake"))

print hex: "p/x "
print hex (var|variable) <user.text>:
    insert("p/x ")
    insert(user.formatted_text(text, "snake"))
print string: "p/s "
print (bits|binary): "p/t "

print casted struck: 
    user.insert_cursor("p/x *(struct [|] *)")

# symbols
symbol refresh: "sharedlibrary\n"

# execution
source: "source \t\t"

# displays
# XXX - move thee invoke command into a python script
(list|show|info) display: "info display\n"
display (assembly line|program counter|P C)$: "display /i $pc\n"
display source: "display "
enable display <number_small>: "enable display {number_small}\n"
disable display <number_small>: "disable display {number_small}\n"
undisplay: "undisplay\n"

# variables
(list|show|info) local: "info local "
(list|show|info) local typed: "info local -t "
(list|show|info) variable: "info variable "
(list|show|info) variable typed: "info variable -t "
(list|show|info) locals: "info local\n"
(list|show|info) variables: "info variables\n"
(list|show|info) (args|arguments): "info args\n"



# threads
(thread list|info threads): "info threads\n"
thread switch <number_small>: "thread {number_small}\n"
thread (find|search): "thread find "
thread show: "thread\n"
thread help: "help thread\n"
# run command across all threads
thread do: "thread apply all "
thread local storage: "p/x *(tcbhead_t*) $fs_base\n"
thread stack guard: "p/x (*(tcbhead_t*) $fs_base)->stack_guard"
thread pointer guard: "p/x (*(tcbhead_t*) $fs_base)->pointer_guard"

frame info <number_small>: "frame info {number_small}\n"

# inferiors
info inferiors: "info inferiors\n"
inferior <number_small>$: "inferior {number_small}\n"
inferior: "inferior "
resume from main:
    insert("inferior 1\n")
    insert("c\n")
resume [from] (inf|inferior) <number_small>$:
    insert("inferior {number_small}\n")
    insert("c\n")
    
# arguments
set args: "set args "

info source: "info source\n"
info signal: "info signal\n"
info process: "info proc\n"
handle signal <user.signal>: "handle {signal} "
signal <user.signal>: "signal {signal} "

show follow (fork|forks) [mode]: "show follow-fork-mode\n"
[set] follow (fork|forks) [mode] child: "set follow-fork-mode child\n"
[set] follow (fork|forks) [mode] parent: "set follow-fork-mode parent\n"

show detach on fork: "show detach-on-fork\n"
set detach on fork: "set detach-on-fork on\n"
unset detach on fork: "set detach-on-fork off\n"

set logging on: "set logging on"
set logging off: "set logging off"
set logging file: "set logging file "
show logging: "show logging\n"

set history size: "set history size "
set history size unlimited: "set history size unlimited\n"
show history size: "show history size\n"

info library: "info sharedlibrary\n"
info file: "info file\n"

set remote file: "set remote exec-file "

set system root: "set sysroot "
show system root: "show sysroot\n"

set substitute path: "set substitute-path "
show substitute path: "show substitute-path\n"

show list size: "show listsize\n"
set list size <number_small>: "set listsize {number_small}\n"

set remote target: "target extended-remote :9999\n"

print size of:
    insert("p/x sizeof()")
    edit.left()

print (struct|structure) size: 
    insert("p/x sizeof(struct )")
    edit.left()

print (struct|structure) size clip: 
    insert("p/x sizeof(")
    edit.paste()
    key(")")
    key(enter)

print type:
    insert("ptype")
unset print elements:
    insert("set print elements 0\n")

unset print repeats:
    insert("set print repeats 0\n")

watch list: "info watch\n"
watch read: "rwatch *"

file show: "info line\n"

# Convenience for repeated commands
hex stump saved: "x/50gx $ADDRESS\n"
save address clip: 
    insert("set $ADDRESS=")
    edit.paste()
    key(enter)

# Useful to set tags if you didn't user script file
set title: 
    user.insert_cursor('shell echo -n -e "\\033]0;[|]\\007"')

set title G D B: 
    insert('shell echo -n -e "\\033]0;gdb\\007"\n')

set title pone: 
    insert('shell echo -n -e "\\033]0;pwndbg\\007"\n')
