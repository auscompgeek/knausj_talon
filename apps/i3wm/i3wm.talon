os: linux
# TODO: match a window manager specified in a settings file
-

port <number_small>: user.system_command("i3-msg workspace {number_small}")
port ten: user.system_command("i3-msg workspace 0")
(port flip|flipper): key(super-u)
port (right|next): key(super-o)
port (prev|previous|left): key(super-y)

(win|window) left: key(super-h)
(win|window) right: key(super-l)
(win|window) up: key(super-k)
(win|window) down: key(super-j)
(win|window) kill: key(super-shift-q)
murder: key(super-shift-q)
(win|window) stacking: key(super-s)
(win|window) default: key(super-e)
(win|window) tabbed: key(super-w)
launch: key(super-d)
launch <user.text>:
        key(super-d)
        sleep(100ms)
        insert("{text}")
reload i three config: key(super-shift-c)
restart i three: key(super-shift-r)

(full screen|scuba): key(super-f)
toggle floating: key(super-shift-space)
focus floating: key(super-space)
center window: key(super-shift-d)
resize mode: key(super-r)
focus parent: key(super-a)
focus child: key(super-shift-a)

# resize helpers
grow window:
    key(super-r)
    key(right:10)
    key(down:10)
    key(escape)
    # center window
    sleep(200ms)
    key(super-shift-d)


# resize helpers
shrink window:
    key(super-r)
    key(left:10)
    key(up:10)
    key(escape)
    # center window
    sleep(200ms)
    key(super-shift-d)

# XXX - should include talon sleep maybe
lock screen: key(super-shift-x)

(launch shell|koopa): key(super-enter)
horizontal (shell|terminal):
    key(super-;)
    key(super-enter)

vertical (shell|terminal):
    key(super-v)
    key(super-enter)

move (win|window) [to] port <number_small>: key("super-shift-{number_small}")
move (win|window) [to] port ten: key("super-shift-0")
move (win|window) [to] last port: key(super-shift-b)
move (win|window) left: key("super-shift-h")
move (win|window) right: key("super-shift-l")
move (win|window) up: key("super-shift-k")
move (win|window) down: key("super-shift-j")

shuffle <number_small>: key("super-shift-{number_small}")
shuffle ten: key("super-shift-0")
shuffle last [port]: key(super-shift-b)
shuffle left: key("super-shift-h")
shuffle right: key("super-shift-l")
shuffle up: key("super-shift-k")
shuffle down: key("super-shift-j")

(win|window) horizontal: key(super-;)
(win|window) vertical: key(super-v)

make scratch: key(super-shift--)
[(show|hide)] scratch: key(super--)
new scratch (shell|window):
    key(super-enter)
    sleep(200ms)
    key(super-shift--)
    key(super--)
next scratch:
    key(super--)
    key(super--)

###
# Custom
###


# fix an error related to the layout of vim terminals inside i3
wiggle:
    key(super-f)
    sleep(500ms)
    key(super-f)


orwell:
    key(super-0)
    sleep(1000ms)
    edit.copy()
    key(super-u)
    sleep(1000ms)
    edit.paste()
    key(enter)

reveal:
    key(super-0)
    sleep(1000ms)
    key(ctrl-u)
    key(super-u)
    sleep(1000ms)
    edit.paste()
    key(enter)


new scratch shell:
    user.system_command_nb("/home/aa/scripts/workflow/scratch_shell.sh")


pulse restart:
    key(super-enter)
    sleep(1000ms)
    insert("pulseaudio -k && pulseaudio --start\n")
    key(super-shift-q)
