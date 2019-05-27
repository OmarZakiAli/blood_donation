class Donator{

  String name;
  String phone;
  String bloodTybe;
  String address;
  Donator({this.name,this.address,this.bloodTybe,this.phone});

  Donator.fromJson( Map<dynamic, dynamic> unparsed){
    this.name=unparsed["name"];
    this.phone=unparsed["phone"];
    this.bloodTybe=unparsed["bloodTybe"];
    this.address=unparsed["address"];
  }


  toMap(){
    return{
      "name":this.name,
      "address":this.address,
      "bloodTybe":this.bloodTybe,
      "phone":this.phone
    };
}

}