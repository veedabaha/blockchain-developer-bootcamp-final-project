
// SPDX-License-Identifier: MIT
pragma solidity >=0.4.24 <0.9.0;
// @title supply chain in small daily business 
/// @author veeda baha - <veedabaha@gmail.com>
/// Allows the customer to add their project or works in to the network.
/// Projects can be accessed by customers and Engineers .
/// The customers can be shared or add ,get,edit and delete their projects 
/// The engineers can allow to see the record of the project.
/// after the Engineer select a project for doing that set a value or price to that project.
/// The custommer can see the price or value that Engineer add in to the system.
/// The finilly the customer can accepte one of thoes values and payed the ether to engineer.

 import "./InterfaceOfCuntract.sol";

contract SmallBusiness is InterfaceOfCuntract{
    
    //  variables
    address public owner ;
    uint public deal;
    address En =Engineers[msg.sender].engineerAddress;

    //enum
    enum State{
      forSell,
      Finish,
      primsion,
      unprmision
    }
  
    //struct of customers
    
    struct customer{
        address payable customerAddress;
        string Name;
    }
    
    //struct of Engineers
    struct Engineer{
      address payable engineerAddress;
        string Name;
        State state;
       
    }
    
    //struct of projects
   struct Project{
       address owner;
        string Name;
        State state;
        string skills;
        string information;
        uint averageOfprice;
     
    }

    // struct of offer
    struct offer{
        uint256 price;
        uint256 day;
        string moreInform;
    }
    
    /* 
   * Events
   */
      /// @notice Emitted when a Engineer is registred 
    /// @param _address Engineer address
    event logAddCustomer(address _address);

    /// @notice Emitted when a customer is registred 
    /// @param _address customer address
    event logAddEngineers(address _address);

    /// @notice Emitted when a Project is posted 
    /// @param _customerAddress is the address of Project
    event PostProject(address _customerAddress);

    /// @notice Emitted when Engineer add a price for working on project 
    /// @param  _customerAddress is the address of Project
    /// @param price is the price that customer send to Engineer
    event chooseTheProject(address _customerAddress , uint price);
  
    //mapping
    
    // store the offers of the Engineers with their project id
    mapping( address => offer) public offers;
    
    //store struct of customers in mapping with their addresses
    mapping(address => customer) public customers;
    
    //store struct of Engineers in mapping with their addresses
    mapping (address=> Engineer) public Engineers;
    
     //store struct of projects in mapping with their addresses
    mapping (address => Project) public projects;
    
    /* 
   * Modifiers
   */

    // Create a modifer, isOwner that checks if the msg.sender is the owner of the contract

    modifier verifyCaller (address _address) { 
    require (msg.sender == _address); 
    _;
    }
    
    modifier isOwner () { 
    require (owner == msg.sender,
    "Caller is not owner"); 
    _;
    }
 
    modifier isCustomer(address _address){
        require( customers[_address].customerAddress == _address,
        "this account is not Customer.");
        _;
    }
    
    modifier isEngineer(address _Engineer){
        require(Engineers[_Engineer].engineerAddress== _Engineer,
        "caller isnot Engineer");
        _;
    }

    modifier forSell(address _customerAddress){
       require(projects[_customerAddress].owner != address(0), 
       "The project is not nothing");
       require(projects[_customerAddress].state == State.forSell,
       "the project has already done..");
       _;
    }
    
    modifier Finish(address _customerAddress){
       require(projects[_customerAddress].owner != address(0), 
       "The project is not nothing");
       require(projects[_customerAddress].state == State.Finish,
       "this Project has already been for sell");
       _;
    }
    modifier verifyState(){
        require(Engineers[msg.sender].state == State.primsion,
        "this account already set value");
        _;
    }

    constructor() {
        owner = msg.sender;
        deal=0;
    }
    
    //add customer`s address in to mapping
    //add the parameters of customer in to struct
    
    function addCustomer(address payable customerAddress , 
    string memory yourName) 
    public override 
    returns(bool) {
        require(customers[customerAddress].customerAddress == address(0),
        "this address is already registred");
        customers[customerAddress]=customer({
            customerAddress : customerAddress,
            Name : yourName
        });
        emit logAddCustomer(customerAddress);
        deal = deal + 1;
        return true;
    } 
    
    
    //add Engineers`s address in to mapping
    //add more details in to Engineer`s struct
    
    function addEngineer(address payable _engineerAddress,string memory _yourName) public override returns(bool){
        require(Engineers[_engineerAddress].engineerAddress == address(0),
        "this address already registred.");
        Engineers[_engineerAddress] = Engineer({
            engineerAddress : _engineerAddress,
            Name :_yourName,
            state :State.primsion
        });
    emit logAddEngineers(_engineerAddress);
     deal = deal + 1;
    return true;

    }
    
    ///add Project`s id in to mapping
    ///check the state of project should be forSell
    ///check the modifier is customer to call that function 
    ///the customer should call that function
    
    function addProject(string memory Name,
    string memory skills,string memory information
    ,uint averageOfprice ) 
    public override payable 
    verifyCaller(msg.sender) 
    returns(bool){
        require(projects[msg.sender].owner == address(0), 
        "this project already is exist.");
        require(msg.value>=averageOfprice,
        "the value you send should be less than your current average.");
        projects[msg.sender] = Project({
            owner:msg.sender,
            Name:Name,
            skills:skills,
            information:information,
            averageOfprice:averageOfprice,
            state:State.forSell
           
             });
        deal = deal + 1;
        emit PostProject(msg.sender);
        return true;
    }

    function chooseToWork(address _customerAddress,uint256 day, uint price , string memory information)  public override isEngineer(msg.sender)   forSell(_customerAddress) verifyState() 
    returns(string memory){
        offers[msg.sender] = offer({
            price: price,
            day:day,
            moreInform:information
        });
        Engineers[msg.sender].state == State.unprmision;
        emit chooseTheProject(msg.sender,price);
        return "set value on project";
    }

    function accepteCustomer(address payable _engineerAddress) public payable override isCustomer(msg.sender) forSell(msg.sender) returns(bool) {
        require(Engineers[_engineerAddress].engineerAddress == _engineerAddress ,
            "this account is not an engineer");
        require(customers[msg.sender].customerAddress == msg.sender ,
            "this customer is not Exist.");
        Project storage p = projects[msg.sender];
        p.state = State.Finish;
        offer storage o = offers[_engineerAddress];
        Engineer storage e = Engineers[_engineerAddress];
        address payable to = e.engineerAddress; 
        to.transfer(o.price *(1 ether));
        return true;
    }

    function EditProject(string memory _name,
        string memory _skills,
        string memory _information,uint _averageOfprice )
        public override
        verifyCaller(msg.sender)
        forSell(msg.sender)
        returns (string memory)   
        { 
      
        Project memory p = projects[msg.sender];
           p.owner = msg.sender;
           p.Name = _name;
           p.state= State.forSell;
           p.skills= _skills;
           p.information = _information;
           p. averageOfprice = _averageOfprice;
          
             
        
        return "the project was update"; 
    }

    // get project parameters
    function getProject(address _customerAddress) public view override 
    verifyCaller(msg.sender) 
    forSell(_customerAddress)
    returns (string memory Name,string memory skills,
    string memory information,uint averageOfprice )   
    {
        Project storage p = projects[_customerAddress];
        return (p.Name,p.skills,p.information,p.averageOfprice  ); 
    }
    

    //can delete the project with the id of project
    function deleteProject(address _customerAddress) 
    public override 
    isCustomer(msg.sender) 
    returns(string memory){

        Project storage p = projects[_customerAddress];
        p.owner= address(0);
        p.Name = " ";
        p.skills = " ";
        p.information = " ";
        p.averageOfprice = 0 ;
        
        return "the project was delete";

    }


    // function paymentFull() public view  returns(uint){
    //     uint day =offers[msg.sender].day;
    //     uint a =day-(day*1/2);
    //     // require(offers[msg.sender].day == a )
    //     return a;

    // }


    function _passthevalue() public returns(string memory){
        Project storage p = projects[msg.sender];
        require(p.state == State.Finish ,"this project was not finish");
        address payable to = customers[msg.sender].customerAddress ; 
        uint value = address(this).balance;
        to.transfer(value);
        return "the value is return";
    }

    function getBalance() external view returns(uint){
        return address(this).balance;
    }


}