pragma solidity ^0.4.0;
import "./safemath.sol";
contract Token {
    
     function totalSupply(uint256 depo)returns(uint);
     function balanceOf(address _owner)public constant returns (uint256 balance); 
     function transfer(address reciver,uint256 transferamt) public returns (bool success); 
     function transferFrom(address _from, address _to, uint256 _value)  returns (bool success); 
     function approve(address _spender, uint256 _value) returns (bool success); 
     function allowance(address _owner, address _spender) constant returns (uint256 remaining);
     event Transfer(address indexed _from, address indexed _to, uint256 _value);
     event Approval(address indexed _owner, address indexed _spender, uint256 _value);
    
}
contract bank is Token
{
    using safemath for uint256;
    struct bk
    {
     uint256 balance;
     }
    mapping(address => bk)bk1;
    mapping(address=>mapping(address => uint256))bk2;
    function totalSupply(uint256 depo)returns(uint)
    {
        bk1[msg.sender].balance=depo;
        return bk1[msg.sender].balance;
    }
    function transfer(address reciver,uint256 transferamt) public returns (bool success)
    {
        require(bk1[msg.sender].balance>=transferamt && transferamt > 0);
         bk1[reciver].balance=bk1[reciver].balance.add(transferamt);
       bk1[msg.sender].balance=bk1[msg.sender].balance.sub(transferamt);
        Transfer(msg.sender, reciver, transferamt);
        return true;
    }
     function approve(address _spender, uint256 _value) returns (bool success) {
        
        bk2[msg.sender][_spender] = _value;
         Approval(msg.sender, _spender, _value);
        return true;
    }
    function allowance(address _owner,address _spender) constant returns (uint256 remaining) 
   {
      return bk2[_owner][_spender];
   }
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) 
    {
       require(bk2[msg.sender][_from] >= _value && _value > 0); 
             bk1[_to].balance=bk1[_to].balance.add(_value);
            bk1[msg.sender].balance=bk1[msg.sender].balance.sub(_value);
             bk2[msg.sender][_from]=bk2[msg.sender][_from].sub(_value);
            return true;
    } 
    function balanceOf(address _owner) constant returns (uint256 balance)
    {
        return bk1[_owner].balance;
    }
}
