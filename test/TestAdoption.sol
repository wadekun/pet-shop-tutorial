pragma solidity ^0.4.17;

import 'truffle/Assert.sol'; // 引入断言
import 'truffle/DeployedAddresses.sol'; // 用来获取被测试合约的地址
import '../contracts/Adoption.sol'; // 被测试合约

contract TestAdoption {
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    // 测试领养用例
    function testUserCanAdoptPet() public {
        uint returnedDetId = adoption.adopt(8);

        uint expectedPetId = 8;

        Assert.equal(returnedDetId, expectedPetId, "Adoption of pet ID 8 shouled be recorded");
    }

    // 宠物所有者测试用例
    function testGetAdopterAddressByPetId() public {
        address expected = this;
        address adopter = adoption.adopters(8);
        Assert.equal(adopter, expected, "8th pet's Owner should be this");
    }

    function testGetAdopterAddresByPetIdInArray() public {
        address expected = this;
        address[16] memory adopters = adoption.getAdopters();
        Assert.equal(adopters[8], expected, "Owner of Pet ID 8 should be recorded");
    }
}