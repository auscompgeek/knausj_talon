import os

from talon import Context, Module, actions, app, ui

ctx = Context()
ctx.matches = r"""
tag: user.vim_ultisnips
mode: user.bash
mode: command
and code.language: bash
"""
# spoken name -> snippet name
ultisnips_snippets = {
    "header": "#!",
    "if": "if",
    "else if": "elif",
    "for loop": "four",
    "four in loop": "fourin",
    "while loop": "while",
    "until": "until",
    "switch": "switch",
}

private_snippets = {
    "if node exists": "ifnodeexists",
    "if not node exists": "ifnotnodeexists",
    "if file exists": "iffileexists",
    "if not file exists": "ifnotfileexists",
    "if folder exists": "iffolderexists",
    "if not folder exists": "ifnotfolderexists",
}

ctx.lists["user.snippets"] = {**ultisnips_snippets, **private_snippets}
