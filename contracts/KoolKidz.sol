pragma solidity ^0.4.18;

import 'zeppelin-solidity/contracts/token/ERC721/ERC721Token.sol';
import 'zeppelin-solidity/contracts/ownership/Ownable.sol';

contract KoolKidz is ERC721Token, Ownable {
    event newKoolKidz(
      string name,
      string hometown,
      string hairColor,
      string eyeColor,
      string catchPhrase,
      string sport
    );

    string public name;
    uint constant PRICE = 0.00010 ether;

    function KoolKidz() public {
      name = "KoolKidz";
      createSuperKoolKid('Jules Avignon', 'Paris', 'Maron', 'Vert', 'Voulez vous couchez avec moi ce soir?', 'Foot');
    }

    /*
    modifier ownerOf(uint _koolKidzId) {
      require(msg.sender == koolKidzToOwner[_koolKidzId]);
      _;
    } */

    mapping(uint => address) koolKidzToOwner;


    struct KoolKid {
      string name;
      string hometown;
      string hairColor;
      string eyeColor;
      string catchPhrase;
      string sport;
    }

    KoolKid[] public schoolYard;

    function withdraw() external onlyOwner {
      owner.transfer(this.balance);
    }

    function createSuperKoolKid(
                      string _name,
                      string _hometown,
                      string _hairColor,
                      string _eyeColor,
                      string _catchPhrase,
                      string _sport) public payable {
        if (msg.sender != owner) {
          require(msg.value > PRICE);
        }
        uint id = schoolYard.push(KoolKid(_name, _hometown, _hairColor, _eyeColor, _catchPhrase, _sport));
        _mint(msg.sender, id);
        newKoolKidz(_name, _hometown, _hairColor, _eyeColor, _catchPhrase, _sport);
        koolKidzToOwner[id] = msg.sender;
    }

    function whoIsThisKid(uint _id) public view returns (string, string, string, string, string, string){
      KoolKid memory kid = schoolYard[_id];
      return (kid.name, kid.hometown, kid.hairColor, kid.eyeColor, kid.catchPhrase, kid.sport);
    }

    function whoLostTheirKid(uint _id) public view returns (address){
      return koolKidzToOwner[_id];
    }
}
