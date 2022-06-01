class Contacts {
  final int id;
  final String name;
  final int accountNumber;

  Contacts(this.id, this.name, this.accountNumber);

  @override
  String toString() {
    return 'Contact{id: $id, name: $name, accountNumber: $accountNumber}';
  }
}
