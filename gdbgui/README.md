!!! Not working as expected, needs rework

Follow: https://github.com/cs01/gdbgui/blob/master/INSTALLATION.md#running-from-source

Add runner script:

        #!/bin/bash
        DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
        python3 $DIR/gdbgui.git/gdbgui/backend.py $@
