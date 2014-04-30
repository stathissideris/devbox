# personal devbox

## Setting up

1. git submodule init
2. git submodule update
3. vagrant up

## Putty SSH from Windows host

1. convert the %HOMEPATH%\.vagrant.d\insecure_private_key to .ppk using PuTTYGen
2. use the .ppk key in your PuTTY session - configured in Connection > SSH > Auth > Private key file
3. use port 2222 instead of 22
4. set host as vagrant@localhost
5. category > connection > rlogin and set the 'Auto-login username' field to 'vagrant'

