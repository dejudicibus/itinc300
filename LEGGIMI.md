# Italiano Inclusivo 3.0 per Ubuntu

Questo pacchetto installa su Ubuntu (desktop GNOME) il layout di tastiera "Italiano Inclusivo 3.0", convertito dalla versione per Windows `xITAInc3.klc`. Una volta installato, il layout compare con il nome **Italian (Inclusivo 3.0)** accanto al layout italiano standard, e puoi passare dall'uno all'altro in qualsiasi momento.

## Contenuto

Il file `itinc` descrive il layout. Il file `XCompose` definisce le combinazioni dei tasti morti come nella versione Windows. Lo script `installa.sh` esegue l'installazione, e questo file spiega come usarlo.

## Installazione

Estrai lo zip, apri un terminale nella cartella `itinc300` e lancia:

```
./installa.sh
```

Lo script chiede la password di amministratore, perché copia il layout nella cartella di sistema `/usr/share/X11/xkb/symbols/` e lo aggiunge all'elenco dei layout che compare in Impostazioni. Copia poi il file `XCompose` nella tua cartella personale come `~/.XCompose` (se ne avevi già uno, lo salva come `~/.XCompose.bak`) e aggiunge il nuovo layout alle sorgenti di input di GNOME.

Al termine devi uscire dalla sessione e rientrare, perché alcune applicazioni leggono i tasti morti solo all'avvio della sessione.

## Passare da un layout all'altro

Perché il passaggio funzioni, in Impostazioni → Tastiera → Sorgenti di input devono comparire sia **Italiano** sia **Italian (Inclusivo 3.0)**. Lo script aggiunge solo il secondo, quindi se il primo non c'è premi "+ Aggiungi sorgente di input", scegli "Italiano" e poi di nuovo "Italiano".

A quel punto puoi cambiare layout in tre modi. Il più rapido è la scorciatoia **Super+Spazio** (Super è il tasto con il logo di Windows): ogni pressione passa al layout successivo, e tenendo premuto Super mentre premi più volte Spazio scegli quello che vuoi. In alternativa puoi fare clic sull'indicatore della lingua nella barra in alto a destra, che mostra la sigla del layout attivo, e scegliere il layout dal menu. Il terzo modo è aprire Impostazioni → Tastiera e trascinare in cima all'elenco il layout che vuoi usare di default.

Dallo stesso menu nella barra in alto la voce "Mostra layout tastiera" apre uno schema con la posizione di tutti i caratteri del layout attivo.

## Differenze rispetto alla versione Windows

I livelli sono gli stessi di Windows: tasto normale, Maiusc, AltGr e AltGr+Maiusc. Le differenze sono due. La prima riguarda AltGr+T, che su Windows scrive la legatura "ƈt": su Linux un tasto può produrre un solo carattere, quindi si ottiene solo "ƈ" e la "t" va aggiunta a mano. La seconda riguarda i tasti morti. Su Linux, se dopo un tasto morto premi una lettera senza combinazione definita, di solito non viene scritto nulla, mentre Windows scrive entrambi i caratteri. Alcuni tasti morti accettano poi combinazioni in più rispetto a Windows (per esempio "/" seguito da "d" produce "đ").

## Se il layout sparisce dall'elenco

Un aggiornamento del pacchetto di sistema `xkb-data` può ripristinare l'elenco dei layout e cancellare la voce "Italian (Inclusivo 3.0)" da Impostazioni. Il layout continua comunque a funzionare se era già selezionato, e per farlo ricomparire basta rilanciare `./installa.sh`.

## Modificare il layout

Per cambiare un carattere apri il file `itinc` con un editor di testo, modifica la riga del tasto e rilancia `./installa.sh`, poi esci e rientra nella sessione. Ogni riga ha la forma

```
key <AD08> { type= "FOUR_LEVEL_SEMIALPHABETIC", [ i, I, U01DD, U018F ] };
```

dove i quattro valori fra parentesi quadre sono, nell'ordine, il carattere normale, quello con Maiusc, quello con AltGr e quello con AltGr+Maiusc. I caratteri si indicano con il nome XKB oppure con il codice Unicode preceduto da "U" (U01DD è "ǝ").

## Disinstallazione

Prima di tutto rimuovi "Italian (Inclusivo 3.0)" dalle sorgenti di input in Impostazioni → Tastiera, assicurandoti che resti almeno il layout Italiano. Poi, dal terminale:

```
sudo rm /usr/share/X11/xkb/symbols/itinc
sudo mv /usr/share/X11/xkb/rules/evdev.xml.bak /usr/share/X11/xkb/rules/evdev.xml
rm ~/.XCompose
```

Se avevi un tuo `~/.XCompose` prima dell'installazione, al posto dell'ultimo comando usa `mv ~/.XCompose.bak ~/.XCompose`. Infine esci e rientra nella sessione.
