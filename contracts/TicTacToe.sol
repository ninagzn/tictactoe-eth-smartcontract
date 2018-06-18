pragma solidity 0.4.23;

contract TicTacToe {
	// State

	// Address of playerOne, creator of the board
    address public playerOne;

    address public playerTwo;

	// Board turn: 
	// - Turn = false -> PlayerOne's turn
	// - Turn = true -> PlayerTwo's turn
    bool public turn;

    uint[3][3] public board;


	// Events

    event Played(address indexed player, uint row, uint column);


	// Modifiers

    modifier onlyRegistered {
        require(isPlayerRegistered(msg.sender));
        _;
    }

    modifier whenPlayerTurn {
        if (msg.sender == playerOne) {
            require(turn == false);
        } else {
            require(turn == true);
        }
        _;
    }

	// Ensure that board[row][column] is free
    modifier onlyFreeSquare(uint row, uint column) {
        require(board[row][column] == 0);
        _;
    }


    constructor(address _playerTwo) public {
        playerOne = msg.sender;
        playerTwo = _playerTwo;
        turn = true;
    }

    function isPlayerRegistered (address _player) public view returns (bool) {
        return playerOne == _player || playerTwo == _player;
    }
	
    function play (uint row, uint column) public onlyRegistered whenPlayerTurn onlyFreeSquare(row, column) {
        if (msg.sender == playerOne) {
            board[row][column] = 1;
	    } else {
            board[row][column] = 2;
	    }

        turn = !turn;

        emit Played(msg.sender, row, column);
    }
}