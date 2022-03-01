from .user_settings import get_list_from_csv
from talon import Module, Context

mod = Module()
mod.list("file_extension", desc="A file extension, such as .py")

_file_extensions_defaults = {
    "dot build": ".build",
    "dot back": ".bak",
    "dot backup": ".bkp",
    "dot bat": ".bat",
    "dot batch": ".bat",
    "dot bin": ".bin",
    "dot bend": ".bin",
    "dot bit map": ".bmp",
    "dot bump": ".bmp",
    "dot B Z": ".bz2",
    "dot B zip": ".bz2",
    "dot C G I": ".cgi",
    "dot conf": ".conf",
    "dot config": ".config",
    "dot com": ".com",
    "dot comma": ".csv",
    "dot database": ".db",
    "dot deb": ".deb",
    "dot debug": ".debug",
    "dot dock ex": ".docx",
    "dot dock": ".doc",
    "dot exe": ".exe",
    "dot flack": ".flac",
    "dot G bag": ".gdb",
    "dot git": ".git",
    "dot G Z": ".gz",
    "dot G zip": ".gz",
    # NOTE - dot H conflicted with way too much
    "dot head": ".h",
    "dot hex": ".hex",
    "dot ida": ".idb",
    "dot jar": ".jar",
    "dot java": ".java",
    "dot J S": ".js",
    "dot javascript": ".js",
    "dot jason five": ".json5",
    "dot jason": ".json",
    "dot key": ".key",
    "dot local": ".local",
    "dot log": ".log",
    "dot lua": ".lua",
    "dot M D": ".md",
    "dot mark down": ".md",
    "dot net": ".net",
    "dot org": ".org",
    "dot out": ".out",
    "dot patch": ".patch",
    "dot P D F": ".pdf",
    "dot peep": ".php",  # because P H P doesn't seem to work
    "dot pam": ".pem", 
    "dot P H P": "Files.php",
    "dot P L": ".pl",
    "dot pearl": ".pl",
    "dot pickle": ".pkl",
    "dot pie": ".py",
    "dot pie four": ".py4",
    "dot ping": ".png",
    "dot power shell": ".ps1",
    "dot R S": ".rs",
    "dot rust": ".rs",
    "dot C S": ".cs",
    "dot see sharp": ".cs",
    "dot see": ".c",
    "dot service": ".service",
    "dot session": ".session",
    "dot S H": ".sh",
    "dot shell": ".sh",
    "dot snippets": ".snippets",
    "dot S O": ".so",
    "dot so": ".so",
    "dot socket": ".socket",
    "dot talon": ".talon",
    "dot tar": ".tar",
    "dot tar G Z": ".tar.gz",
    "dot tar G zip": ".tar.gz",
    "dot tar B Z": ".tar.bz2",
    "dot tar B zip": ".tar.bz2",
    "dot tar X Z": ".tar.xz",
    "dot task": ".task",
    "dot text": ".txt",
    "dot timer": ".timer",
    "dot N vim": ".nvim",
    "dot vim": ".vim",
    "dot X Z": ".xz",
    "dot yaml": ".yml",
    "dot z shell": ".zsh",
    "dot zip": ".zip",
    # tlds
    "dot com": ".com",
    "dot net": ".net",
    "dot org": ".org",
    "dot us": ".us",
    "dot U S": ".us",
    "dot C A": ".ca",
    "dot C X": ".cx",
    "dot T W": ".tw",
}

file_extensions = get_list_from_csv(
    "file_extensions.csv",
    headers=("File extension", "Name"),
    default=_file_extensions_defaults,
)

ctx = Context()
ctx.lists["self.file_extension"] = file_extensions
