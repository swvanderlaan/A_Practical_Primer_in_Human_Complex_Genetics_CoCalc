# EIGENSOFT {#eigensoft}
<!-- ![](./img/_gwas_dummy/banner_man_standing_dna.png){width=70%} -->





There used to be a time that the preferred software **[`EIGENSOFT`](https://github.com/DReichLab/EIG){targe="_blank"}** for Principal Component Analysis (PCA) was **`EIGENSOFT`** For many, it still is. However, **`EIGENSOFT`** is a bit challenging to make it work to say the least. You need to install some programs, and this is not always straightforward.

So, here's the deal.

I will share the how-to for a macOS environment below in [EIGENSOFT] - this should work in a Linux environment too as macOS is UNIX-based. You can choose to try and make it work on your system (be it UNIX or macOS based) at home (or in the office).

However, I recommend that you use the `--pca` function which is present in `PLINK` v1.9 and up (I describe this in the Chapter 'Sample QC'.

## Install homebrew

You need to install `brew`, the missing package-manager and accompanying packages that Apple didn't provide.

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Next, check that everything is in order.

```
brew doctor
```

## Install missing packages

Right, now that you've done that, you're ready to install `gsl` and `openblas`.

```
brew install gsl
brew install openblas
```

You may also require `llvm` for **`EIGENSOFT`** to work.

```
brew install llvm
```


## Installing EIGENSOFT

I am still sharing the code you'll need - you could try this on your system.

```
mkdir -v $HOME/git
cd $HOME/git
git clone https://github.com/DReichLab/EIG.git
cd EIG/src
make
make install
```

<script>
title=document.getElementById('header');
title.innerHTML = '<img src="./img/headers/banner_man_standing_dna.png" alt="Eigensoft">' + title.innerHTML
</script>
