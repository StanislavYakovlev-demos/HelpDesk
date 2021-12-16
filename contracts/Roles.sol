// SPDX-License-Identifier: BSD 3-Clause

pragma solidity >=0.7.0 <0.9.0;

contract Roles {
	address public client;
	address public support;

	constructor (address _client, address _support) {
		client = _client;
		support = _support;
	}
	
	modifier isRoleClient(address actor) {
		require(actor == client);
		_;
	}

	modifier isRoleSupport(address actor) {
		require(actor == support);
		_;
	}
}
