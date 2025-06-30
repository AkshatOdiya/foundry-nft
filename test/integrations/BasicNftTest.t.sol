// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {Test} from "forge-std/Test.sol";
import {DeployBasicNft} from "script/DeployBasicNft.s.sol";
import {BasicNft} from "src/BasicNft.sol";

contract BasicNftTest is Test {
    BasicNft basicNft;
    DeployBasicNft deployer;

    string public constant randTokenUri =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    address billionaire = makeAddr("Billionaire");

    function setUp() external {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    function testNameIsCorrect() external view {
        assert(keccak256(abi.encodePacked(basicNft.name())) == keccak256(abi.encodePacked("DogeshBhai")));
    }

    function testCanMintAndHaveABalance() public {
        vm.prank(billionaire);
        basicNft.mintNft(randTokenUri);

        assert(basicNft.balanceOf(billionaire) == 1);
        assert(keccak256(abi.encodePacked(randTokenUri)) == keccak256(abi.encodePacked(basicNft.tokenURI(0))));
    }
}
