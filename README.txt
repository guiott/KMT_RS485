KMTronic Relay – Quick Reference

Avvio dello script

python3 kmtronic_interactive.py [OPTIONS]

Comando / Sintassi          	Parametri / Note                                        	Descrizione
ON <ch[,ch,...]> [-t seconds]	ch = numero canale 1-8 o ALL; -t N = durata in secondi (solo per ON)	Accende uno o più relè. Con -t N, si spegne automaticamente dopo N secondi
OFF <ch[,ch,...]>           	ch = numero canale 1-8 o ALL                               	Spegne uno o più relè
STATUS                      	nessuno                                                  	Mostra lo stato attuale di tutti i relè (ON/OFF)
HELP                        	nessuno                                                  	Mostra tutti i comandi disponibili
EXIT                        	nessuno                                                  	Esce dalla modalità interattiva
--port /dev/ttyS4           	Specifica la porta seriale (default /dev/ttyS4)          	Utile se il dispositivo è su porta diversa
--id N                       	Board ID via DIP switch (default 1)                       	Permette di gestire più schede RS485 sulla stessa linea
--verbose                    	nessuno                                                  	Mostra lo stato di tutti i relè dopo ogni comando
--compact                    	nessuno                                                  	Sopprime output extra, utile per pipe o logging

Esempi pratici
ON 1                         	Accende il relè 1
ON 2,4,6                      	Accende i relè 2, 4 e 6
ON ALL -t 5                    	Accende tutti i relè, spegne automaticamente dopo 5 secondi
OFF 1,3,5                      	Spegne i relè 1,3,5
STATUS                         	Mostra stato attuale di tutti i relè
HELP                           	Mostra la tabella dei comandi
EXIT                           	Esce dalla modalità interattiva

echo "ON 1,3" | python3 kmtronic_relay.py --verbose	Accende 1 e 3 con output visibile


Esempi

$ python3 kmtronic_relay.py --verbose
Relay> ON 1
1:ON 2:OFF 3:OFF 4:OFF 5:OFF 6:OFF 7:OFF 8:OFF
Relay> OFF 1
1:OFF 2:OFF 3:OFF 4:OFF 5:OFF 6:OFF 7:OFF 8:OFF
Relay> ON ALL -t 5
1:ON 2:ON 3:ON 4:ON 5:ON 6:ON 7:ON 8:ON
# Dopo 5 secondi tutti i relè si spengono automaticamente
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

	•	Senza verbose (solo output strettamente necessario):
$ echo "ON 1" | python3 kmtronic_relay.py --compact
$ echo "STATUS" | python3 kmtronic_relay.py --compact
1:ON 2:OFF 3:OFF 4:OFF 5:OFF 6:OFF 7:OFF 8:OFF

	•	Con verbose (stato visualizzato sempre):
$ echo "ON ALL -t 3" | python3 kmtronic_relay.py --verbose
1:ON 2:ON 3:ON 4:ON 5:ON 6:ON 7:ON 8:ON
# Dopo 3 secondi tutti i relè si spengono automaticamente

	•	Comando multiplo:
$ echo "ON 1,3,5" | python3 kmtronic_relay.py --verbose
1:ON 2:OFF 3:ON 4:OFF 5:ON 6:OFF 7:OFF 8:OFF

	•	Spegnimento multiplo:
$ echo "OFF 1,3,5" | python3 kmtronic_relay.py --verbose
1:OFF 2:OFF 3:OFF 4:OFF 5:OFF 6:OFF 7:OFF 8:OFF

	Timer su più relè
$ echo "ON 2,4,6 -t 10" | python3 kmtronic_relay.py --verbose
2:ON 4:ON 6:ON ...
# Dopo 10 secondi, i relè 2,4,6 si spengono automaticamente

