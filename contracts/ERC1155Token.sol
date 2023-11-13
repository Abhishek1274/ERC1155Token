//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Burnable.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155URIStorage.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract ERC1155Token is ERC1155, Ownable, ERC1155Burnable {
    string public baseTokenURI;
    constructor() ERC1155("") Ownable(msg.sender) {}

    function setURI(string memory newuri) public onlyOwner {
        baseTokenURI=newuri;
        _setURI(baseTokenURI);
    }
    function uri(uint256 _id) public view override returns (string memory) {
        
        return string.concat(baseTokenURI,Strings.toString(_id),".json");
    }

    function mint(address account, uint256 id, uint256 amount, bytes memory data) public onlyOwner{
        _mint(account, id, amount, data);
        uri(id);
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data) public onlyOwner{
        _mintBatch(to, ids, amounts, data);
    }
}