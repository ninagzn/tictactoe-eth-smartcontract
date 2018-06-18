const ethers = require('ethers')

const json = require('./build/contract/TicTacToe.json')
const provider = new ethers.providers.JsonRpcProvider('localhost:7545')
const contract = new ethers.Contract(json.networks['5777'].address, json.abi, provider)

setInterval(async () => { 
    let board = ''
    for (let i =0; i<3; i++){
        for( let j=0; j<3; j++){
            board += contract.board(i, j)
            board +=' '
        }
        board += '\n'
    }
    console.log(board)
}, 1000)