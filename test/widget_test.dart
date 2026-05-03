import 'package:flutter_test/flutter_test.dart';
import 'package:user_directory_app/main.dart';

void main() {
  testWidgets('App launches successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const UserDirectoryApp());
    expect(find.text('👥 User Directory'), findsOneWidget);
  });
}
