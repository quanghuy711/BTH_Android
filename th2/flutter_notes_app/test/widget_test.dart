import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_notes_app/screens/notes_list_screen.dart';

void main() {
  testWidgets('NotesListScreen displays notes correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: NotesListScreen()));

    expect(find.byType(ListView), findsOneWidget);
    expect(find.text('No notes available'), findsOneWidget);
  });

  testWidgets('Search functionality works', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: NotesListScreen()));

    // Simulate adding a note
    await tester.enterText(find.byType(TextField), 'Test Note');
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that the note appears in the list
    expect(find.text('Test Note'), findsOneWidget);

    // Simulate searching for the note
    await tester.enterText(find.byType(TextField), 'Test');
    await tester.pump();

    expect(find.text('Test Note'), findsOneWidget);
  });

  testWidgets('Swipe to delete note', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: NotesListScreen()));

    // Simulate adding a note
    await tester.enterText(find.byType(TextField), 'Test Note');
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Swipe to delete the note
    await tester.drag(find.text('Test Note'), Offset(-500.0, 0.0));
    await tester.pumpAndSettle();

    // Verify that the note has been deleted
    expect(find.text('Test Note'), findsNothing);
  });
}