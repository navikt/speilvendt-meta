# Meta-repo for Team Speilvendt sine repoer

## Komme i gang

[meta](https://github.com/mateodelnorte/meta) brukes til å klone og jobbe med dette repoet. Det må installeres separat.

Dette krever at du allerede har [pnpm](https://pnpm.io/installation) installert hos deg:

```bash
pnpm i -g meta
```

Etter dette kan meta benyttes for å klone dette repoet.
Merk! `meta` foran vanlig clone-kommando:

```bash
meta git clone git@github.com:navikt/speilvendt-meta
```

Dette henter alle repoer ned i mappen som klones for `speilvendt-meta`.
Disse kan jobbes med som vanlig.

I tillegg kan `meta`-kommandoer kjøres i `speilvendt-meta`-mappen for å gjøre ting med alle repoene.
Se [dokumentasjonen til meta](https://github.com/mateodelnorte/meta?tab=readme-ov-file#working-with-meta) for
muligheter.

## Oppdatere metarepoet med repositories

Listen over hvilke repositories som gjelder for Speilvendt
ligger [tbd-repoet](https://github.com/navikt/tbd/blob/master/repositories/speilvendt_bomlo.txt), som er at av repoene
innenfor dette meta-repoet.
Så lenge dette repoet er oppdatert lokalt (pullet), kan man kjøre:

```bash
./oppdater_metarepo.sh
```

Dette vil lese filen med reponavn og gjenskape meta-oppsettet basert på disse.

## Henvendelser

Spørsmål knyttet til koden eller prosjektet kan stilles som issues her på GitHub.

### For NAV-ansatte

Interne henvendelser kan sendes via Slack.
