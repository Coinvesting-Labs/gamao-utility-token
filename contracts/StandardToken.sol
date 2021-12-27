// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract StandardToken is ERC20 {
    address public saleContract;
    address public technicalAndOperationalReserve;

    constructor (
        string memory name,
        string memory symbol,
        uint _initialSupply,
        address _saleContract,
        address _technicalAndOperationalReserve          
    ) payable ERC20 (name, symbol) {
        saleContract = _saleContract;
        technicalAndOperationalReserve = _technicalAndOperationalReserve;
        if (_initialSupply > 0) {
            require((_initialSupply % 10) == 0, "_initialSupply has to be a multiple of 10!");
            uint one = _initialSupply * 1 / 100;
            uint ninetyNine = _initialSupply * 10 / 100; 
            mint(saleContract, one); 
            mint(technicalAndOperationalReserve, ninetyNine);
        }
    }

    function mint(address account, uint256 amount) public {
        _mint(account, amount);
    }

    function burn(address account, uint256 amount) public {
        _burn(account, amount);
    }

    function transferInternal(
        address from,
        address to,
        uint256 value
    ) public {
        _transfer(from, to, value);
    }

    function approveInternal(
        address owner,
        address spender,
        uint256 value
    ) public {
        _approve(owner, spender, value);
    }
}
