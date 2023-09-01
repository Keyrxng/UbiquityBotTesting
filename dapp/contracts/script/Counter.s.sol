// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "forge-std/Test.sol";
import "../src/Counter.sol";
import "../src/uupsProxy.sol";


contract CounterScript is Script {
    Counter counter;
    Counter counterCast;
    UupsProxy proxy;
    
    function run() external {
        vm.startBroadcast();

        bytes memory payload = abi.encodeWithSignature("initialize(uint256)", 5);
        counter = new Counter();
        console.log("Counter address: %s", address(counter));
        proxy = new UupsProxy(address(counter), payload);
        console.log("Proxy address: %s", address(proxy));
        counterCast = Counter(address(proxy));
        console.log("Counter cast address: %s", address(counterCast));
        integrationTest();
        vm.stopBroadcast();
    }

    function integrationTest() internal view {
        uint expected = 5;
        uint actual = counterCast.number();
        require(actual == expected, "Counter should be initialized to 5");  
        console.log("Counter initialized to %s", actual);
        console.log("Successfully deployed and initialized Counter contract");
    }
}
