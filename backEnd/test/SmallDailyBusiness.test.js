const assert = require("assert")
const Project = artifacts.require('SmallDailyBusiness');

// let id ;
let address;
let project;

beforeEach(async () =>{
    // id = await web3.eth.Number();
    address = await web3.eth.getAccounts();
    project= await Project.new();  
})
describe("Testing" , ()=>{
  it('Contract deploys' , ()=>{
      assert.ok(project.address)
  } ),
describe("Variables", () => {
    it("should have an owner", async () => {
      assert.equal(typeof project.owner, 'function', "the contract has no owner");
    });

    it("should have an deal", async () => {
      assert.equal(typeof project.deal, 'function', "the contract has no number");
    });
  })
describe("enum State", () => {
    let enumState;
    before(() => {
      enumState = Project.enums.State;
      assert(
        enumState,
        "The contract should define an Enum called State"
      );
    });
    
    it("should define `forSell`", () => {
      assert(
        enumState.hasOwnProperty('forSell'),
        "The enum does not have a `forSell` value"
      );
    });

    it("should define `Finish`", () => {
      assert(
        enumState.hasOwnProperty('Finish'),
        "The enum does not have a `Finish` value"
      );
    });

    it("should define `primsion`", () => {
      assert(
        enumState.hasOwnProperty('primsion'),
        "The enum does not have a `primsion` value"
      );
    });

    it("should define `Received`", () => {
      assert(
        enumState.hasOwnProperty('unprmision'),
        "The enum does not have a `unprmision` value"
      );
    });
  })

describe("Emitted the function",()=>{

    it('A Customer can sign up once with their addrss and name',async()=>{
        await project.addCustomer(address[0],"veeda baha",{
          from:address[0]
        });
        let Customer = await project.customers(address[0],{
          from:address[0],
      });
      assert.equal(
          Customer[1],
          "veeda baha",
          "the name does not matched",
        );
        assert.equal(
          Customer[0],
          address[0],
          "the address does not matched",
        );
    }).timeout(10000),
    it('A Engineer can sign up once with their addrss and name for doing the Project',async()=>{
      await project.addEngineer(address[1],"alina sarvary",{
        from:address[1]
      });
      let Engineer = await project.Engineers(address[1],{
        from:address[1],
      });
       assert.equal(
        Engineer[1],
        "alina sarvary",
        "the name does not matched",
      );
      assert.equal(
        Engineer[0],
        address[1],
        "the address does not matched",
      );
  }).timeout(10000)

  it('the function Emitted for added the customers',async()=>{
    let E = false;
    const TX = await project.addCustomer(address[0],{
      from :address[0],
    });
    // console.log(TX)
    if(TX.logs[0].event =="logAddCustomer"){
      E = true;
    }
    assert.equal(
      E,
      true,
      "the Customer can not add ",
    );

}).timeout(10000);
it('the function Emitted for add Engineer',async()=>{
    let E = false;
    const TX = await project.addEngineer(address[0],{
      from :address[0],
    });
    // console.log(TX)
    if(TX.logs[0].event =="logAddEngineers"){
      E = true;
    }
    assert.equal(
      E,
      true,
      "the Engineer can not add ",
    );

}).timeout(10000);

});
})
