# Italiano Inclusivo 3.0 per Linux

Questo repository contiene la versione Linux del layout di tastiera **Italiano Inclusivo 3.0** di Dario de Judicibus. La versione per Windows, insieme alla descrizione completa del progetto, è disponibile sul sito [inclusivo.dejudicibus.it](https://inclusivo.dejudicibus.it/).

Il layout è un file XKB ottenuto convertendo il layout Windows `xITAInc3.klc`. I livelli normale e Maiusc coincidono con quelli della tastiera italiana standard, per cui chi scrive normalmente non nota alcuna differenza, mentre i livelli AltGr e AltGr+Maiusc aggiungono i caratteri per la scrittura inclusiva (ǝ, Ə, з, Ǝ), diversi simboli matematici e tipografici e otto tasti morti per le lettere accentate e modificate. Una volta installato, il layout compare in Impostazioni con il nome **Italian (Inclusivo 3.0)** accanto al layout italiano, e si può passare dall'uno all'altro con Super+Spazio.

## Installazione

Lo script è pensato per Ubuntu con desktop GNOME. Scarica lo zip dell'ultima versione dalla pagina [Releases](https://github.com/dejudicibus/itinc300/releases/latest), estrailo, apri un terminale nella cartella `itinc300` e lancia:

```bash
./installa.sh
```

In alternativa puoi clonare il repository con git:

```bash
git clone https://github.com/dejudicibus/itinc300.git
cd itinc300
./installa.sh
```

Lo script chiede la password di amministratore perché copia il layout in `/usr/share/X11/xkb/symbols/` e lo registra nell'elenco dei layout di sistema; copia inoltre le combinazioni dei tasti morti in `~/.XCompose`, salvando una copia di un eventuale file preesistente. Al termine bisogna uscire dalla sessione e rientrare. Le istruzioni complete per l'uso, la modifica e la disinstallazione si trovano nel file [LEGGIMI.md](LEGGIMI.md).

## Differenze rispetto alla versione Windows

XKB permette a ogni tasto di emettere un solo carattere, per cui AltGr+T produce soltanto "ƈ" invece della legatura "ƈt" della versione Windows. Anche i tasti morti si comportano in modo leggermente diverso, come spiegato in [LEGGIMI.md](LEGGIMI.md).

## Segnalazioni

Se trovi un errore o vuoi proporre una modifica, apri una segnalazione nella sezione [Issues](https://github.com/dejudicibus/itinc300/issues). L'elenco delle modifiche di ogni versione si trova in [CHANGELOG.md](CHANGELOG.md).

## Licenza

Copyright (c) 2024 Dario de Judicibus. Il progetto è distribuito con licenza MIT, il cui testo si trova nel file [LICENSE](LICENSE): puoi usare, modificare e ridistribuire i file, a condizione di mantenere la nota di copyright che indica l'autore.

---

## English

**Italiano Inclusivo 3.0** is an Italian keyboard layout by Dario de Judicibus, designed for inclusive Italian writing. This repository contains the Linux (XKB) version; the Windows version and the full project description are available at [inclusivo.dejudicibus.it](https://inclusivo.dejudicibus.it/) (in Italian).

The base and Shift levels are identical to the standard Italian layout, while AltGr and AltGr+Shift add the characters used in inclusive Italian (ǝ, Ə, з, Ǝ), mathematical and typographic symbols, and eight dead keys. To install it on Ubuntu with GNOME, download the zip from [Releases](https://github.com/dejudicibus/itinc300/releases/latest), extract it, open a terminal in the `itinc300` folder and run `./installa.sh`, then log out and back in. The layout appears as **Italian (Inclusivo 3.0)** in the input sources and can be selected with Super+Space.

Bug reports and suggestions are welcome in [Issues](https://github.com/dejudicibus/itinc300/issues). Released under the MIT License, Copyright (c) 2024 Dario de Judicibus.
