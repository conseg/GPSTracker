pragma solidity >=0.4.17 <0.6.0;

import "https://github.com/Sikorkaio/sikorka/contracts/trigonometry.sol";


contract Point {
    
    int256 private latitude;
    int256 private longitude;
    
    constructor(int256 _latitude, int256 _longitude) public{
        latitude = _latitude;
        longitude = _longitude;
    }
    
    function getLatitude() public view returns(int256){
        return latitude;   
    }
    function getLongitude() public view returns(int256){
        return longitude;   
    }
    
    //function that calculates the distance between 2 points.
    //x = Δλ ⋅ cos φm
    //y = Δφ
    //d = R ⋅ √x² + y²
    function calculateDistance(Point p2) view public returns (uint) 
    {
        //converts to radiands
        int256 _lat1 = toRadiands(latitude);
        int256 _lat2 = toRadiands(p2.getLatitude());
        int256 _log1 = toRadiands(longitude);
        int256 _log2 = toRadiands(p2.getLongitude());
        
        int256 x = (_log2 - _log1 ) * cosineAdjusted( (p2.getLatitude() + latitude )  / 2 ) / 10000; // Multiplication adjustment
        
        //latitude delta 
        int256 y = _lat2 - _lat1;
        
        //emit Track(_lat1,_lat2,_log1, _log2,x,y);
        
        //return sqrt(uint256((x * x / 10000) + (y * y / 10000))) * 63710000 /10000; // Multiplication adjustment;
        return sqrt(uint256((x * x) + (y * y))) * 63710000 /10000; // Multiplication adjustment;
    }
    
    
    //Converts degrees in radiands
    function toRadiands(int256 degree) private pure returns (int256)
    {
        int256 PI = 31415;
        int256 radiands = degree * (PI / 180 ) / 10000;
        return radiands;
    }
    
    //Babylon method
    function sqrt(uint x) private pure returns (uint y) 
    {
        uint z = (x + 1) / 2;
        y = x;
        while (z < y) {
        y = z;
        z = (x / z + z) / 2;
        }
    }
    
    //rule of three
    function rtres(int256 _max1, int256 _min1, int256 _value, int256 _max2, int256 _min2) private pure returns (int256)
    {
        assert(_max1 > _min1);
        assert(_max2 > _min2);
        
        int256 max1 = _max1 - _min1;
        int256 max2 = _max2 - _min2;
        int256 value = _value - _min1;
        
        int256 retorno = (value * max2 ) / max1;
        
        return retorno + _min2;
    }
    
        //convert radiands
    function cosineAdjusted(int256 degree) private pure returns (int256)
    {
        int cosine = Trigonometry.cos(uint16(rtres(900000, 0, degree, 4096, 0)));
        //int256 cosineAdjusted  = 
        return rtres(32767, -32767, cosine, 10000, -10000); //32767: 1 e -1 em bits da biblioteca
    }
    
}