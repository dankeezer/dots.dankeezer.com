# `dots.dankeezer.com`

Shell script for downloading the [dotfiles](https://github.com/dankeezer/dotfiles) repo, to be invoked with `curl` or `wget`.

## Usage

```bash
$ curl -L dots.dankeezer.com | sh
```

```bash
$ wget -qO- dots.dankeezer.com | sh
```

The script will download the dotfiles repository and place it in `~/.dotfiles`. From there, the user is instructed to navigate to the `~/.dotfiles` directory to manually install.

## Checksums

Latest checksums can be found in the [tag notes](https://github.com/dankeezer/dots.dankeezer.com/tags)

While `curl | sh` is considered an "unsafe" practice by many, we can mitigate risk by validating checksums of the scripts before piping them directly to `sh`. To check the SHA-256 checksum of the dotfiles installer:

```bash
$ curl -L dots.dankeezer.com | shasum -a 256
```
## Credit
Directly inspired by Darryl Abbate: https://github.com/rootbeersoup/get.darryl.sh
