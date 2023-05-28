# Force

Please set the private key in the `.env` file and you instance address in the files `script/Force.s.sol` and `test/Force.t.sol`

## Runing tests

`forge test -f https://polygon-testnet.public.blastapi.io`

## Running scripts

forge script script/Force.s.sol -f https://polygon-testnet.public.blastapi.io --broadcast