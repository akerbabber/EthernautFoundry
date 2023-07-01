# Dex

Please set the private key in the `.env` file and you instance address in the files `script/Re-entrancy.s.sol` and `test/Dex.t.sol`

## Runing tests

`forge test -f https://polygon-testnet.public.blastapi.io`

## Running scripts

forge script script/Dex.s.sol -f https://polygon-testnet.public.blastapi.io --broadcast