# Sun 14 Jan 18:54:48 UTC 2024

all:
	pio -f -c vim run

nomore:
	pio run

# https://docs.platformio.org/en/stable/boards/atmelavr/megaatmega2560.html

xxproject_init:
	pio project init --board ATmega2560

xxdevlist:
	pio device list

nsterm:
	sleep 2; ./cf-fastpico9t /dev/ttyACM0

term:
	sleep 2; ./cf-fastpico9t /dev/ttyACM0

upload:
	pio run -t upload

install: upload term

upgrade:
	pio upgrade

platform_avr:
	pio pkg update -p atmelavr@5.0.0

platforms: platform_avr

# https://docs.platformio.org/en/latest/core/userguide/pkg/cmd_update.html#cmd-pkg-update

pkgupdate:
	pio pkg update

pkglist:
	pio pkg list

# https://docs.platformio.org/en/latest/core/userguide/pkg/cmd_outdated.html#cmd-pkg-outdated

outdated:
	pio pkg outdated


# result:

# $  pio pkg outdated
# Checking  [####################################]  100%          

# Semantic Versioning color legend:
# <Major Update>  backward-incompatible updates
# <Minor Update>  backward-compatible features
# <Patch Update>  backward-compatible bug fixes

# Package    Current    Wanted    Latest    Type      Environments
# ---------  ---------  --------  --------  --------  --------------
# atmelavr   4.2.0      5.0.0     5.0.0     Platform  ATmega2560

# 2024 14 Jan: it is highlighted in the top line's color: <Major Update>

clean:
	pio run -t clean

distclean: clean
	rm -rf ./.pio

