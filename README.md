# dotfiles

## Getting Started

### Installation

```sh
# Answer [No] to questions such as "Do you want to install Determinate Nix?
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```


```sh
# Initial Setup
export NIX_USER=$(whoami)

nix run .#update
```
