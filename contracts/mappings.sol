// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

contract Mapping {

    //mapping from address to uint
    mapping(address => uint) public myMap;

    function get(address _addr) public view returns (uint) {
        //mapping always returns a value.
        //if the value was never set, it will return the default value.
        //the deafult value for uint is 0.
        return myMap[_addr];
    }

    function set(address _addr, uint _i) public {
            //update the value at this address
            myMap[_addr] = _i;
        }

     function remove(address _addr) public {
                //reset the value to the default value.
                delete myMap[_addr];
            }

}


contract NestedMappings {

    //Mapping from address => (mapping from uint to bool)
    mapping(address => mapping(uint => bool)) public nestedMap;

    function get(address _addr1, uint _i) public view returns (bool) {
        //you can get values from a nested mapping
        //even when it is not initialized
        //The default value for a bool type is false.
        return nestedMap[_addr1][_i];
    }

    function set(address _addr1, uint _i, bool _boo) public {
        nestedMap[_addr1][_i] = _boo;
    }

    function remove(address _addr1, uint _i) public {
        delete nestedMap[_addr1][_i];
    }
}