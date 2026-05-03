class User {
  final int id;
  final String name;
  final String job;
  final String email;
  final String phone;

  const User({
    required this.id,
    required this.name,
    required this.job,
    required this.email,
    required this.phone,
  });

  User copyWith({
    int? id,
    String? name,
    String? job,
    String? email,
    String? phone,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      job: job ?? this.job,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  @override
  String toString() => 'User(id: $id, name: $name)';
}

final List<User> sampleUsers = [
  const User(
    id: 1,
    name: 'Danylo Marynych',
    job: 'JavaScript Backend Developer',
    email: 'danylo.marynych@oa.edu.ua',
    phone: '+380 50 123 45 67',
  ),
  const User(
    id: 2,
    name: 'Test Smith',
    job: 'UI/UX Designer',
    email: 'test@example.com',
    phone: '+380 99 111 22 33',
  ),
  const User(
    id: 3,
    name: 'qwerty',
    job: 'Frontend Developer',
    email: 'qwe@example.com',
    phone: '+380 73 345 67 89',
  ),
];
