class Users {
  final String uid;
  final String? phoneNumber;

  const Users(
    this.uid,
    this.phoneNumber,
  );

  @override
  List<Object?> get props => [uid, phoneNumber];
}
