app: firefox
-
tag(): browser
tag(): user.tabs
tag(): user.vimium
tab search:
    browser.focus_address()
    insert("% ")
tab search <user.text>$:
    browser.focus_address()
    insert("% {text}")
    key(down)

outline that:
    browser.focus_address()
    key(home)
    insert("outline.com/")
    key(end enter)
archive that:
    browser.focus_address()
    key(home)
    insert("https://web.archive.org/web/*/")
    key(end enter)
