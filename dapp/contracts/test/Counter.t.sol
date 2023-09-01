// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Counter.sol";
import "../src/UupsProxy.sol";
import "../src/CounterOneChange.sol";

contract CounterTest is Test {
    Counter public counterImpl;
    Counter public counterCast;
    UupsProxy public proxy;

    CounterOneChange public counterOneChangeImpl;


    function setUp() public {
        bytes memory payload = abi.encodeWithSignature("initialize(uint256)", 4);
        counterImpl = new Counter();
        proxy = new UupsProxy(address(counterImpl), payload);
        counterCast = Counter(address(proxy));

        assertTrue(address(counterCast) != address(0));
    }

    function testIncrement() public {
        counterCast.increment();
        assertEq(counterCast.number(), 5);
    }

    function testSetNumber(uint256 x) public {
        counterCast.setNumber(x);
        assertEq(counterCast.number(), x);
    }


    function testDecrement() public {
        // sending raw tx instead of casting to CounterOneChange
        bytes memory decrementPayload = abi.encodeWithSignature("decrement()");
        (bool suc, ) = address(counterCast).call(decrementPayload);
        // fails because decrement() is not in Counter
        assertEq(suc, false);
        assertEq(counterCast.number(), 4);
    }

    function testUpgrade() public {
        uint firstGap = counterCast.getGap();
        counterCast.increment();
        assertEq(counterCast.number(), 5);
        counterOneChangeImpl = new CounterOneChange();
        counterCast.upgradeToAndCall(address(counterOneChangeImpl), '');
        counterCast = Counter(address(proxy));
        assertEq(counterCast.number(), 5);
        counterCast.increment();
        assertEq(counterCast.number(), 6);

        // sending raw tx instead of casting to CounterOneChange
        bytes memory decrementPayload = abi.encodeWithSignature("decrement()");
        (bool suc, ) = address(counterCast).call(decrementPayload);
        // passes because the upgraded implementation has decrement()
        assertEq(suc, true);
        assertEq(counterCast.number(), 5);
        assertTrue(suc);

        uint gapSize = counterCast.getGap();

        assertEq(gapSize, firstGap - 1);
    }
}
