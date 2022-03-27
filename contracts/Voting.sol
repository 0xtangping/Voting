// SPDX-License-Identifier: MIT
pragma solidity >0.4.23 <0.9.0;
import "./SafeMath.sol";

contract Voting {
  using SafeMath for uint;
  mapping (bytes32 => uint ) public votesReceived;
  mapping (address => bool) private addrRecoded;
  bytes32[] public candidateList;

  constructor(bytes32[] memory _candidateList) public {
    candidateList = _candidateList;
  }

  function totalVotesFor(bytes32 _candidate) view public returns (uint) {
      require(validCandidate(_candidate));
      return votesReceived[_candidate];
  }

  function voteForCandidate(bytes32 _candidate) payable public {
    require(validCandidate(_candidate));
    require(!addrRecoded[msg.sender]);
    addrRecoded[msg.sender] = true;

    uint m = msg.value / 0.1 ether;

    votesReceived[_candidate] = votesReceived[_candidate].add(m);
  }

  function validCandidate(bytes32 _candidate) view public returns (bool){
    for (uint i = 0 ; i< candidateList.length; i++) {
      if (candidateList[i] == _candidate) {
        return true;
      }
    }
    return false;
  }


}

