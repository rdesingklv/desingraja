pragma solidity ^0.4.0;
 contract erc20
{
     function totalSupply() public  returns (uint256);
     function balanceOf(address tokenOwner) public constant returns (uint256 );
     function transfer(address to, uint tokens) public returns (bool success);
     function allowance(address tokenOwner, address spender) public  view returns (uint256 remaining);
     function approve(address spender, uint tokens) public returns (bool success);
     function transferfrom(address spender,address to,uint256 tokens)public;
     event Transfer(address to,uint tokens);
     event Approve(address from,address to,uint tokens);
}
contract bankWallot is erc20
{
uint256 public constant totalsupply=1000;
mapping(address=>uint256) balance;
mapping(address=>mapping(address=>uint256))allowed;

 function totalSupply() public  returns (uint256)
    {
    
       
       return balance[msg.sender]=totalsupply;
       
    }
      function balanceOf(address tokenOwner) public constant returns (uint256 )
    {
      return  balance[tokenOwner];
    
    }
     function transfer(address to, uint tokens) public returns (bool success)
      {
          require(tokens<totalsupply);   
          balance[msg.sender]-=tokens;
          balance[to]+=tokens;
          Transfer(to,tokens);
          return true;
          
          
      }
      function allowance(address tokenOwner, address spender) public view returns (uint256 remaining)
      {
        return allowed[tokenOwner][spender];
        // return balance[spender];
      }
     
      function approve(address spender, uint tokens) public returns (bool success)
      {
         require(tokens<totalsupply);
         allowed[msg.sender][spender]=tokens;
         Approve(msg.sender,spender,tokens);
         return true;
          
      }
      function transferfrom(address spender,address to,uint256 tokens) public
      {
          require(tokens<totalsupply);
          balance[msg.sender]-=tokens;
          allowed[msg.sender][spender]-=tokens;
          balance[to]+=tokens;
         
      }
}
