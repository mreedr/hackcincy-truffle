pragma solidity ^0.4.4;

// This is just a simple example of a coin-like contract.
// It is not standards compatible and cannot be expected to talk to other
// coin/token contracts. If you want to create a standards-compliant
// token, see: https://github.com/ConsenSys/Tokens. Cheers!

contract Ticket {
	address public owner;
	address public publisher;
	uint public price;

	function Ticket(address _publisher, address _owner, uint _price) {
		publisher = _publisher;
		owner = _owner;
		price = _price;
	}

	function buyTicket() payable {
		if (owner != publisher) throw;
		if (msg.value < price) throw;
		bool success = publisher.send(msg.value);
		if (!success) throw;
		owner = msg.sender;
	}
}
