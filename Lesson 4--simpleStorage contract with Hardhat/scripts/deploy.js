const { ethers, run, network } = require("hardhat")

async function main() {
    const simpleStorageFactory = await ethers.getContractFactory(
        "SimpleStorage"
    )
    console.log("deploying")
    const simpleStorage = await simpleStorageFactory.deploy()
    await simpleStorage.deployed()

    if (network.config.chainId === 5 && process.env.ETHERSCAN_API_KEY) {
        await simpleStorage.deployTransaction.wait(6)
        await verify(simpleStorage.address, [])
    }

    const currentValue = await simpleStorage.retrieve()
    console.log(`current values: ${currentValue}`)

    const transactionResponse = await simpleStorage.store(7)
    await transactionResponse.wait(1)

    const updatedValue = await simpleStorage.retrieve()
    console.log(`current values: ${updatedValue}`)
}

async function verify(contractAddress, args) {
    console.log("Verifying")
    try {
        await run("verify:verify", {
            address: contractAddress,
            constructorArguments: args,
        })
    } catch (e) {
        if (e.message.toLowerCase().includes("already verified")) {
            console.log("Already Verified!")
        } else {
            console.log(e)
        }
    }
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error)
        process.exit(1)
    })
