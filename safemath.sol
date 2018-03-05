pragma solidity ^0.4.18;
library safemath 
{
   function mul(uint256 a, uint256 b) internal pure returns (uint256) {
       uint256 c = a * b;
       return c;
  }
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    require(b > 0); 
    uint256 c = a / b;
    return c;
  }
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    require(b <= a);
     uint256 c = a - b;
    return c;
  }
  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    return c;
  }
}
