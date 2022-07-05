pragma solidity ^0.8.7;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol';

// we will use this url of a erc20 smart contract to use the functions already defined 

contract myToken is ERC20 {

    address public admin; 
   
    constructor() ERC20('Limy' , 'LM'){//the name of our token is limy and the symbole is LM a shorter version of the name
    
        _mint(msg.sender, 10000 * 10 ** 18); //the token is minted by the owner of the contract and the total supply is 10000*10^18 
        admin =msg.sender; //the owner of the contract is defined as an admin that have the free access 
        
    }

    function mint(address to , uint amount) external {
        require(msg.sender == admin, 'only admin'); //secure that only the admin can mint the token
        _mint(to, amount);
    }

    function burn( uint amount ) external{ 
        _burn(msg.sender, amount); //anyone can burn his tokens, or the admin can burn his token to make all the other more valuable
        
    }

}