#!/bin/bash

# Configurazione
PYTHON_SCRIPT="/srv/samba/Acqua_Samba/KMT_RS485/KMT_RS485-6.py"
PORT="/dev/ttyS4"
BOARD_ID=1
DELAY=0.5  # secondi tra un comando e l'altro

# Accensione uno alla volta
echo "Accensione relè in sequenza..."
for i in {1..8}; do
    echo "ON $i" | python3 "$PYTHON_SCRIPT" --port "$PORT" --id "$BOARD_ID"
    sleep $DELAY
done

# Spegnimento uno alla volta in senso inverso
echo "Spegnimento relè in sequenza inversa..."
for i in {8..1}; do
    echo "OFF $i" | python3 "$PYTHON_SCRIPT" --port "$PORT" --id "$BOARD_ID"
    sleep $DELAY
done

echo "Completato."