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
/// The finally the customer can accepte one of thoes values and payed the ether to engineer.


interface InterfaceOfCuntract {

    /// @dev Fallback function allows to deposit ether.
  //  Fallback() public payable ;
 
    /*
    * Public functions
    */


    ///  Allows to add a new customer in the network.
    function addCustomer(address payable customerAddress , string memory yourName)external returns (bool) ;

    ///  Allows to add a new engineer in the network.
    function addEngineer( address payable _engineerAddress, string memory _yourName) external returns (bool);

    ///  Allows to add a project by customer in the network.
    function addProject(string memory yourName,string memory skills,
    string memory information,uint averageOfprice , uint id) external payable returns(bool);

    ///  Allows to Edit a project that customer add in the network.
    function EditProject(string memory yourName,string memory skills,
    string memory information,uint averageOfprice ,uint id ) external returns (string memory);
   
    ///  Allows a Engineer and customer and users for view the project.
    function getProject(address _customerAddress) external view returns(string memory yourName,
    string memory skills,string memory information,uint averageOfprice , uint id);

    ///  Allows a Engineer set a favorite price project.
   function chooseToWork(address _customerAddress,uint day,uint price,string memory moreInfo) external  returns(string memory);

    ///  Allows a customer for view the price of the project that engineer add it and payed that price.
    function accepteCustomer(address payable _engineerAddress) external payable returns(bool);

}
