# Fallback

Please set the private key in the `.env` file and you instance address in the files `script/Fallback.s.sol` and `test/Fallback.t.sol`

## Runing tests

`forge test -f https://polygon-testnet.public.blastapi.io`

## Running scripts

forge script script/Fallback.s.sol -f https://polygon-testnet.public.blastapi.io --broadcast