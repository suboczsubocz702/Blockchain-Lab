// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract ReentrancyGuardTransient {
    bytes32 private constant LOCK_SLOT = keccak256("lock");
    function secureWithdraw() public {
        require(!_getLock(), "Reentrancy detected");
        _setLock(true);
        _setLock(false);
    }
    function _getLock() internal view returns (bool locked) {
        assembly {
            locked := tload(LOCK_SLOT)
        }
    }
    function _setLock(bool locked) internal {
        assembly {
            tstore(LOCK_SLOT, locked)
        }
    }
}

/*
"Transient storage is a new data location that behaves like storage, but is discarded after every transaction."
EIP-1153

Wniosek:
dane istnieją tylko w trakcie transakcji
brak trwałego zapisu w blockchainie


"The opcodes TSTORE and TLOAD are introduced to write to and read from transient storage."
EIP-1153

Wniosek:
tstore - zapis
tload - odczyt

"All values in transient storage are discarded at the end of the transaction."
EIP-1153

Wniosek:
brak potrzeby ręcznego resetu
dane nie przechodzą między wywołaniami

"A common use case is reentrancy locks that do not need to persist beyond a transaction."
EIP-1153

Wniosek:
idealne do zabezpieczenia funkcji przed wielokrotnym wejściem

---

"Storage is used to store data permanently on the blockchain."

Wniosek:
trwałe dane
wysoki koszt gas (SSTORE)
wymaga ręcznego resetu

Transient storage:

"Transient storage is cheaper than storage because it avoids disk writes."
EIP-1153

Wniosek:
niższy koszt gas
brak zapisu do state trie
automatyczny reset
