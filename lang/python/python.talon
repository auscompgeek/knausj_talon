mode: user.python

mode: command
and code.language: python

mode: command
and tag: user.python_repl
-
tag(): user.code_operators
tag(): user.code_comment
tag(): user.code_generic
settings():
    user.code_private_function_formatter = "SNAKE_CASE"
    user.code_protected_function_formatter = "SNAKE_CASE"
    user.code_public_function_formatter = "SNAKE_CASE"
    user.code_private_variable_formatter = "SNAKE_CASE"
    user.code_protected_variable_formatter = "SNAKE_CASE"
    user.code_public_variable_formatter = "SNAKE_CASE"
action(user.code_operator_indirection): ""
action(user.code_operator_address_of): ""
action(user.code_operator_structure_dereference): ""
action(user.code_operator_lambda): ""
action(user.code_operator_subscript):
    insert("[]")
    key(left)
action(user.code_operator_assignment): " = "
action(user.code_operator_subtraction): " - "
action(user.code_operator_subtraction_assignment): " -= "
action(user.code_operator_addition): " + "
action(user.code_operator_addition_assignment): " += "
action(user.code_operator_multiplication): " * "
action(user.code_operator_multiplication_assignment): " *= "
action(user.code_operator_exponent): " ** "
action(user.code_operator_division): " / "
action(user.code_operator_division_assignment): " /= "
action(user.code_operator_modulo): " % "
action(user.code_operator_modulo_assignment): " %= "
action(user.code_operator_equal): " == "
action(user.code_operator_not_equal): " != "
action(user.code_operator_greater_than): " > "
action(user.code_operator_greater_than_or_equal_to): " >= "
action(user.code_operator_less_than): " < "
action(user.code_operator_less_than_or_equal_to): " <= "
action(user.code_operator_in): " in "
action(user.code_operator_not_in): " not in "
action(user.code_operator_and): " and "
action(user.code_operator_or): " or "
action(user.code_operator_bitwise_and): " & "
action(user.code_operator_bitwise_and_assignment): " &= "
action(user.code_operator_bitwise_or): " | "
action(user.code_operator_bitwise_or_assignment): " |= "
action(user.code_operator_bitwise_exclusive_or): " ^ "
action(user.code_operator_bitwise_exclusive_or_assignment): " ^= "
action(user.code_operator_bitwise_left_shift): " << "
action(user.code_operator_bitwise_left_shift_assignment): " <<= "
action(user.code_operator_bitwise_right_shift): " >> "
action(user.code_operator_bitwise_right_shift_assignment): " >>= "
action(user.code_self): "self"
action(user.code_null): "None"
action(user.code_is_null): " is None"
action(user.code_is_not_null): " is not None"
action(user.code_state_if):
    insert("if :")
    key(left)
action(user.code_state_else_if):
    insert("elif :")
    key(left)
action(user.code_state_else):
    insert("else:")
    key(enter)
action(user.code_state_switch):
    insert("switch ()")
    edit.left()
action(user.code_state_case):
    insert("case \nbreak;")
    edit.up()
action(user.code_state_for): "for "
action(user.code_state_for_each):
    insert("for in ")
    key(left)
    edit.word_left()
    key(space)
    edit.left()
action(user.code_state_while):
    insert("while :")
    edit.left()
action(user.code_type_class): "class "
action(user.code_import): "import "
action(user.code_from_import):
    insert("from import ")
    key(left)
    edit.word_left()
    key(space)
    edit.left()
action(user.code_comment): "# "
action(user.code_state_return):
	insert("return ")
action(user.code_true): "True"
action(user.code_false): "False"
action(user.code_document_string): user.insert_cursor("\"\"\"[|]\"\"\"")

####
# Operators
####
empty dict: "{}"
empty list: "()"
word (dickt | dictionary): "dict"
state (def | deaf | deft): "def "
class <user.text>:
    insert("class ")
    insert(user.formatted_text(text, "hammer"))
    insert("():\n")
dunder in it: "__init__"
self taught: "self."
for in:
    insert("for in ")
    key(left)
    edit.word_left()
    key(space)
    edit.left()
half dock string:
    key(":3)
big dock string:
    key(":3)
    key(enter:2)
    key(":3)
    edit.up()

####
# Keywords
####
return: "return "
state none: "None"
true: "True"
false: "False"
#pass: "pass"
self dot: "self,"



index <user.word>: '["{word}"]'

pie test: "pytest"
# for things like None comparsion
state is not: " is not "
state is: " is "
state is none: " is None"
state as string: '.decode("utf-8")'
state as bytes: '.encode("utf-8")'
form string: 
    insert('f""')
    edit.left()
raw string: 
    insert('r""')
    edit.left()

^init <user.text>$: 
    var = user.formatted_text(text, "snake")
    insert("self.{var} = {var}")

^funky <user.text>$: user.code_default_function(text)
#^pro funky <user.text>$: user.code_protected_function(text)
^pub funky <user.text>$: user.code_public_function(text)
#^static funky <user.text>$: user.code_private_static_function(text)
#^pro static funky <user.text>$: user.code_protected_static_function(text)
#^pub static funky <user.text>$: user.code_public_static_function(text)
raise {user.python_exception}: user.insert_cursor("raise {python_exception}([|])")
except {user.python_exception}: user.insert_cursor("except {python_exception}:")

# function calling
funk <user.text>:
    insert(user.formatted_text(text, "snake"))
    insert("()")
    edit.left()

# for annotating function parameters
is type <user.python_type_list>:
    insert(": {python_type_list}")
returns [type] <user.python_type_list>:
    insert(" -> {python_type_list}")
# for generic reference of types
type <user.python_type_list>:
    insert("{python_type_list}")
dock <user.python_docstring_fields>:
    insert("{python_docstring_fields}")
    edit.left()
    insert(" ")
dock type <user.python_type_list>:
    user.insert_cursor(":type [|]: {python_type_list}")
dock returns type <user.python_type_list>:
    user.insert_cursor(":rtype [|]: {python_type_list}")

# decorators
deck static [method]: insert("@staticmethod")
deck class [method]: insert("@classmethod")

toggle imports: user.code_toggle_libraries()
import <user.code_libraries>:
    user.code_insert_library(code_libraries, "")
    key(end enter)

# XXX - it would be good to have a set of common overrides?
funk path: "pathlib.Path()"
funk bug: 
    insert('print(f"!!! ")')
    key(left:2)
