class Address {
  static List<Map<String, dynamic>> addressList = [
    {
      'addressName': 'Home',
      'addressDetails': 'Soldier Bazar Street.',
      'addressSelected': true,
    },
    {
      'addressName': 'Office',
      'addressDetails': 'Shahrah e Faisal',
      'addressSelected': false,
    }
  ];

  static void addAddress(String name, String details, bool selected) {
    final newAddress = {
      'addressName': name,
      'addressDetails': details,
      'addressSelected': selected,
    };
    addressList.add(newAddress);
  }
}
