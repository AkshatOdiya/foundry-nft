// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721 {
    uint256 private s_tokenCounter; // tokenId == s_tokenCounter

    mapping(uint256 => string) private s_tokenIdToUri;

    constructor() ERC721("DogeshBhai", "DAWG") {
        s_tokenCounter = 0;
    }

    function mintNft(string memory tokenUri) public {
        s_tokenIdToUri[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    /*
     * Our BasicNFT is going to use IPFS, so we'll need to set up our function to return this string, pointing to the correct location in IPFS.
     */
    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return s_tokenIdToUri[tokenId];
    }
}
