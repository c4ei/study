// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

//주소.balance
//주소의 현재 갖고 있는 이더의 잔액을 의미함.  //  msg.value는 송금액을 의미한다 달라!

// msg.sender
// msg.sender는 스마트컨트랙을 사용하는 주체라고 볼 수 있다 
// 앞으로 설명할 call 과 delegate call에서 주요 내용이니 관심잇게 봐라

contract MobileBanking{
    event SendInfo(address _msgSender, uint256 _currentValue);
    event MyCurrentValue(address _msgSender,uint256 _value);
    event CurrentValueOfSomeone(address _msgSender, address _to, uint256 _value);


   //이더를 보낼라면 
   //을 넣을 줄 알았지만!!! 보내는 주소, 받을 사람 주소만 있음 되는구나.. 이더를 받아야되기때문에 payable써준다 //함수전체도 이더보는거라 payable써줌
    function sendEther(address payable _to) public payable {
        require (msg.sender.balance >= msg.value , "your balance is not enough");
        //트랜스퍼 함수를 통해 이더 송금
        _to.transfer(msg.value);
        //보낸 나의 주소, 내 잔고
         emit SendInfo(msg.sender, (msg.sender).balance);
    }
    //그냥 현재 잔고확인 함수인듯?
    function checkValueNow() public{
        emit MyCurrentValue(msg.sender, (msg.sender).balance);
    }
    //어떤 계정의 잔고 확인하고 싶을때, 확인하고 싶은 주소 넣기
    function checkUserValue(address _to) public{
       emit CurrentValueOfSomeone(msg.sender, _to, _to.balance);
    }

}
