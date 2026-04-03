// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract MathOperations {
    function sum(uint[] calldata numbers) external pure returns (uint) {
        _validate(numbers);

        uint total = 0;
        for (uint i = 0; i < numbers.length; i++) {
            total += numbers[i];
        }
        return total;
    }
    function max(uint[] memory numbers) public pure returns (uint) {
        _validate(numbers);

        uint maxValue = numbers[0];
        for (uint i = 1; i < numbers.length; i++) {
            if (numbers[i] > maxValue) {
                maxValue = numbers[i];
            }
        }
        return maxValue;
    }
    function _average(uint[] memory numbers) internal pure returns (uint) {
        uint total = 0;
        for (uint i = 0; i < numbers.length; i++) {
            total += numbers[i];
        }
        return total / numbers.length;
    }
    function average(uint[] memory numbers) public pure returns (uint) {
        _validate(numbers);
        return _average(numbers);
    }
    function _validate(uint[] memory numbers) private pure {
        require(numbers.length > 0, "Pusta tablica");
    }
}

/*
"External functions are part of the contract interface and can be called from other contracts and via transactions."

Wniosek:
wywoływane z zewnątrz kontraktu
bardziej efektywne dla dużych danych (calldata)

"Public functions are part of the contract interface and can be called both internally and externally."

Wniosek:
można wywołać z kontraktu i spoza niego

"Internal functions can only be accessed from within the current contract or contracts deriving from it."

Wniosek:
nie są dostępne z zewnątrz
używane do logiki pomocniczej

"Private functions are like internal ones but they are not visible in derived contracts."

Wniosek:
tylko w tym kontrakcie
najwyższy poziom enkapsulacji
*/
