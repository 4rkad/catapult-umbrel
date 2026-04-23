# catapult-umbrel

UmbrelOS package for **Catapult** — a client-side, non-custodial cross-chain
CoinSwap app that routes BTC between your own wallets via Liquid, composing
Middle Way (BTC→L-BTC) and Boltz (L-BTC→BTC) with independent operators on
each leg.

Packaged as an nginx:alpine container serving the pre-built SPA. No backend,
no persistent volume, no dependencies. All network calls (Middle Way, Boltz,
mempool.space) happen client-side.

## Install on Umbrel

Add the Semilla Bitcoin community app store on your Umbrel and install
**Catapult** from there, or sideload via the Umbrel CLI.

## Architecture

- Multi-arch image at `ghcr.io/4rkad/catapult-umbrel` (amd64 + arm64).
- Upstream SPA source: local `~/coinswap-research/catapult/`. Run
  `scripts/sync-dist.sh` to rebuild and copy `dist/` into `catapult-dist/`.
- Umbrel manifests live under `umbrel/`. The image is hosted on GHCR.

## Release flow

1. Sync `catapult-dist/` via `scripts/sync-dist.sh`.
2. Commit + tag (`git tag v0.1.0 && git push --tags`).
3. GitHub Actions builds and pushes the multi-arch image to GHCR.
4. After the first push, make the GHCR package public so Umbrel hosts can
   pull without auth.
5. Pin the digest in `umbrel/docker-compose.yml` if you want reproducibility.
