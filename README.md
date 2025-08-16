# ⚡ RS485 KMTronic Relay – Quick Reference
[KMTronic RS485 Relay Controller (8-channel)](https://kmtronic.com/product/2792/rs485-relay-controller-eight-channel.html)


Easily control **KMTronic relays** via command line with Python scripts.

---

## 🚀 Starting the Script

```bash
python3 KMT_RS485.py [OPTIONS]
```

---

## 📖 Commands

| 📝 Command / Syntax           | ⚙️ Parameters / Notes                                         | 💡 Description |
|-------------------------------|---------------------------------------------------------------|----------------|
| **ON <ch[,ch,...]> [-t seconds]** | `ch` = channel number **1-8** or `ALL` <br> `-t N` = duration in seconds *(only for ON)* | Turns on one or more relays. With `-t N`, it turns off automatically after N seconds |
| **OFF <ch[,ch,...]>**          | `ch` = channel number **1-8** or `ALL`                       | Turns off one or more relays |
| **STATUS**                     | none                                                         | Shows the current status of all relays (ON/OFF) |
| **HELP**                       | none                                                         | Displays all available commands |
| **EXIT**                       | none                                                         | Exits interactive mode |
| **--port /dev/ttyS4**          | Specifies the serial port *(default `/dev/ttyS4`)*           | Useful if the device is on a different port |
| **--id N**                     | Board ID via DIP switch *(default 1)*                        | Allows managing multiple RS485 boards on the same line |
| **--verbose**                  | none                                                         | Shows the status of all relays after each command |
| **--compact**                  | none                                                         | Suppresses extra output, useful for piping or logging |

---

## 🔧 Practical Examples

| Example Command               | Effect |
|--------------------------------|--------|
| `ON 1`                         | Turns on relay 1 |
| `ON 2,4,6`                     | Turns on relays 2, 4, and 6 |
| `ON ALL -t 5`                  | Turns on all relays, auto-off after 5s |
| `OFF 1,3,5`                    | Turns off relays 1, 3, and 5 |
| `STATUS`                       | Shows current status of all relays |
| `HELP`                         | Displays command table |
| `EXIT`                         | Exits interactive mode |

```bash
echo "ON 1,3" | python3 kmtronic_relay.py --verbose
```
👉 Turns on relays **1 and 3** with visible output.

---

## 💻 Interactive Session Example

```bash
$ python3 kmtronic_relay.py --verbose
Relay> ON 1
1:ON 2:OFF 3:OFF 4:OFF 5:OFF 6:OFF 7:OFF 8:OFF
Relay> OFF 1
1:OFF 2:OFF 3:OFF 4:OFF 5:OFF 6:OFF 7:OFF 8:OFF
Relay> ON ALL -t 5
1:ON 2:ON 3:ON 4:ON 5:ON 6:ON 7:ON 8:ON
# After 5 seconds, all relays turn off automatically
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

---

## ⚙️ Modes

### 🔹 Verbose Mode (status always displayed)
```bash
$ echo "ON ALL -t 3" | python3 kmtronic_relay.py --verbose
1:ON 2:ON 3:ON 4:ON 5:ON 6:ON 7:ON 8:ON
# After 3 seconds, all relays turn off automatically
```

---

## 🔀 Multiple Commands

### Multiple ON
```bash
$ echo "ON 1,3,5" | python3 kmtronic_relay.py --verbose
1:ON 2:OFF 3:ON 4:OFF 5:ON 6:OFF 7:OFF 8:OFF
```

### Multiple OFF
```bash
$ echo "OFF 1,3,5" | python3 kmtronic_relay.py --verbose
1:OFF 2:OFF 3:OFF 4:OFF 5:OFF 6:OFF 7:OFF 8:OFF
```

### Timer on Multiple Relays
```bash
$ echo "ON 2,4,6 -t 10" | python3 kmtronic_relay.py --verbose
2:ON 4:ON 6:ON ...
# After 10 seconds, relays 2, 4, 6 turn off automatically
```

---

✅ This reference is optimized for **KMTronic Relay Python scripts**.  
Use `--verbose` for debugging
