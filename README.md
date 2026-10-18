# kujjwal02/tap

Homebrew casks for [Meeting Capture](https://github.com/kujjwal02/meeting-capture).

## Install

```sh
brew trust --tap kujjwal02/tap
brew install --cask kujjwal02/tap/meeting-capture
```

Homebrew 6 and later load casks from a third-party tap only after `brew trust`.

Meeting Capture is self-signed and not notarized. The cask removes the quarantine flag after it
installs the app, so macOS opens it without the "Apple could not verify" prompt.

## Upgrade and remove

```sh
brew upgrade --cask meeting-capture
brew uninstall --cask meeting-capture
brew uninstall --zap --cask meeting-capture   # also deletes settings, sign-ins, the job store and logs
```

## Release a new version

Set `version` and `sha256` in `Casks/meeting-capture.rb`. The SHA-256 comes from the `.sha256` file
that `just release` writes next to the DMG.
