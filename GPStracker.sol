pragma solidity >=0.4.17 <0.6.0;
import "./Point.sol";


contract GPSTRacker {
    
    // ALl latitudes must be multiplied by 10.000 before calling in this contract
    //last position inserted
    Point lastLocation;
    
    //current position
    Point currentLocation;
    
    //travelled distance
    uint256 private travelledDistance;
    //Array of travelled Points
    Point[] private locations;
    
    
    
    // add input multipled by 10.000
    constructor(int256 _latitude, int256 _longitude) public{
        currentLocation = new Point(_latitude, _longitude);
        lastLocation = new Point(_latitude, _longitude);
        locations = new Point[](1);
        
        locations[0] = currentLocation;
        
        travelledDistance = 0;
    }
    

    //Adds a new position to the array, recalculating the travelled distance
    function addPosition(Point _newLocation) public
    {
        travelledDistance += lastLocation.calculateDistance(_newLocation);
        lastLocation = _newLocation;
        addToList(_newLocation);
    }
    //Gets how many positions are there in the array of travelled locations
    function getTotalPositions() public view returns(uint256)
    {
        return locations.length;
    }
    
    //Gets the true distance travelled
    function getDistanceFromStart() public view returns(uint256)
    {
        return locations[0].calculateDistance(lastLocation);
    }
    
    //Gets the travelled distance
    function getTravelledDistance() public view returns(uint256)
    {
        return travelledDistance;
    }
    //Gets and specific position in the array
    function getPosition(uint _pos) public view returns(Point location)
    {
        location = locations[_pos];
    }
    
    //Private functions
    //Inserts the point in the array
    function addToList(Point _location) private
    {
        locations.push(_location);
    }
    
}
 

