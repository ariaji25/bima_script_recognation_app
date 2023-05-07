part of 'models.dart';

class Question {
  final int id;
  final String text;
  final List<Option> options;
  String solution;

  Question({
    required this.id,
    required this.text,
    required this.options,
    required this.solution,
  });
  factory Question.fromJson(Map<String, dynamic> data) => Question(
      id: data['id'],
      text: data['foto'],
      solution: '',
      options:
          (data['option'] as Iterable).map((e) => Option.fromJson(e)).toList());
  Question copyWith({int? id, String? text, required List<Option> options}) {
    return Question(
        id: id ?? this.id,
        solution: solution,
        text: text ?? this.text,
        options: options);
  }

  //  Map<String, dynamic> toJson() => _$QuestionToJson(this);
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'solution': solution,
    };
  }
}

final questions = [
  Question(
    id: 1,
    text: 'Which planet is the hottest in the solar system?',
    options: [
      const Option(
        code: 'A',
        text: 'Earth',
      ),
      const Option(
        code: 'B',
        text: 'Venus',
      ),
      const Option(
        code: 'C',
        text: 'Jupiter',
      ),
      const Option(
        code: 'D',
        text: 'Saturn',
      ),
    ],
    solution: 'Venus is the hottest planet in the solar system',
  ),
  Question(
    id: 2,
    text: 'How many molecules of oxygen does ozone have?',
    options: [
      const Option(
        code: 'A',
        text: '1',
      ),
      const Option(
        code: 'B',
        text: '2',
      ),
      const Option(
        code: 'C',
        text: '5',
      ),
      const Option(
        code: 'D',
        text: '3',
      ),
    ],
    solution: 'Ozone have 3 molecules of oxygen',
  ),
  Question(
    id: 3,
    text: 'What is the symbol for potassium?',
    options: [
      const Option(
        code: 'A',
        text: 'N',
      ),
      const Option(
        code: 'B',
        text: 'S',
      ),
      const Option(
        code: 'C',
        text: 'P',
      ),
      const Option(
        code: 'D',
        text: 'K',
      ),
    ],
    solution: 'The symbol for potassium is K',
  ),
  Question(
    id: 4,
    text:
        'Which of these plays was famously first performed posthumously after the playwright committed suicide?',
    options: [
      const Option(
        code: 'A',
        text: '4.48 Psychosis',
      ),
      const Option(
        code: 'B',
        text: 'Hamilton',
      ),
      const Option(
        code: 'C',
        text: "Much Ado About Nothing",
      ),
      const Option(
        code: 'D',
        text: "The Birthday Party",
      ),
    ],
    solution: '4.48 Psychosis is the correct answer for this question',
  ),
  Question(
    id: 20,
    text: 'What year was the very first model of the iPhone released?',
    options: [
      const Option(
        code: 'A',
        text: '2005',
      ),
      const Option(
        code: 'B',
        text: '2008',
      ),
      const Option(
        code: 'C',
        text: '2007',
      ),
      const Option(
        code: 'D',
        text: '2006',
      ),
    ],
    solution: 'iPhone was first released in 2007',
  ),
  Question(
    id: 5,
    text: ' Which element is said to keep bones strong?',
    options: [
      const Option(
        code: 'A',
        text: 'Carbon',
      ),
      const Option(
        code: 'B',
        text: 'Oxygen',
      ),
      const Option(
        code: 'C',
        text: 'Calcium',
      ),
      Option(
        code: 'D',
        text: 'Pottasium',
      ),
    ],
    solution: 'Calcium is the element responsible for keeping the bones strong',
  ),
  Question(
    id: 6,
    text: 'What country won the very first FIFA World Cup in 1930?',
    options: [
      const Option(
        code: 'A',
        text: 'Brazil',
      ),
      const Option(
        code: 'B',
        text: 'Germany',
      ),
      const Option(
        code: 'C',
        text: 'Italy',
      ),
      const Option(
        code: 'D',
        text: 'Uruguay',
      ),
    ],
    solution: 'Uruguay was the first country to win world cup',
  ),
  Question(
    id: 7,
    text: 'What country won the very first FIFA World Cup in 1930?',
    options: [
      const Option(
        code: 'A',
        text: 'Brazil',
      ),
      const Option(
        code: 'B',
        text: 'Germany',
      ),
      const Option(
        code: 'C',
        text: 'Italy',
      ),
      const Option(
        code: 'D',
        text: 'Uruguay',
      ),
    ],
    solution: 'Uruguay was the first country to win world cup',
  ),
  Question(
    id: 8,
    text: 'What country won the very first FIFA World Cup in 1930?',
    options: [
      const Option(
        code: 'A',
        text: 'Brazil',
      ),
      const Option(
        code: 'B',
        text: 'Germany',
      ),
      const Option(
        code: 'C',
        text: 'Italy',
      ),
      const Option(
        code: 'D',
        text: 'Uruguay',
      ),
    ],
    solution: 'Uruguay was the first country to win world cup',
  ),
  Question(
    id: 9,
    text: 'What country won the very first FIFA World Cup in 1930?',
    options: [
      const Option(
        code: 'A',
        text: 'Brazil',
      ),
      const Option(
        code: 'B',
        text: 'Germany',
      ),
      const Option(
        code: 'C',
        text: 'Italy',
      ),
      const Option(
        code: 'D',
        text: 'Uruguay',
      ),
    ],
    solution: 'Uruguay was the first country to win world cup',
  ),
  Question(
    id: 10,
    text: 'What country won the very first FIFA World Cup in 1930?',
    options: [
      const Option(
        code: 'A',
        text: 'Brazil',
      ),
      const Option(
        code: 'B',
        text: 'Germany',
      ),
      const Option(
        code: 'C',
        text: 'Italy',
      ),
      const Option(
        code: 'D',
        text: 'Uruguay',
      ),
    ],
    solution: 'Uruguay was the first country to win world cup',
  ),
  Question(
    id: 11,
    text: 'What country won the very first FIFA World Cup in 1930?',
    options: [
      const Option(
        code: 'A',
        text: 'Brazil',
      ),
      const Option(
        code: 'B',
        text: 'Germany',
      ),
      const Option(
        code: 'C',
        text: 'Italy',
      ),
      const Option(
        code: 'D',
        text: 'Uruguay',
      ),
    ],
    solution: 'Uruguay was the first country to win world cup',
  ),
  Question(
    id: 12,
    text: 'What country won the very first FIFA World Cup in 1930?',
    options: [
      const Option(
        code: 'A',
        text: 'Brazil',
      ),
      const Option(
        code: 'B',
        text: 'Germany',
      ),
      const Option(
        code: 'C',
        text: 'Italy',
      ),
      const Option(
        code: 'D',
        text: 'Uruguay',
      ),
    ],
    solution: 'Uruguay was the first country to win world cup',
  ),
  Question(
    id: 13,
    text: 'What country won the very first FIFA World Cup in 1930?',
    options: [
      const Option(
        code: 'A',
        text: 'Brazil',
      ),
      const Option(
        code: 'B',
        text: 'Germany',
      ),
      const Option(
        code: 'C',
        text: 'Italy',
      ),
      const Option(
        code: 'D',
        text: 'Uruguay',
      ),
    ],
    solution: 'Uruguay was the first country to win world cup',
  ),
  Question(
    id: 14,
    text: 'What country won the very first FIFA World Cup in 1930?',
    options: [
      const Option(
        code: 'A',
        text: 'Brazil',
      ),
      const Option(
        code: 'B',
        text: 'Germany',
      ),
      const Option(
        code: 'C',
        text: 'Italy',
      ),
      const Option(
        code: 'D',
        text: 'Uruguay',
      ),
    ],
    solution: 'Uruguay was the first country to win world cup',
  ),
  Question(
    id: 15,
    text: 'What country won the very first FIFA World Cup in 1930?',
    options: [
      const Option(
        code: 'A',
        text: 'Brazil',
      ),
      const Option(
        code: 'B',
        text: 'Germany',
      ),
      const Option(
        code: 'C',
        text: 'Italy',
      ),
      const Option(
        code: 'D',
        text: 'Uruguay',
      ),
    ],
    solution: 'Uruguay was the first country to win world cup',
  ),
  Question(
    id: 16,
    text: 'What country won the very first FIFA World Cup in 1930?',
    options: [
      const Option(
        code: 'A',
        text: 'Brazil',
      ),
      const Option(
        code: 'B',
        text: 'Germany',
      ),
      const Option(
        code: 'C',
        text: 'Italy',
      ),
      const Option(
        code: 'D',
        text: 'Uruguay',
      ),
    ],
    solution: 'Uruguay was the first country to win world cup',
  ),
  Question(
    id: 17,
    text: 'What country won the very first FIFA World Cup in 1930?',
    options: [
      const Option(
        code: 'A',
        text: 'Brazil',
      ),
      const Option(
        code: 'B',
        text: 'Germany',
      ),
      const Option(
        code: 'C',
        text: 'Italy',
      ),
      const Option(
        code: 'D',
        text: 'Uruguay',
      ),
    ],
    solution: 'Uruguay was the first country to win world cup',
  ),
  Question(
    id: 18,
    text: 'What country won the very first FIFA World Cup in 1930?',
    options: [
      const Option(
        code: 'A',
        text: 'Brazil',
      ),
      const Option(
        code: 'B',
        text: 'Germany',
      ),
      const Option(
        code: 'C',
        text: 'Italy',
      ),
      const Option(
        code: 'D',
        text: 'Uruguay',
      ),
    ],
    solution: 'Uruguay was the first country to win world cup',
  ),
  Question(
    id: 19,
    text: 'What country won the very first FIFA World Cup in 1930?',
    options: [
      const Option(
        code: 'A',
        text: 'Brazil',
      ),
      const Option(
        code: 'B',
        text: 'Germany',
      ),
      const Option(
        code: 'C',
        text: 'Italy',
      ),
      const Option(
        code: 'D',
        text: 'Uruguay',
      ),
    ],
    solution: 'Uruguay was the first country to win world cup',
  ),
];
