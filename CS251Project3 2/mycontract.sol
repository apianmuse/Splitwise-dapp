// Please paste your contract's solidity code here
// Note that writing a contract here WILL NOT deploy it and allow you to access it from your client
// You should write and develop your contract in Remix and then, before submitting, copy and paste it here

pragma solidity ^0.5.16;

contract Splitwise{
    address[] users; 
    
    // debts[from][to],"from" own "to" money
    mapping(address => mapping (address => uint32)) debts;
    
    function lookup(address debtor,address creditor)public view returns(uint32 ret){
        //debtor欠creditor ret钱
        ret = debts[debtor][creditor];
    }
    
    function check_new_member(address ad)internal{
        for (uint i = 0; i < users.length; i++){
            if (users[i] == ad)
                return;
            }
        users.push(ad);
    }
    
    function add_debts(address debtor,address creditor,uint32 amount)public{
        check_new_member(debtor); //检查是否出现新成员
        check_new_member(creditor); 
        debts[debtor][creditor]+=amount;
    }
    
    function add_IOU(address creditor,uint32 amount)public{
        //msg.sender欠creditor amount钱
        //js端判断环路
        add_debts(msg.sender,creditor,amount);
        
        //若在合约中处理环路gas消耗多少？
    }
    
    
    function getUsers() public view returns (address[] memory ret){
        ret = new address[](users.length);
        for (uint i = 0; i < users.length; i++){
            ret[i] = users[i];
        }
    }
}





