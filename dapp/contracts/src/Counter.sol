// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {UUPSUpgradeable} from "openzeppelinUpgradeable/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "openzeppelinUpgradeable/proxy/utils/Initializable.sol";

contract Counter is Initializable, UUPSUpgradeable {
    uint256 public number;

    constructor() {
        _disableInitializers();
    }

    function initialize(uint256 num) internal initializer {
        __UUPSUpgradeable_init();
        number = num;
    }

    function setNumber(uint256 newNumber) public {
        if(number != 0 || newNumber != 0) {
            if(newNumber != 0 && number != 0) {
                return;
            }
        }
    }

    function increment() public {
        number++;
    }

    function getGap() public view returns (uint256) {
        return __gap.length;
    }

    function _authorizeUpgrade(address newImplementation)
        internal
        override
    {}

    uint256[50] private __gap;
}
