# VegaLiteSegfault

## Nix dev environment

This repo was built to use a Nix development environment, but any should suffice. This repo was built with Elixir 1.17.3 and OTP 27. To use the setup in this repo:

### Initial Nix Setup

1. Install [direnv](https://github.com/direnv/direnv/blob/master/docs/installation.md) through your `home-manager`, `darwin-configuration.nix`, Homebrew, or similar.
1. Install [the Nix package manager](https://nixos.org/download.html#nix-install-macos) following the multi-user installation approach. Verify it's installed with `nix --version`.
1. Allow Nix experimental features by default:

  ```bash
   mkdir ~/.config/nix/
   touch ~/.config/nix/nix.conf
   echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
   ```
   
### Once Nix is setup on your system

1. Build the Nix Flake derivation:

  ```bash
   cd vega_lite_segfault
   direnv allow .
   ```
1. Once the output stops, check that you have access to Elixir 1.17:


  ```bash
   vega_lite_segfault (nix-flake-setup)> elixir --version
   Erlang/OTP 27 [erts-15.0] [source] [64-bit] [smp:14:14] [ds:14:14:10] [async-threads:1] [jit]

   Elixir 1.17.3 (compiled with Erlang/OTP 27)
   ```

Additionally, a docker-compose.yml file is provided for postgres setup. To use:

```bash
docker-compose up -d
```

## Default Phoenix stuff

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
