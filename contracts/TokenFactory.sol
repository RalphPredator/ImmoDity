pragma solidity ^0.5.0;

import "./ownable.sol";
import "./safemath.sol";

contract TokenFactory is Ownable {
	
	using SafeMath for uint256;

	event newToken(uint tokenId, string name, string addresse, uint price, string image,bool state);

	struct Token {
		string name;
		string addresse;
		uint price;
		string image;
		bool state;
	}

	Token[] public tokens;

	mapping (uint => address) public tokenToOwner;
  mapping (address => uint) ownerTokenCount;

  function createToken(string memory _name, string memory _addresse, uint _price, string memory _image) public {
	  uint id = tokens.push(Token(_name,_addresse,_price,_image,false))-1;
	  tokenToOwner[id] = msg.sender;
	  ownerTokenCount[msg.sender] ++;
	  emit newToken(id,_name,_addresse,_price,_image,false);
  }

}