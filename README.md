# key-performance

## Add this repo to $PATH

```bash 
export PATH=$PATH:$(pwd)
```

## Install SDKMAN 

We need four different JDKs. To install use SDKMAN: 

```bash 
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
``` 

then install: 

```
sdk install java  8.0.452-tem
sdk install java 11.0.27-tem
sdk install java 17.0.15-tem
sdk install java 21.0.7-tem
```


## Checkout key

```bash 
git clone --mirror https://github.com/KeYProject/key.git
export GIT_DIR=$(pwd)/key.git
```


## Create working copies

Use `git worktree` to create local working copies from specific dates. 

```bash 
keycheckout.sh 2025-{01,02,03}-01
```

This creates three folders with working copies of main at midnight from the specific dates.


## Compile

Compile `testClasses` in advance. This determines the Java version automatically.

```bash 
keycompile.sh 2025-01-01 
```


## Hints 

Gradle folder can not be shared between multiple hosts using NFS. Use `export GRADLE_USER_HOME=/tmp/gradle` and define a host-local folder.
