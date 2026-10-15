# Registro delle modifiche

In questo file sono elencate le modifiche di ogni versione del layout "Italiano Inclusivo" per Linux. Il formato segue [Keep a Changelog](https://keepachangelog.com/it/1.1.0/) e la numerazione delle versioni segue [Semantic Versioning](https://semver.org/lang/it/).

## [Non rilasciato]

## [3.0.0] - 2026-10-15

### Aggiunto

- Prima versione per Linux, ottenuta convertendo in formato XKB il layout Windows `xITAInc3.klc`.
- Livelli normale e Maiusc identici al layout italiano standard; livelli AltGr e AltGr+Maiusc con i caratteri per la scrittura inclusiva (ǝ, Ə, з, Ǝ), simboli matematici e tipografici.
- Otto tasti morti definiti nel file `XCompose`.
- Script `installa.sh` per Ubuntu con desktop GNOME e guida `LEGGIMI.md`.

### Differenze note rispetto alla versione Windows

- AltGr+T produce solo "ƈ" invece della legatura "ƈt", perché XKB emette un solo carattere per tasto.

[Non rilasciato]: https://github.com/dejudicibus/itinc300/compare/v3.0.0...HEAD
[3.0.0]: https://github.com/dejudicibus/itinc300/releases/tag/v3.0.0
