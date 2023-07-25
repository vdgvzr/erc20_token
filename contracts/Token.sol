// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.5.0 <0.9.0;
pragma abicoder v2;

import "../node_modules/@openzeppelin/contracts/token/ERC20/presets/ERC20PresetMinterPauser.sol";
import "../node_modules/@openzeppelin/contracts/access/Ownable.sol";

contract Token is ERC20PresetMinterPauser, Ownable {
    uint256 private _cap;
    bytes32 public constant CAPPER_ROLE = keccak256("CAPPER_ROLE");

	constructor() ERC20PresetMinterPauser("Token", "TKN") {
        require(20_000_000 > 0, "ERC20Capped: cap is 0");
        _cap = 20_000_000;

        _setupRole(CAPPER_ROLE, _msgSender());

        _mint(_msgSender(), 1000);
    }

    function cap() public view virtual returns (uint256) {
        return _cap; 
    }

    function changeCap(uint256 _newCap) public virtual {
        require(hasRole(CAPPER_ROLE, _msgSender()), "Token: must have capper role to set new cap");
        _cap = _newCap;
    }

    function _mint(address account, uint256 amount) internal virtual override {
        require(ERC20.totalSupply() + amount <= cap(), "ERC20Capped: cap exceeded");
        super._mint(account, amount);
    }

}

