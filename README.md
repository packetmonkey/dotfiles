This is expected to be used with [RCM](https://github.com/thoughtbot/rcm)

# Bootstrapping

## NeoVim

Need to install minpac so it can install everything else

```console
$ mkdir -p ~/.config/nvim/pack/minpac/opt
$ cd ~/.config/nvim/pack/minpac/opt
$ git clone https://github.com/k-takata/minpac.git
```

Then inside NeoVim run

```
:call minpac#update()
```

This will download and install everything.
