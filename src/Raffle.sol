// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

/**
    * @title A Sample Raffle contract
    * @author John Paul
    * @notice   This contract is for creating a sample raffle
    * @dev Implements Chainlink VRFv2.5
 */
contract Raffle{
    error Raffle__SendMoreToEnterRaffle();

    uint256 private immutable i_entranceFee;
    address[] private s_players;

    event RaffleEntered(address indexed player);

    constructor(uint256 entranceFee){
        i_entranceFee = entranceFee;
    }

    function enterRaffle() public payable{
        if(msg.value < i_entranceFee){
            revert Raffle__SendMoreToEnterRaffle();
        }
        
        s_players.push(address(msg.sender));
        emit RaffleEntered(msg.sender);
    }

    function pickWinner() public{}

    //Getter Functions below
    function getEntranceFee() external view returns(uint256) {
        return i_entranceFee;
    }
}