// SPDX-License-Identifier: BSD 3-Clause

pragma solidity >=0.7.0 <0.9.0;

enum State {
	Assigned,
	Resolved,
	Verified
}

contract StateWrapper {
	State public state = State.Assigned;

	modifier isState(State _state) {
		require(state == _state);
		_;
	}

	function _setState(State _state) internal {
		state = _state;
	}
}
