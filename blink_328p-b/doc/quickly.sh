#!/bin/sh

CMD_WANTED="  ls -1 "


friar() {
    for index in \
        "../blink_2560-b/Makefile" \
        "../blink_2560-b/platformio.ini" \
        "../blink_2560-b/wokwi.toml"
        do
            echo -n  "${CMD_WANTED}"
            echo     "    ${index}   # rem"
        done
}


dothat() {
cat << _EOF__

	doc/
	include/
	lib/
	test/

_EOF__
}

friar
dothat
exit 0
