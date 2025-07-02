# Deploying BasicNFT on testnet
Make your `.env` and `Makefile` ready to go  
All the detailed code are in Makefile.

1. Deploy:
```bash
make deploy ARGS="--network sepolia"
```
With a contract deployed, this transaction data, including the contract address is added to our `broadcast` folder within run-latest.json. This is how our `DevOpsTool` acquires the most recent contract deployment. We should now be able to use our `BasicNftInteractions.s.sol` script to mint ourselves an NFT.

> ❗ **IMPORTANT**
> Add `fs_permissions = [{ access = "read", path = "./broadcast" }]` to your `foundry.toml` or DevOpsTools won't have the permissions necessary to function correctly! This is more safe than `FFI=true`.

```bash
make mint ARGS="--network sepolia"
```

While this is minting,  
1. Copy the contract address under which the NFT was deployed  (or `broadcast/DeployBasicNft.s.sol/11155111/run-latest.json`).  
2. From MetaMask, go to NFTs and switch to Sepolia.
3. Click on Import NFTs and paste the copied address.
4. Since we're the first to create this NFT, the token ID will be zero. Input this and hit 'Add'.
