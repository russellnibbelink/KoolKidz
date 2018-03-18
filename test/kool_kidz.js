var KoolKidz = artifacts.require('./KoolKidz.sol');

contract('KoolKidz', function(accounts) {
  it("should assert true", function(done) {
    var kool_kidz = KoolKidz.deployed();
    assert.isTrue(true);
    done();
  });
});

contract('KoolKidz:whoIsThisKid', function(accounts) {
  it("should return a correct string", function(done) {
    var kk = KoolKidz.deployed();
    kk.then(function(contract){
      return contract.whoIsThisKid.call(0); // **IMPORTANT
    }).then(function(result){
      console.log(result[0]);
      assert.isTrue(result[0] === 'Jules Avignon');
      done();
    })
  });
});
