# KMTronic Relay -- Quick Reference

[KMTronic RS485 Relay Controller
(8-channel)](https://kmtronic.com/product/2792/rs485-relay-controller-eight-channel.html)

## Starting the Script

``` bash
python3 KMT_RS485.py [OPTIONS]
```

## Commands

  ---------------------------------------------------------------------------------------------
  Command / Syntax                  Parameters / Notes             Description
  --------------------------------- ------------------------------ ----------------------------
  `ON <ch[,ch,...]> [-t seconds]`   `ch` = channel (relay) number  Switch ON one or more
                                    `1-8` or `ALL`; `-t N` =       relays. With `-t N`, relays
                                    timeout in seconds (ON only)   automatically switch OFF
                                                                   after *N* seconds

  `OFF <ch[,ch,...]>`               `ch` = channel (relay) number  Switch OFF one or more
                                    `1-8` or `ALL`                 relays

  `STATUS`                          none                           Show current status of all
                                                                   relays (ON/OFF)

  `HELP`                            none                           Show all available commands

  `EXIT`                            none                           Exit interactive mode (same
                                                                   as `Ctrl-D`)

  `--port /dev/ttyS4`               Serial port (default           Dynamically select
                                    `/dev/ttyS4`)                  communication port

  `--id N`                          Board ID via DIP switch        Manage multiple RS485 boards
                                    (default `1`)                  on the same line

  `--verbose`                       none                           Show relay status after
                                                                   every command
  ---------------------------------------------------------------------------------------------

## Practical Examples

``` bash
ON 1
```

Turn ON relay 1

``` bash
ON 2,4,6
```

Turn ON relays 2, 4, and 6

``` bash
ON ALL -t 5
```

Turn ON all relays, auto switch OFF after 5 seconds

``` bash
OFF 1,3,5
```

Turn OFF relays 1, 3, and 5

``` bash
STATUS
```

Show current status of all relays

``` bash
HELP
```

Display the command table

``` bash
EXIT
```

Exit interactive mode

------------------------------------------------------------------------

### Using echo + script

``` bash
echo "ON 1,3" | python3 kmtronic_relay.py --verbose
```

Turn ON relays 1 and 3, with visible output

------------------------------------------------------------------------

## Full Example Session

``` bash
$ python3 kmtronic_relay.py --verbose
Relay> ON 1
1:ON 2:OFF 3:OFF 4:OFF 5:OFF 6:OFF 7:OFF 8:OFF
Relay> OFF 1
1:OFF 2:OFF 3:OFF 4:OFF 5:OFF 6:OFF 7:OFF 8:OFF
Relay> ON ALL -t 5
1:ON 2:ON 3:ON 4:ON 5:ON 6:ON 7:ON 8:ON
# After 5 seconds all relays switch OFF automatically
Relay> STATUS
1:OFF 2:OFF 3:OFF 4:OFF 5:OFF 6:OFF 7:OFF 8:OFF
Relay> HELP
Commands:
  ON <ch[,ch,...]|ALL> [-t seconds]
  OFF <ch[,ch,...]|ALL>
  STATUS
  HELP
  EXIT
Relay> EXIT
```

------------------------------------------------------------------------

## Output Modes

-   **Verbose mode** (always show relay status):

``` bash
$ echo "ON ALL -t 3" | python3 kmtronic_relay.py --verbose
1:ON 2:ON 3:ON 4:ON 5:ON 6:ON 7:ON 8:ON
# After 3 seconds all relays switch OFF automatically
```

-   **Multiple relays ON**:

``` bash
$ echo "ON 1,3,5" | python3 kmtronic_relay.py --verbose
1:ON 2:OFF 3:ON 4:OFF 5:ON 6:OFF 7:OFF 8:OFF
```

-   **Multiple relays OFF**:

``` bash
$ echo "OFF 1,3,5" | python3 kmtronic_relay.py --verbose
1:OFF 2:OFF 3:OFF 4:OFF 5:OFF 6:OFF 7:OFF 8:OFF
```

-   **Timer with multiple relays**:

``` bash
$ echo "ON 2,4,6 -t 10" | python3 kmtronic_relay.py --verbose
2:ON 4:ON 6:ON ...
# After 10 seconds, relays 2,4,6 switch OFF automatically
```
