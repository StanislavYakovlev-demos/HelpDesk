// SPDX-License-Identifier: BSD 3-Clause

pragma solidity >=0.7.0 <0.9.0;

import "../contracts/StateWrapper.sol";
import "../contracts/Roles.sol";

contract Ticket is StateWrapper, Roles {

	constructor (address _client, address _support)
		Roles(_client, _support)
	{
		_setState(State.Assigned);
	}

	function provideSolution(address actor)
		public
		isState(State.Assigned)
		isRoleSupport(actor)
	{
		_setState(State.Resolved);
	}

	function confirmSolution(address actor)
		public
		isState(State.Resolved)
		isRoleClient(actor)
	{
		_setState(State.Verified);
	}

	function rejectSolution(address actor)
		public
		isState(State.Resolved)
		isRoleClient(actor)
	{
		_setState(State.Assigned);
	}
}
