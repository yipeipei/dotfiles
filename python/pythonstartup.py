#!/usr/bin/env python
import sys
import os
import pprint


# pprint as display hook
# https://twitter.com/nedbat/status/817827164443840512
# https://gist.github.com/chekunkov/848c3472d4b0bee69bccd2e77907a590
def displayhook_pprint(o):
    """Display hook powered by pprint.

    https://www.python.org/dev/peps/pep-0217/

    """
    if o is None:
        return
    if sys.version_info[0] == 3:
        import builtins
    elif sys.version_info[0] == 2:
        import __builtin__ as builtins
    # Set '_' to None to avoid recursion
    # https://docs.python.org/3/library/sys.html#sys.displayhook
    builtins._ = None
    pprint.pprint(o)
    builtins._ = o

sys.displayhook = displayhook_pprint


# read start-up file from current directory
# https://docs.python.org/3/tutorial/appendix.html#the-interactive-startup-file
if os.path.isfile('.pythonrc.py'):
    exec(open('.pythonrc.py').read())