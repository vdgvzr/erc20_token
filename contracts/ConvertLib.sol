// SPDX-License-Identifier: UNLICENCED
pragma solidity >=0.5.0 <0.9.0;

library ConvertLib{
	function convert(uint amount,uint conversionRate) public pure returns (uint convertedAmount)
	{
		return amount * conversionRate;
	}
}