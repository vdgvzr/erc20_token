pragma solidity >=0.4.22 <0.7.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Token.sol";

contract TestToken {

  function testInitialBalanceUsingDeployedContract() public {
    Token meta = Token(DeployedAddresses.Token());

    uint expected = 10000;

    Assert.equal(meta.getBalance(tx.origin), expected, "Owner should have 10000 Token initially");
  }

  function testInitialBalanceWithNewToken() public {
    Token meta = new Token();

    uint expected = 10000;

    Assert.equal(meta.getBalance(tx.origin), expected, "Owner should have 10000 Token initially");
  }

}
