/*
sendSMC.sol
*/
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract MobileBanking{
    event SendInfo(address _msgSender, uint256 _currentValue);
    event MyCurrentValue(address _msgSender,uint256 _value);
    event CurrentValueOfSomeone(address _msgSender, address _to, uint256 _value);

   //이더를 받아야되기때문에 payable써준다 //함수전체도 이더보는거라 payable써줌
    function sendEther(address payable _to) public payable {
        require (msg.sender.balance >= msg.value , "your balance is not enough");
        //트랜스퍼 함수를 통해 이더 송금
        _to.transfer(msg.value);
        //보낸 나의 주소, 내 잔고
         emit SendInfo(msg.sender, (msg.sender).balance);
    }
    //잔고확인
    function checkValueNow() public{
        emit MyCurrentValue(msg.sender, (msg.sender).balance);
    }
    //어떤 주소의 잔고 확인
    function checkUserValue(address _to) public{
       emit CurrentValueOfSomeone(msg.sender, _to, _to.balance);
    }
}
