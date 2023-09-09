class Address {
  String premisesType;
  String address;

  Address(this.premisesType, this.address);

  @override
  String toString() {
    return address;
  }
}

Map<String, Address> addresses = {
  "Home": Address("Home", "Manekjee Street, Soldier Bazar, Karachi"),
  "Office": Address("Office", "FTC Building, Shahrah E Faisal"),
  "Other": Address("Other", "Bahadurabad"),
};
