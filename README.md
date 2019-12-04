# GPSTracker
This is an API with some functions that might help the user to keep a GPS Track in Ethereum Blockchain.
Made by [Henry Nunes](https://github.com/HenryNunes) and [Lucas Gavirachi Cardoso](https://github.com/LucasGCardoso) members of [CONSEG](https://github.com/conseg) group at PUCRS.

## Installation Process
You may use our API by importing both main files (GPStracker.sol and Point.sol) in your application, as follows:

`import "https://github.com/HenryNunes/GPSTracker/blob/master/GPStracker.sol";`
and
`import "https://github.com/HenryNunes/GPSTracker/blob/master/Point.sol";`

However, if you are not a big fan of imports and want to keep things as simple as possible, you can always copy and paste the hole code from this repo (or download it) and use it freely in your application.

## How it works
Our API consists in two files, named GPSTracker and Point. The Point contract has all functions (public and private) to calculate distance between geographic points, and has latitude and longitude as attribute.

The GPSTracker is the "main" contract, that calls the Point functions, and creates a start point when initialized. This is the contract you will want to use directly in your personal contract


## Observations
Notice that we use another API called [Trigonometry](https://github.com/Sikorkaio/sikorka/), made by [Sikorkaio](https://github.com/Sikorkaio), for the calculations that must be done. This API requires compiler version 0.4.17^ Be aware of that.
