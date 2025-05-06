// Define the QuizQuestion class
import 'package:flutter/material.dart';
import 'dart:math';

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });
}

// Define the quiz difficulty levels
enum QuizLevel {
  beginner,
  intermediate,
  advanced,
}

// Define the quiz topics
enum QuizTopic {
  programming,
  networking,
  database,
  operatingSystem,
  dsa,
  webDevelopment,
  cloudComputing,
}

// Extension to get readable names for topics and levels
extension QuizTopicExtension on QuizTopic {
  String get displayName {
    switch (this) {
      case QuizTopic.programming:
        return 'Programming';
      case QuizTopic.networking:
        return 'Computer Networks';
      case QuizTopic.database:
        return 'Database (DBMS)';
      case QuizTopic.operatingSystem:
        return 'Operating System';
      case QuizTopic.dsa:
        return 'Data Structures & Algorithms';
      case QuizTopic.webDevelopment:
        return 'Web Development';
      case QuizTopic.cloudComputing:
        return 'Cloud Computing';
    }
  }
}

extension QuizLevelExtension on QuizLevel {
  String get displayName {
    switch (this) {
      case QuizLevel.beginner:
        return 'Beginner';
      case QuizLevel.intermediate:
        return 'Intermediate';
      case QuizLevel.advanced:
        return 'Advanced';
    }
  }
}

// Quiz manager to fetch the questions for a given topic and level
class QuizManager {
  static List<QuizQuestion> getQuestions(QuizTopic topic, QuizLevel level) {
    // Fetch all questions for the given topic and level
    List<QuizQuestion> allQuestions =
        fetchQuestionsForTopicAndLevel(topic, level);

    // Shuffle the questions
    allQuestions.shuffle(Random());

    // Return only the first 10 questions
    return allQuestions.take(10).toList();
  }

  // Method to get questions based on topic and level
  static List<QuizQuestion> fetchQuestionsForTopicAndLevel(
      QuizTopic topic, QuizLevel level) {
    // We'll return questions from our predefined sets
    switch (topic) {
      case QuizTopic.programming:
        return _getProgrammingQuestions(level);
      case QuizTopic.networking:
        return _getNetworkingQuestions(level);
      case QuizTopic.database:
        return _getDatabaseQuestions(level);
      case QuizTopic.operatingSystem:
        return _getOSQuestions(level);
      case QuizTopic.dsa:
        return _getDSAQuestions(level);
      case QuizTopic.webDevelopment:
        return _getWebDevQuestions(level);
      case QuizTopic.cloudComputing:
        return _getCloudQuestions(level);
    }
  }

  // Python questions based on level
  static List<QuizQuestion> _getProgrammingQuestions(QuizLevel level) {
    switch (level) {
      case QuizLevel.beginner:
        return [
          QuizQuestion(
              question:
                  "What is the output of the following Python code?\n\nx = 5\nprint(x + 2)",
              options: ["5", "7", "2", "Error"],
              correctIndex: 1,
              explanation:
                  "This code adds 2 to the variable x (which is 5) and prints the result, which is 7."),
          QuizQuestion(
              question:
                  "In Python, which of the following is used to get user input?",
              options: ["get()", "input()", "scanf()", "readline()"],
              correctIndex: 1,
              explanation:
                  "The input() function in Python is used to read a line from the user via standard input."),
          QuizQuestion(
              question:
                  "What is the output of the following Java code?\n\nint x = 5;\nSystem.out.println(x++);",
              options: ["5", "6", "4", "Error"],
              correctIndex: 0,
              explanation:
                  "The post-increment operator (x++) increases the value after the current expression is evaluated. So it prints 5 first, then increments x to 6."),
          QuizQuestion(
              question:
                  "In C, which function is used to read a character from standard input?",
              options: ["scan()", "getc()", "readchar()", "input()"],
              correctIndex: 1,
              explanation:
                  "The getc() function in C is used to read a single character from an input stream (like standard input)."),
          QuizQuestion(
              question:
                  "What is the correct way to create a string variable in Java?",
              options: [
                "string name = \"John\";",
                "str name = \"John\";",
                "String name = \"John\";",
                "char name = \"John\";"
              ],
              correctIndex: 2,
              explanation:
                  "In Java, a string is declared using the String class with a capital 'S'."),
          QuizQuestion(
              question:
                  "Which of the following is NOT a primitive data type in Java?",
              options: ["int", "float", "String", "boolean"],
              correctIndex: 2,
              explanation:
                  "String is not a primitive data type in Java. It's a class that represents a sequence of characters."),
          QuizQuestion(
              question:
                  "What is the output of the following C++ code?\n\nint main() {\n  int x = 10;\n  cout << ++x;\n  return 0;\n}",
              options: ["10", "11", "9", "Error"],
              correctIndex: 1,
              explanation:
                  "The pre-increment operator (++x) increases the value before the expression is evaluated. So x is first incremented to 11, then printed."),
          QuizQuestion(
              question: "In Python, how do you create a list?",
              options: [
                "list = [1, 2, 3]",
                "list = (1, 2, 3)",
                "list = {1, 2, 3}",
                "list = <1, 2, 3>"
              ],
              correctIndex: 0,
              explanation:
                  "In Python, lists are created using square brackets []."),
          QuizQuestion(
              question:
                  "What does the following C code print?\n\nint main() {\n  printf(\"%d\", 5/2);\n  return 0;\n}",
              options: ["2.5", "2", "3", "2.0"],
              correctIndex: 1,
              explanation:
                  "In C, division between two integers results in an integer (truncated division). So 5/2 equals 2, not 2.5."),
          QuizQuestion(
              question: "Which keyword is used to define a function in Python?",
              options: ["function", "define", "def", "func"],
              correctIndex: 2,
              explanation:
                  "In Python, the 'def' keyword is used to define a function."),
          QuizQuestion(
              question:
                  "What is the correct way to write a single-line comment in Java?",
              options: [
                "# This is a comment",
                "/* This is a comment */",
                "// This is a comment",
                "<!-- This is a comment -->"
              ],
              correctIndex: 2,
              explanation: "In Java, single-line comments start with '//'."),
          QuizQuestion(
              question:
                  "In C++, which of the following is the correct way to include the standard input/output library?",
              options: [
                "#include <stdio.h>",
                "#include <iostream>",
                "import iostream",
                "using namespace std;"
              ],
              correctIndex: 1,
              explanation:
                  "In C++, the standard input/output library is included using '#include <iostream>'."),
          QuizQuestion(
              question:
                  "What is the output of the following Python code?\n\nprint(\"Hello\" + \"World\")",
              options: ["Hello World", "HelloWorld", "Hello + World", "Error"],
              correctIndex: 1,
              explanation:
                  "In Python, the + operator concatenates strings without adding spaces. So it prints 'HelloWorld'."),
          QuizQuestion(
              question:
                  "In C, what is the size of int data type (in most common implementations)?",
              options: ["1 byte", "2 bytes", "4 bytes", "8 bytes"],
              correctIndex: 2,
              explanation:
                  "In most modern C implementations, an int is 4 bytes (32 bits) in size."),
          QuizQuestion(
              question:
                  "What does the following Java code print?\n\nSystem.out.println(\"5\" + 2);",
              options: ["7", "52", "5 + 2", "Error"],
              correctIndex: 1,
              explanation:
                  "In Java, when a string is concatenated with a number, the number is converted to a string. So \"5\" + 2 results in the string \"52\"."),
          QuizQuestion(
              question:
                  "Which Python function converts a string to an integer?",
              options: ["str()", "int()", "float()", "convert_int()"],
              correctIndex: 1,
              explanation:
                  "The int() function in Python is used to convert a string to an integer value."),
          QuizQuestion(
              question: "In C++, what does the 'cout' stand for?",
              options: [
                "Character Output",
                "Common Output",
                "Console Output",
                "Class Output"
              ],
              correctIndex: 2,
              explanation:
                  "In C++, 'cout' stands for 'console output' and is used to output data to the standard output (screen)."),
          QuizQuestion(
              question: "What is the correct way to define a constant in Java?",
              options: [
                "const int MAX = 100;",
                "final int MAX = 100;",
                "#define MAX 100",
                "constant int MAX = 100;"
              ],
              correctIndex: 1,
              explanation:
                  "In Java, constants are defined using the 'final' keyword."),
          QuizQuestion(
              question:
                  "What is the output of the following C code?\n\nint main() {\n  int a = 5;\n  int b = ++a + a++;\n  printf(\"%d\", b);\n  return 0;\n}",
              options: ["10", "11", "12", "13"],
              correctIndex: 2,
              explanation:
                  "First ++a increments a to 6 and returns 6. Then a++ returns 6 and increments a to 7. So b = 6 + 6 = 12."),
          QuizQuestion(
              question:
                  "Which of the following is NOT a valid variable name in Python?",
              options: ["my_var", "_var", "1var", "myVar"],
              correctIndex: 2,
              explanation:
                  "Variable names in Python cannot start with a number. '1var' is not a valid variable name."),
          QuizQuestion(
              question:
                  "In Java, which access modifier makes a class member accessible only within the same class?",
              options: ["public", "protected", "private", "default"],
              correctIndex: 2,
              explanation:
                  "The 'private' access modifier restricts access to class members to only within the same class."),
          QuizQuestion(
              question:
                  "What is the output of the following C++ code?\n\nint main() {\n  bool x = true;\n  bool y = false;\n  cout << (x && y);\n  return 0;\n}",
              options: ["true", "false", "1", "0"],
              correctIndex: 3,
              explanation:
                  "In C++, when boolean values are printed, true is represented as 1 and false as 0. Since x && y is false, it prints 0."),
          QuizQuestion(
              question:
                  "What does the following Python code output?\n\nprint(3 * \"abc\")",
              options: ["3abc", "abcabcabc", "abc3", "9"],
              correctIndex: 1,
              explanation:
                  "In Python, multiplying a string by a number repeats the string that many times. So 3 * \"abc\" results in \"abcabcabc\"."),
          QuizQuestion(
              question:
                  "In C, which function is used to allocate memory dynamically?",
              options: ["alloc()", "malloc()", "new()", "allocate()"],
              correctIndex: 1,
              explanation:
                  "The malloc() function in C is used for dynamic memory allocation."),
          QuizQuestion(
              question: "Which operator is used for exponentiation in Python?",
              options: ["^", "**", "^^", "pow()"],
              correctIndex: 1,
              explanation:
                  "In Python, the ** operator is used for exponentiation. For example, 2**3 equals 8.")
        ];
      case QuizLevel.intermediate:
        return [
          QuizQuestion(
              question:
                  "What is the output of the following Python code?\n\ndef modify(lst):\n  lst.append(4)\n  lst = [7, 8, 9]\n  return lst\n\nmy_list = [1, 2, 3]\nprint(modify(my_list))\nprint(my_list)",
              options: [
                "[7, 8, 9], [1, 2, 3]",
                "[7, 8, 9], [1, 2, 3, 4]",
                "[1, 2, 3, 4], [1, 2, 3, 4]",
                "[1, 2, 3, 4], [7, 8, 9]"
              ],
              correctIndex: 1,
              explanation:
                  "First, lst.append(4) modifies the original list. Then lst = [7, 8, 9] creates a new list and assigns it to lst, but this doesn't affect my_list. So modify() returns [7, 8, 9], and my_list becomes [1, 2, 3, 4]."),
          QuizQuestion(
              question:
                  "In Java, which of the following statements about interfaces is true?",
              options: [
                "Interfaces can have method implementations",
                "A class can implement multiple interfaces",
                "Interfaces can have instance variables",
                "Interfaces can be instantiated"
              ],
              correctIndex: 1,
              explanation:
                  "In Java, a class can implement multiple interfaces, which is a way to achieve a form of multiple inheritance. Interfaces traditionally contain only method declarations (although Java 8+ allows default method implementations)."),
          QuizQuestion(
              question:
                  "What is the output of the following C++ code?\n\nint main() {\n  int arr[5] = {1, 2, 3, 4, 5};\n  int *ptr = arr + 1;\n  cout << *ptr << \" \" << *(ptr+2);\n  return 0;\n}",
              options: ["1 3", "2 4", "2 5", "1 5"],
              correctIndex: 1,
              explanation:
                  "arr + 1 points to the second element of the array, which is 2. ptr+2 points to the fourth element, which is 4. So it prints '2 4'."),
          QuizQuestion(
              question: "In Python, what is a decorator?",
              options: [
                "A design pattern used for GUI elements",
                "A function that takes another function and extends its behavior",
                "A class attribute used for styling",
                "A type of comment used for documentation"
              ],
              correctIndex: 1,
              explanation:
                  "In Python, a decorator is a function that takes another function as input and extends or modifies its behavior without explicitly changing the original function's code."),
          QuizQuestion(
              question:
                  "What does the following C code do?\n\nvoid swap(int *a, int *b) {\n  int temp = *a;\n  *a = *b;\n  *b = temp;\n}",
              options: [
                "Compares two integers",
                "Swaps two integers using their addresses",
                "Creates a temporary variable but doesn't swap",
                "Returns the larger of two integers"
              ],
              correctIndex: 1,
              explanation:
                  "This function swaps the values of two integers by using pointers to access and modify their addresses in memory."),
          QuizQuestion(
              question:
                  "In Java, what is the difference between '==' and 'equals()' when comparing objects?",
              options: [
                "No difference, they are identical",
                "'==' compares object references, equals() compares content",
                "'==' compares content, equals() compares references",
                "'==' works only with primitives, equals() only with objects"
              ],
              correctIndex: 1,
              explanation:
                  "In Java, '==' compares if two references point to the same object in memory, while equals() is a method that compares the content or value of objects."),
          QuizQuestion(
              question:
                  "What is the output of the following Python code?\n\nclass Test:\n  x = 0\n  def __init__(self):\n    self.x = 1\n\nt1 = Test()\nt2 = Test()\nt1.x = 2\nTest.x = 3\nprint(t1.x, t2.x, Test.x)",
              options: ["2 1 3", "3 3 3", "2 3 3", "2 1 0"],
              correctIndex: 0,
              explanation:
                  "t1.x is set to 1 in __init__ and then explicitly to 2. t2.x is set to 1 in __init__ and never changed. Test.x is changed to 3, but this doesn't affect instance attributes that have already been set."),
          QuizQuestion(
              question: "In C++, what is the purpose of a virtual function?",
              options: [
                "To create a function that doesn't exist yet",
                "To hide a function from other classes",
                "To ensure proper function overriding in derived classes",
                "To create a function that runs automatically"
              ],
              correctIndex: 2,
              explanation:
                  "Virtual functions in C++ ensure that the correct function is called for an object, regardless of the reference type used. They enable polymorphism through function overriding in derived classes."),
          QuizQuestion(
              question:
                  "What is the output of the following Java code?\n\nStringBuilder sb = new StringBuilder(\"Java\");\nsb.append(\" is \").append(\"awesome\");\nSystem.out.println(sb);",
              options: ["Java", "Java is", "awesome", "Java is awesome"],
              correctIndex: 3,
              explanation:
                  "StringBuilder in Java allows for mutable string operations. Each append() call modifies the StringBuilder object, and the final result is 'Java is awesome'."),
          QuizQuestion(
              question: "In C, what is the purpose of the 'volatile' keyword?",
              options: [
                "To make a variable faster to access",
                "To indicate a variable might change unexpectedly",
                "To make a variable thread-safe",
                "To prevent a variable from being modified"
              ],
              correctIndex: 1,
              explanation:
                  "The 'volatile' keyword in C tells the compiler that a variable's value may change at any time without any action being taken by the code the compiler finds nearby, such as by an interrupt service routine or a separate thread."),
          QuizQuestion(
              question:
                  "What is the output of the following Python code?\n\nx = [1, 2, 3]\ny = x\ny.append(4)\nprint(x)",
              options: ["[1, 2, 3]", "[1, 2, 3, 4]", "[4, 1, 2, 3]", "Error"],
              correctIndex: 1,
              explanation:
                  "In Python, when you assign a list to another variable, both variables reference the same list object. So modifying y also modifies x, resulting in [1, 2, 3, 4]."),
          QuizQuestion(
              question: "In Java, what does the 'super' keyword do?",
              options: [
                "Refers to the current object",
                "Creates a new superclass",
                "Refers to the parent class",
                "Makes a method run faster"
              ],
              correctIndex: 2,
              explanation:
                  "The 'super' keyword in Java refers to the parent class. It's used to call parent class methods and access parent class constructors."),
          QuizQuestion(
              question:
                  "What is the output of the following C++ code?\n\nint main() {\n  int i = 5;\n  cout << sizeof(i++) << endl;\n  cout << i << endl;\n  return 0;\n}",
              options: ["4 5", "4 6", "5 5", "5 6"],
              correctIndex: 0,
              explanation:
                  "sizeof is an operator that returns the size of its operand, which for an int is typically 4 bytes. The expression inside sizeof() is not evaluated at runtime, so i is not incremented. Therefore, i remains 5."),
          QuizQuestion(
              question:
                  "In Python, which of the following is true about generators?",
              options: [
                "They compute all values before returning any",
                "They use yield statements to return values one at a time",
                "They can only generate numeric sequences",
                "They always return a list"
              ],
              correctIndex: 1,
              explanation:
                  "Python generators use yield statements to return values one at a time and maintain their state between calls, which makes them memory-efficient for processing large sequences."),
          QuizQuestion(
              question:
                  "What does the following C code snippet do?\n\nint x = 10;\nint y = 20;\nx ^= y ^= x ^= y;",
              options: [
                "Sets both x and y to 0",
                "Swaps the values of x and y",
                "Causes undefined behavior",
                "Computes the bitwise XOR of x and y"
              ],
              correctIndex: 2,
              explanation:
                  "This code attempts to swap x and y using bitwise XOR, but it causes undefined behavior in C because the same variable (x) is modified multiple times between sequence points."),
          QuizQuestion(
              question:
                  "In Java, what is the result of the following expression?\n\n\"5\" + 2 + 3",
              options: ["10", "523", "55", "53"],
              correctIndex: 1,
              explanation:
                  "Java evaluates expressions from left to right. First, \"5\" + 2 concatenates to \"52\", then \"52\" + 3 concatenates to \"523\"."),
          QuizQuestion(
              question: "In C++, what is a friend function?",
              options: [
                "A function that's called frequently",
                "A function that can access private members of a class",
                "A function that's inherited from a parent class",
                "A function that returns a boolean value"
              ],
              correctIndex: 1,
              explanation:
                  "A friend function in C++ is a non-member function that has been granted access to private and protected members of a class."),
          QuizQuestion(
              question:
                  "What is the output of the following Python code?\n\ndef func(a=[], b={}):\n  a.append(len(a))\n  b[len(b)] = len(b)\n  return a, b\n\nprint(func())\nprint(func())",
              options: [
                "([0], {0: 0}), ([0], {0: 0})",
                "([0], {0: 0}), ([0, 1], {0: 0, 1: 1})",
                "([0], {0: 0}), ([1], {1: 1})",
                "([0, 1], {0: 0, 1: 1}), ([0, 1, 2], {0: 0, 1: 1, 2: 2})"
              ],
              correctIndex: 3,
              explanation:
                  "In Python, default arguments are evaluated only once at function definition. So both calls use the same list and dict objects. The first call returns ([0], {0: 0}), and the second call returns ([0, 1, 2], {0: 0, 1: 1, 2: 2})."),
          QuizQuestion(
              question:
                  "In Java, what is the purpose of the 'transient' keyword?",
              options: [
                "To make a variable thread-safe",
                "To prevent a variable from being modified",
                "To exclude a variable from serialization",
                "To make a variable accessible from other classes"
              ],
              correctIndex: 2,
              explanation:
                  "The 'transient' keyword in Java indicates that a variable should not be serialized when the object containing it is serialized."),
          QuizQuestion(
              question:
                  "What does the following C code do?\n\n#define SQUARE(x) x*x\nint result = SQUARE(2+3);",
              options: [
                "Calculates 5*5 = 25",
                "Calculates 2+3*2+3 = 11",
                "Causes a compilation error",
                "Creates a function named SQUARE"
              ],
              correctIndex: 1,
              explanation:
                  "The macro SQUARE(x) expands to x*x, so SQUARE(2+3) becomes 2+3*2+3, which equals 11 due to operator precedence. This demonstrates why macros need careful parentheses."),
          QuizQuestion(
              question:
                  "In Python, what is the difference between a deep copy and a shallow copy?",
              options: [
                "Deep copy is faster, shallow copy is more memory-efficient",
                "Deep copy duplicates nested objects, shallow copy only duplicates the top level",
                "Deep copy only works with lists, shallow copy works with all collections",
                "There is no difference"
              ],
              correctIndex: 1,
              explanation:
                  "A shallow copy creates a new object but inserts references to the objects found in the original. A deep copy creates a new object and recursively copies the objects found in the original."),
          QuizQuestion(
              question:
                  "What is the output of the following C++ code?\n\nint main() {\n  int a = 10;\n  int& ref = a;\n  ref = 20;\n  cout << a << endl;\n  return 0;\n}",
              options: ["10", "20", "Error", "0"],
              correctIndex: 1,
              explanation:
                  "In C++, ref is a reference to a. When we change ref, we're actually changing a. So a becomes 20."),
          QuizQuestion(
              question:
                  "In Java, what is the purpose of the 'static' keyword when applied to a method?",
              options: [
                "It makes the method run faster",
                "It associates the method with the class rather than instances",
                "It prevents the method from being overridden",
                "It makes the method accessible only within the class"
              ],
              correctIndex: 1,
              explanation:
                  "A static method in Java belongs to the class rather than instances of the class. It can be called using the class name without needing to create an object."),
          QuizQuestion(
              question:
                  "What is the result of the following C expression?\n\nprintf(\"%d\", 1 << 3);",
              options: ["4", "8", "3", "16"],
              correctIndex: 1,
              explanation:
                  "The << operator in C is a bitwise left shift. 1 << 3 shifts the binary representation of 1 (001) three places to the left, resulting in 8 (1000 in binary).")
        ];
      case QuizLevel.advanced:
        return [
          QuizQuestion(
              question:
                  "What is the output of the following Python code?\n\nclass Meta(type):\n  def __new__(mcs, name, bases, namespace):\n    namespace['x'] = 5\n    return super().__new__(mcs, name, bases, namespace)\n\nclass Test(metaclass=Meta):\n  pass\n\nprint(Test.x)\nprint(hasattr(Test(), 'x'))",
              options: ["5 False", "5 True", "Error", "None True"],
              correctIndex: 1,
              explanation:
                  "This code uses a metaclass to add the class attribute 'x' with value 5 to the Test class. Since 'x' is a class attribute, it's accessible both through the class (Test.x) and through instances (Test().x), so hasattr(Test(), 'x') returns True."),
          QuizQuestion(
              question:
                  "In Java, what is the output of the following code?\n\npublic class Test {\n  public static void main(String[] args) {\n    Integer a = 127;\n    Integer b = 127;\n    Integer c = 128;\n    Integer d = 128;\n    System.out.println(a == b);\n    System.out.println(c == d);\n  }\n}",
              options: ["true true", "false false", "true false", "false true"],
              correctIndex: 2,
              explanation:
                  "Java caches Integer objects with values from -128 to 127. So a and b reference the same cached object, but c and d are different objects. The == operator checks reference equality, not value equality."),
          QuizQuestion(
              question:
                  "What is the output of the following C++ code?\n\ntemplate<int N>\nstruct Factorial {\n  static const int value = N * Factorial<N-1>::value;\n};\n\ntemplate<>\nstruct Factorial<0> {\n  static const int value = 1;\n};\n\nint main() {\n  cout << Factorial<5>::value << endl;\n  return 0;\n}",
              options: ["1", "5", "25", "120"],
              correctIndex: 3,
              explanation:
                  "This code uses template metaprogramming to calculate the factorial of 5 at compile-time. Factorial<5>::value is 5 * Factorial<4>::value, which is 5 * 24 = 120."),
          QuizQuestion(
              question:
                  "In Python, what does the following code do?\n\nfrom functools import lru_cache\n\n@lru_cache(maxsize=None)\ndef fib(n):\n  if n < 2:\n    return n\n  return fib(n-1) + fib(n-2)\n\nprint(fib(30))",
              options: [
                "Prints the 30th Fibonacci number using an inefficient algorithm",
                "Prints the 30th Fibonacci number using memoization for efficiency",
                "Causes a stack overflow",
                "Prints a random number"
              ],
              correctIndex: 1,
              explanation:
                  "The code uses the lru_cache decorator to implement memoization, which caches the results of function calls to avoid redundant computations. This makes the recursive Fibonacci implementation efficient by avoiding exponential complexity."),
          QuizQuestion(
              question:
                  "What does the following C code do?\n\nunsigned int count_set_bits(unsigned int n) {\n  unsigned int count = 0;\n  while (n) {\n    n &= (n - 1);\n    count++;\n  }\n  return count;\n}",
              options: [
                "Counts the number of 1s in the binary representation of n",
                "Counts the number of 0s in the binary representation of n",
                "Counts the number of bits needed to represent n",
                "Returns the logarithm base 2 of n"
              ],
              correctIndex: 0,
              explanation:
                  "This is Brian Kernighan's algorithm for counting set bits. The expression n &= (n - 1) clears the least significant set bit. The loop runs once for each set bit in n."),
          QuizQuestion(
              question:
                  "In Java, what is the output of the following code?\n\npublic class Test {\n  public static void main(String[] args) {\n    String s1 = new String(\"java\");\n    String s2 = s1.intern();\n    String s3 = \"java\";\n    System.out.println(s1 == s2);\n    System.out.println(s2 == s3);\n  }\n}",
              options: ["true true", "false true", "true false", "false false"],
              correctIndex: 1,
              explanation:
                  "The intern() method returns the canonical representation of the string. s1 is a new String object, so s1 == s2 is false. But s2 is the interned string 'java', which is the same object as the string literal s3, so s2 == s3 is true."),
          QuizQuestion(
              question:
                  "What is the output of the following C++ code?\n\nint main() {\n  std::vector<int> vec{1, 2, 3, 4, 5};\n  auto it = vec.begin() + 2;\n  vec.erase(vec.begin());\n  std::cout << *it;\n  return 0;\n}",
              options: ["2", "3", "Undefined behavior", "Runtime error"],
              correctIndex: 2,
              explanation:
                  "When elements are erased from a vector, iterators pointing to or after the erased element become invalidated. Using the invalidated iterator 'it' results in undefined behavior."),
          QuizQuestion(
              question:
                  "In Python, what is the result of the following code?\n\nclass A:\n  def __init__(self):\n    self.x = 1\n\n  def __getattribute__(self, name):\n    if name == 'y':\n      return 2\n    return super().__getattribute__(name)\n\na = A()\nprint(a.x, a.y)",
              options: [
                "1 None",
                "1 2",
                "Error: 'A' object has no attribute 'y'",
                "Error: maximum recursion depth exceeded"
              ],
              correctIndex: 1,
              explanation:
                  "The __getattribute__ method intercepts all attribute access. When a.y is accessed, the method returns 2 instead of raising an AttributeError. For a.x, it delegates to the default implementation."),
          QuizQuestion(
              question:
                  "What will be the output of the following Java code?\n\npublic class Test {\n  public static void main(String[] args) {\n    List<String> list = new ArrayList<>();\n    list.add(\"A\");\n    list.add(\"B\");\n    list.add(\"C\");\n    Iterator<String> iter = list.iterator();\n    while (iter.hasNext()) {\n      String s = iter.next();\n      if (s.equals(\"B\")) {\n        list.remove(s);\n      }\n    }\n    System.out.println(list);\n  }\n}",
              options: [
                "[A, C]",
                "[A, B]",
                "ConcurrentModificationException",
                "[A, B, C]"
              ],
              correctIndex: 2,
              explanation:
                  "This code throws a ConcurrentModificationException because it's trying to modify the list (list.remove()) while iterating over it using an Iterator. The correct way would be to use iter.remove() instead."),
          QuizQuestion(
              question:
                  "What does the following C code print?\n\n#include <stdio.h>\nint main() {\n  int a[5] = {1, 2, 3, 4, 5};\n  int *p = (int*)((char*)a + 1);\n  printf(\"%d\", *p);\n  return 0;\n}",
              options: [
                "1",
                "2",
                "A value that depends on the system's endianness",
                "Undefined behavior"
              ],
              correctIndex: 2,
              explanation:
                  "This code involves type punning and depends on the system's endianness. It tries to access memory at an offset of 1 byte from the start of the array. On little-endian systems, it might print part of the first integer mixed with part of the second."),
          QuizQuestion(
              question:
                  "In Python, what is the output of the following code?\n\nclass Meta(type):\n  def __call__(cls, *args, **kwargs):\n    instance = super().__call__(*args, **kwargs)\n    instance.created = True\n    return instance\n\nclass Test(metaclass=Meta):\n  pass\n\nt = Test()\nprint(t.created)",
              options: ["True", "False", "None", "Error"],
              correctIndex: 0,
              explanation:
                  "This code overrides the metaclass's __call__ method, which is called when creating a new instance of Test. It adds a 'created' attribute set to True to each new instance."),
          QuizQuestion(
              question:
                  "What is the output of the following C++ code?\n\nint main() {\n  auto lambda = [](auto a, auto b) {\n    return a + b;\n  };\n  \n  std::cout << lambda(1, 2.5);\n  return 0;\n}",
              options: ["3", "3.5", "3.0", "Error: cannot add int and double"],
              correctIndex: 1,
              explanation:
                  "This code uses a generic lambda (with 'auto' parameters) to add an int and a double. The result is 3.5, which is a double. C++ automatically promotes the int to a double for the addition."),
          QuizQuestion(
              question:
                  "In Java, what is the output of the following code?\n\npublic class Test {\n  public static void main(String[] args) {\n    try {\n      throw new RuntimeException();\n    } finally {\n      System.out.println(\"Finally\");\n    }\n    System.out.println(\"After\");\n  }\n}",
              options: [
                "Finally",
                "RuntimeException",
                "Finally followed by RuntimeException",
                "Compilation error"
              ],
              correctIndex: 3,
              explanation:
                  "This code will not compile. The statement System.out.println(\"After\"); is unreachable code because the try block always throws an exception and there's no catch block to handle it."),
          QuizQuestion(
              question:
                  "What is the output of the following C code?\n\n#include <stdio.h>\nvoid foo(const char** p) {\n  *p = \"World\";\n}\n\nint main() {\n  const char* str = \"Hello\";\n  foo(&str);\n  printf(\"%s\", str);\n  return 0;\n}",
              options: ["Hello", "World", "HelloWorld", "Error"],
              correctIndex: 1,
              explanation:
                  "The function foo takes a pointer to a pointer to const char and changes it to point to \"World\". Since we pass the address of str, str is updated to point to \"World\"."),
          QuizQuestion(
              question:
                  "In Python, what will the following code print?\n\nclass Descriptor:\n  def __get__(self, instance, owner):\n    return 42\n\nclass Test:\n  x = Descriptor()\n\nt = Test()\nprint(t.x)\nprint(Test.x)",
              options: [
                "42 42",
                "42 <__main__.Descriptor object>",
                "Error",
                "None None"
              ],
              correctIndex: 0,
              explanation:
                  "This demonstrates a descriptor in Python. When accessed through an instance (t.x), the __get__ method is called with the instance and class. When accessed through the class (Test.x), __get__ is called with None and the class."),
          QuizQuestion(
              question:
                  "What is the output of the following C++ code?\n\n#include <iostream>\n#include <vector>\n\nint main() {\n  std::vector<int> vec{1, 2, 3};\n  auto it = vec.begin();\n  vec.reserve(10);\n  std::cout << *it;\n  return 0;\n}",
              options: ["1", "0", "Undefined behavior", "Compilation error"],
              correctIndex: 2,
              explanation:
                  "When vector::reserve() causes a reallocation (as it does here), all iterators and references to elements of the vector are invalidated. Using the invalidated iterator 'it' results in undefined behavior."),
          QuizQuestion(
              question:
                  "In Java, what happens when the following code is executed?\n\npublic class Test {\n  public static void main(String[] args) {\n    String a = \"a\";\n    String b = \"b\";\n    String ab = \"ab\";\n    String c = a + b;\n    System.out.println(ab == c);\n    final String d = \"a\";\n    final String e = \"b\";\n    String f = d + e;\n    System.out.println(ab == f);\n  }\n}",
              options: ["true true", "false false", "true false", "false true"],
              correctIndex: 3,
              explanation:
                  "In Java, string concatenation with the + operator creates a new String object, so ab != c. However, when concatenating string literals or final variables, the compiler can optimize it into a single literal. So ab == f because f is compile-time constant."),
          QuizQuestion(
              question:
                  "What does the following C code do?\n\n#include <stdio.h>\n#include <stdlib.h>\n\nint main() {\n  for (int i = 0; i < 10; i++) {\n    char* p = (char*)malloc(1000);\n  }\n  return 0;\n}",
              options: [
                "Allocates 10,000 bytes of memory total",
                "Allocates and then frees 1,000 bytes of memory 10 times",
                "Causes a memory leak of 10,000 bytes",
                "Causes a stack overflow"
              ],
              correctIndex: 2,
              explanation:
                  "This code allocates 1,000 bytes of memory in each iteration of the loop, but never frees it. This results in a memory leak of 10 * 1,000 = 10,000 bytes."),
          QuizQuestion(
              question:
                  "In Python, what is the output of the following code?\n\nfrom contextlib import contextmanager\n\n@contextmanager\ndef my_context():\n  print(\"Enter\")\n  try:\n    yield 42\n  finally:\n    print(\"Exit\")\n\nwith my_context() as value:\n  print(value)\n  raise Exception(\"Error\")\n\nprint(\"Done\")",
              options: [
                "Enter 42 Exit Done",
                "Enter 42 Exit Exception: Error",
                "Enter 42 Exit",
                "Enter 42 Exception: Error"
              ],
              correctIndex: 2,
              explanation:
                  "This code creates a context manager that prints 'Enter', yields 42, and prints 'Exit' in the finally block. The with block raises an exception, which is not caught, so 'Done' is never printed. The output is 'Enter', '42', 'Exit', followed by an uncaught exception."),
          QuizQuestion(
              question:
                  "What is the output of the following Java code?\n\npublic class Test {\n  public static void main(String[] args) {\n    int i = 0;\n    outer: while (true) {\n      i++;\n      inner: for (int j = 0; j < 10; j++) {\n        if (j == 3) break inner;\n        if (i == 2) break outer;\n      }\n    }\n    System.out.println(i);\n  }\n}",
              options: ["1", "2", "3", "10"],
              correctIndex: 1,
              explanation:
                  "This code demonstrates labeled break statements in Java. When i becomes 2, the 'break outer' statement is executed, which breaks out of the while loop. So the final value of i is 2."),
          QuizQuestion(
              question:
                  "What does the following C++ code print?\n\n#include <iostream>\n\ntemplate<typename T>\nclass SmartPointer {\npublic:\n  SmartPointer(T* ptr) : ptr_(ptr) {}\n  ~SmartPointer() { delete ptr_; }\n  T* operator->() { return ptr_; }\nprivate:\n  T* ptr_;\n};\n\nstruct Test {\n  void print() { std::cout << \"Test\"; }\n};\n\nint main() {\n  SmartPointer<Test> ptr(new Test);\n  ptr->print();\n  return 0;\n}",
              options: [
                "Test",
                "0",
                "Nothing - it crashes",
                "Compilation error"
              ],
              correctIndex: 0,
              explanation:
                  "This code implements a simple smart pointer in C++ that automatically deletes the managed object when the smart pointer goes out of scope. The -> operator is overloaded to access members of the managed object. It prints 'Test'."),
          QuizQuestion(
              question:
                  "In Python, what is the output of the following code?\n\nclass MetaA(type): pass\nclass MetaB(type): pass\nclass MetaC(MetaA, MetaB): pass\n\nclass A(metaclass=MetaA): pass\nclass B(metaclass=MetaB): pass\n\ntry:\n  class C(A, B): pass\n  print(\"Success\")\nexcept Exception as e:\n  print(f\"Error: {type(e).__name__}\")",
              options: [
                "Success",
                "Error: TypeError",
                "Error: MetaclassConflictError",
                "Error: ValueError"
              ],
              correctIndex: 1,
              explanation:
                  "This code demonstrates metaclass conflicts in Python. When a class inherits from multiple classes with different metaclasses, Python raises a TypeError unless one metaclass is a subclass of all the other metaclasses. Here, neither MetaA nor MetaB is a subclass of the other."),
          QuizQuestion(
              question:
                  "What is the output of the following C code?\n\n#include <stdio.h>\n\nint main() {\n  int a[3][3] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};\n  int (*p)[3] = a;\n  printf(\"%d\", *(*p + 1));\n  return 0;\n}",
              options: ["1", "2", "4", "5"],
              correctIndex: 1,
              explanation:
                  "p is a pointer to an array of 3 integers, pointing to a[0]. *p is a[0], which is an array of 3 integers. *p + 1 is the address of a[0][1]. *(*p + 1) is a[0][1], which is 2."),
          QuizQuestion(
              question:
                  "In Java, what is the result of the following code?\n\npublic class Test {\n  public static void main(String[] args) {\n    int[] array = {1, 2, 3, 4, 5};\n    System.out.println(sum(array, 0));\n  }\n  \n  static int sum(int[] array, int index) {\n    if (index >= array.length) {\n      return 0;\n    } else {\n      return array[index] + sum(array, index + 1);\n    }\n  }\n}",
              options: ["0", "15", "10", "StackOverflowError"],
              correctIndex: 1,
              explanation:
                  "This code implements a recursive function to calculate the sum of all elements in an array. It returns array[0] + array[1] + array[2] + array[3] + array[4] + 0, which equals 15."),
          QuizQuestion(
              question:
                  "What is the output of the following C++ code?\n\n#include <iostream>\n\nclass Base {\npublic:\n  virtual ~Base() { std::cout << \"~Base\"; }\n};\n\nclass Derived : public Base {\npublic:\n  ~Derived() { std::cout << \"~Derived\"; }\n};\n\nint main() {\n  Base* ptr = new Derived();\n  delete ptr;\n  return 0;\n}",
              options: ["~Base", "~Derived", "~Derived~Base", "No output"],
              correctIndex: 2,
              explanation:
                  "When a derived class object is deleted through a base class pointer, the destructor calls are chained from derived to base if the base class destructor is virtual. So ~Derived is called first, followed by ~Base."),
          QuizQuestion(
              question:
                  "In Python, what is the output of the following code?\n\nclass Counter:\n  _instances = {}\n  \n  def __new__(cls, name):\n    if name in cls._instances:\n      return cls._instances[name]\n    instance = super().__new__(cls)\n    cls._instances[name] = instance\n    return instance\n  \n  def __init__(self, name):\n    self.name = name\n    self.count = 0\n  \n  def increment(self):\n    self.count += 1\n\nc1 = Counter('a')\nc1.increment()\nc2 = Counter('a')\nprint(c2.count)",
              options: ["0", "1", "2", "Error"],
              correctIndex: 1,
              explanation:
                  "This code implements the Singleton pattern in Python. Since c1 and c2 have the same name 'a', c2 is actually the same object as c1. So c2.count is 1 after c1.increment()."),
          QuizQuestion(
              question:
                  "What is the output of the following C code?\n\n#include <stdio.h>\n\nint main() {\n  char* s = \"Hello\";\n  s[0] = 'h';\n  printf(\"%s\", s);\n  return 0;\n}",
              options: [
                "Hello",
                "hello",
                "hello",
                "Undefined behavior or segmentation fault"
              ],
              correctIndex: 3,
              explanation:
                  "In C, string literals like \"Hello\" are stored in read-only memory. Attempting to modify a string literal leads to undefined behavior, often a segmentation fault. To make a modifiable string, use char s[] = \"Hello\"."),
          QuizQuestion(
              question:
                  "In Java, what is the output of the following code?\n\npublic class Test {\n  public static void main(String[] args) {\n    Thread t = new Thread(() -> {\n      try {\n        Thread.sleep(1000);\n        System.out.println(\"Thread\");\n      } catch (InterruptedException e) {}\n    });\n    t.setDaemon(true);\n    t.start();\n    System.out.println(\"Main\");\n  }\n}",
              options: ["Main Thread", "Thread Main", "Main", "Thread"],
              correctIndex: 2,
              explanation:
                  "This code creates a daemon thread that sleeps for 1 second before printing 'Thread'. The main thread prints 'Main' and then exits. When the main thread exits, all daemon threads are terminated, so 'Thread' is never printed."),
          QuizQuestion(
              question:
                  "What is the output of the following C++ code?\n\n#include <iostream>\n#include <memory>\n\nint main() {\n  std::shared_ptr<int> p1 = std::make_shared<int>(42);\n  std::weak_ptr<int> wp = p1;\n  {\n    std::shared_ptr<int> p2 = wp.lock();\n    if (p2) std::cout << *p2 << \" \";\n  }\n  p1.reset();\n  std::shared_ptr<int> p3 = wp.lock();\n  std::cout << (p3 ? \"Valid\" : \"Expired\");\n  return 0;\n}",
              options: [
                "42 Valid",
                "42 Expired",
                "Valid Valid",
                "Expired Expired"
              ],
              correctIndex: 1,
              explanation:
                  "This code demonstrates weak_ptr in C++. Inside the block, wp.lock() returns a valid shared_ptr p2 because p1 still owns the int. After p1.reset(), wp.lock() returns an empty shared_ptr because the referenced object has been destroyed."),
          QuizQuestion(
              question:
                  "In Python, what is the output of the following code?\n\nimport functools\n\ndef memoize(f):\n  cache = {}\n  @functools.wraps(f)\n  def wrapper(*args):\n    if args not in cache:\n      cache[args] = f(*args)\n    return cache[args]\n  return wrapper\n\n@memoize\ndef factorial(n):\n  print(f\"Computing factorial({n})\")\n  if n <= 1:\n    return 1\n  return n * factorial(n-1)\n\nprint(factorial(5))\nprint(factorial(3))",
              options: [
                "Computing factorial(5) Computing factorial(4) Computing factorial(3) Computing factorial(2) Computing factorial(1) 120 6",
                "Computing factorial(5) Computing factorial(4) Computing factorial(3) Computing factorial(2) Computing factorial(1) 120 Computing factorial(3) Computing factorial(2) Computing factorial(1) 6",
                "Computing factorial(5) Computing factorial(4) Computing factorial(3) Computing factorial(2) Computing factorial(1) 120 Computing factorial(3) 6",
                "Computing factorial(5) 120 Computing factorial(3) 6"
              ],
              correctIndex: 0,
              explanation:
                  "This code implements a memoization decorator that caches function results. For factorial(5), it computes and caches all values from 1 to 5. When factorial(3) is called, it reuses the cached result directly without recomputation."),
          QuizQuestion(
              question:
                  "What is the output of the following C code?\n\n#include <stdio.h>\n\nvoid strange(int n) {\n  if (n <= 0) return;\n  printf(\"%d \", n);\n  strange(n-2);\n  strange(n-1);\n}\n\nint main() {\n  strange(3);\n  return 0;\n}",
              options: ["3 1 2 1", "3 1 2", "3 2 1", "3"],
              correctIndex: 0,
              explanation:
                  "This function first prints n, then recursively calls itself with n-2 and n-1. For n=3, it prints 3, then calls strange(1) which prints 1, then calls strange(2) which prints 2 and calls strange(0) (no output) and strange(1) which prints 1."),
          QuizQuestion(
              question:
                  "In Java, what is the result of the following code?\n\npublic class Test {\n  public static void main(String[] args) {\n    int[] arr = {1, 2, 3, 4, 5};\n    int result = binarySearch(arr, 4, 0, arr.length - 1);\n    System.out.println(result);\n  }\n  \n  static int binarySearch(int[] arr, int target, int left, int right) {\n    if (left > right) return -1;\n    int mid = left + (right - left) / 2;\n    if (arr[mid] == target) return mid;\n    if (arr[mid] > target) return binarySearch(arr, target, left, mid - 1);\n    return binarySearch(arr, target, mid + 1, right);\n  }\n}",
              options: ["3", "4", "-1", "0"],
              correctIndex: 0,
              explanation:
                  "This code implements a binary search algorithm to find the index of the target value in a sorted array. The value 4 is at index 3 in the array {1, 2, 3, 4, 5}.")
        ];
    }
  }

  // Networking questions based on level
  static List<QuizQuestion> _getNetworkingQuestions(QuizLevel level) {
    switch (level) {
      case QuizLevel.beginner:
        return [
          QuizQuestion(
              question: "What does the acronym 'LAN' stand for in networking?",
              options: [
                "Local Area Network",
                "Long Access Node",
                "Linked Application Network",
                "Large Array Network"
              ],
              correctIndex: 0,
              explanation:
                  "LAN stands for Local Area Network, which is a network that connects computers within a limited area such as a home, school, or office building."),
          QuizQuestion(
              question:
                  "Which protocol is primarily used for browsing web pages on the Internet?",
              options: ["FTP", "HTTP", "SMTP", "DHCP"],
              correctIndex: 1,
              explanation:
                  "HTTP (Hypertext Transfer Protocol) is the foundation of data communication on the World Wide Web and is used for loading web pages using hypertext links."),
          QuizQuestion(
              question: "What is the purpose of an IP address?",
              options: [
                "To secure the network connection",
                "To uniquely identify devices on a network",
                "To increase internet speed",
                "To encrypt network traffic"
              ],
              correctIndex: 1,
              explanation:
                  "An IP (Internet Protocol) address serves as a unique identifier for devices on a network, allowing data packets to be routed to the correct destination."),
          QuizQuestion(
              question:
                  "Which layer of the OSI model is responsible for routing and forwarding data packets?",
              options: [
                "Transport Layer",
                "Data Link Layer",
                "Network Layer",
                "Session Layer"
              ],
              correctIndex: 2,
              explanation:
                  "The Network Layer (Layer 3) of the OSI model is responsible for packet routing and forwarding between different networks."),
          QuizQuestion(
              question:
                  "What device is used to connect different networks together?",
              options: ["Hub", "Switch", "Router", "Repeater"],
              correctIndex: 2,
              explanation:
                  "A router is used to connect different networks together and route data packets between them based on their IP addresses."),
          QuizQuestion(
              question:
                  "Which of the following is NOT a type of network topology?",
              options: ["Star", "Ring", "Pyramid", "Mesh"],
              correctIndex: 2,
              explanation:
                  "Pyramid is not a standard network topology. Common topologies include star, ring, bus, mesh, and hybrid configurations."),
          QuizQuestion(
              question: "What does DHCP stand for?",
              options: [
                "Dynamic Host Configuration Protocol",
                "Digital Host Control Program",
                "Data Handling Control Protocol",
                "Distributed Host Computing Process"
              ],
              correctIndex: 0,
              explanation:
                  "DHCP stands for Dynamic Host Configuration Protocol, which automatically assigns IP addresses and other network configuration parameters to devices on a network."),
          QuizQuestion(
              question:
                  "Which cable type is most commonly used for modern wired Ethernet connections?",
              options: [
                "Coaxial cable",
                "Fiber optic cable",
                "Twisted pair cable",
                "Serial cable"
              ],
              correctIndex: 2,
              explanation:
                  "Twisted pair cable, particularly Cat5e, Cat6, or Cat6a, is most commonly used for modern wired Ethernet connections in LANs."),
          QuizQuestion(
              question:
                  "What is the maximum length of a standard Ethernet cable before signal degradation becomes significant?",
              options: ["50 meters", "100 meters", "500 meters", "1000 meters"],
              correctIndex: 1,
              explanation:
                  "The maximum recommended length for a standard copper Ethernet cable (Cat5e/Cat6) is 100 meters before signal degradation becomes a problem."),
          QuizQuestion(
              question: "What does DNS stand for in networking?",
              options: [
                "Dynamic Network System",
                "Digital Naming Service",
                "Domain Name System",
                "Data Network Security"
              ],
              correctIndex: 2,
              explanation:
                  "DNS stands for Domain Name System, which translates human-readable domain names (like www.example.com) into IP addresses that computers use to identify each other."),
          QuizQuestion(
              question:
                  "Which of the following is the default port for HTTP traffic?",
              options: ["21", "23", "80", "443"],
              correctIndex: 2,
              explanation:
                  "Port 80 is the default port used for HTTP (Hypertext Transfer Protocol) traffic. HTTPS uses port 443."),
          QuizQuestion(
              question:
                  "What protocol is used to securely transfer files between computers?",
              options: ["HTTP", "FTP", "SFTP", "SMTP"],
              correctIndex: 2,
              explanation:
                  "SFTP (Secure File Transfer Protocol) is used to securely transfer files between computers, as it encrypts both commands and data."),
          QuizQuestion(
              question: "Which of the following is a private IP address range?",
              options: [
                "192.168.0.0 to 192.168.255.255",
                "209.85.0.0 to 209.85.255.255",
                "8.8.0.0 to 8.8.255.255",
                "64.233.160.0 to 64.233.191.255"
              ],
              correctIndex: 0,
              explanation:
                  "The IP address range 192.168.0.0 to 192.168.255.255 (192.168.0.0/16) is one of the private IP ranges reserved for local networks as defined in RFC 1918."),
          QuizQuestion(
              question:
                  "What device operates at Layer 2 of the OSI model and forwards data based on MAC addresses?",
              options: ["Router", "Switch", "Hub", "Repeater"],
              correctIndex: 1,
              explanation:
                  "A switch operates at Layer 2 (Data Link Layer) of the OSI model and forwards data packets based on MAC addresses within a local network."),
          QuizQuestion(
              question:
                  "What protocol is used to automatically assign IP addresses to devices on a network?",
              options: ["HTTP", "DHCP", "FTP", "SMTP"],
              correctIndex: 1,
              explanation:
                  "DHCP (Dynamic Host Configuration Protocol) is used to automatically assign IP addresses and other network configuration parameters to devices when they join a network."),
          QuizQuestion(
              question: "What is the purpose of a subnet mask?",
              options: [
                "To encrypt network traffic",
                "To identify which portion of an IP address refers to the network and which portion refers to the host",
                "To increase network speed",
                "To block unauthorized access to the network"
              ],
              correctIndex: 1,
              explanation:
                  "A subnet mask is used to identify which portion of an IP address refers to the network address and which portion refers to the host address, allowing for proper routing and network segmentation."),
          QuizQuestion(
              question:
                  "Which wireless networking standard operates at 2.4 GHz and has a theoretical maximum speed of 11 Mbps?",
              options: ["802.11a", "802.11b", "802.11g", "802.11n"],
              correctIndex: 1,
              explanation:
                  "IEEE 802.11b was one of the first widely adopted Wi-Fi standards. It operates in the 2.4 GHz band and has a theoretical maximum speed of 11 Mbps."),
          QuizQuestion(
              question: "What is the purpose of ARP in networking?",
              options: [
                "To resolve domain names to IP addresses",
                "To route packets across multiple networks",
                "To resolve IP addresses to MAC addresses",
                "To encrypt data during transmission"
              ],
              correctIndex: 2,
              explanation:
                  "ARP (Address Resolution Protocol) is used to resolve IP addresses to MAC (physical) addresses, which is essential for data transmission on a local network."),
          QuizQuestion(
              question: "Which of the following is NOT a valid IPv4 address?",
              options: ["192.168.1.1", "10.0.0.1", "172.16.254.1", "256.0.0.1"],
              correctIndex: 3,
              explanation:
                  "256.0.0.1 is not a valid IPv4 address because each octet in an IPv4 address must be between 0 and 255."),
          QuizQuestion(
              question: "What is the main function of a firewall in a network?",
              options: [
                "To speed up data transmission",
                "To monitor and control incoming and outgoing network traffic",
                "To connect different networks together",
                "To assign IP addresses to network devices"
              ],
              correctIndex: 1,
              explanation:
                  "A firewall monitors and controls incoming and outgoing network traffic based on predetermined security rules, protecting the network from unauthorized access and potential threats."),
          QuizQuestion(
              question:
                  "Which protocol is used to send emails between servers?",
              options: ["POP3", "IMAP", "SMTP", "HTTP"],
              correctIndex: 2,
              explanation:
                  "SMTP (Simple Mail Transfer Protocol) is used to send emails between servers. POP3 and IMAP are used for retrieving emails from a server to a client."),
          QuizQuestion(
              question:
                  "What is the broadcast address of the network 192.168.1.0/24?",
              options: [
                "192.168.1.0",
                "192.168.1.1",
                "192.168.1.254",
                "192.168.1.255"
              ],
              correctIndex: 3,
              explanation:
                  "The broadcast address of a network is the last address in the range. For a /24 network like 192.168.1.0, the broadcast address is 192.168.1.255."),
          QuizQuestion(
              question:
                  "Which layer of the TCP/IP model is responsible for providing logical addressing and routing?",
              options: [
                "Application Layer",
                "Transport Layer",
                "Internet Layer",
                "Network Interface Layer"
              ],
              correctIndex: 2,
              explanation:
                  "The Internet Layer of the TCP/IP model (equivalent to the Network Layer in OSI) is responsible for providing logical addressing (IP addresses) and routing between networks."),
          QuizQuestion(
              question:
                  "What is the primary purpose of NAT (Network Address Translation)?",
              options: [
                "To secure network communications",
                "To connect multiple LANs",
                "To conserve public IP addresses by allowing many private IPs to share a single public IP",
                "To increase network speed and efficiency"
              ],
              correctIndex: 2,
              explanation:
                  "NAT (Network Address Translation) primarily allows multiple devices on a private network to share a single public IP address, conserving the limited IPv4 address space."),
          QuizQuestion(
              question: "What does MAC stand for in the context of networking?",
              options: [
                "Media Access Control",
                "Multiple Access Channel",
                "Main Address Configuration",
                "Monitored Access Connection"
              ],
              correctIndex: 0,
              explanation:
                  "MAC stands for Media Access Control. A MAC address is a unique identifier assigned to a network interface controller for use as a network address in communications within a network segment."),
        ];
      case QuizLevel.intermediate:
        return [
          QuizQuestion(
              question: "What is the difference between TCP and UDP?",
              options: [
                "TCP is secure while UDP is not",
                "TCP is connection-oriented with guaranteed delivery while UDP is connectionless with no delivery guarantees",
                "TCP works only with IPv4 while UDP works with IPv6",
                "TCP is used only for file transfers while UDP is used for streaming"
              ],
              correctIndex: 1,
              explanation:
                  "TCP (Transmission Control Protocol) is connection-oriented and provides reliable, ordered delivery of data packets. UDP (User Datagram Protocol) is connectionless and does not guarantee delivery, ordering, or duplicate protection, but offers lower latency."),
          QuizQuestion(
              question:
                  "In the context of BGP routing, what is an Autonomous System (AS)?",
              options: [
                "A collection of routers under the same administrative control",
                "An automated system for routing updates",
                "A self-healing network connection",
                "A backup system for router failures"
              ],
              correctIndex: 0,
              explanation:
                  "In BGP routing, an Autonomous System (AS) is a collection of connected IP routing prefixes under the control of one or more network operators that presents a common, clearly defined routing policy to the internet."),
          QuizQuestion(
              question:
                  "Which IPv6 address is used for link-local communication?",
              options: ["::1", "2001:db8::/32", "fe80::/10", "ff00::/8"],
              correctIndex: 2,
              explanation:
                  "The IPv6 address range fe80::/10 is reserved for link-local addresses, which are used for communication within a local network segment and are not routable beyond that segment."),
          QuizQuestion(
              question:
                  "What is the purpose of STP (Spanning Tree Protocol) in a switched network?",
              options: [
                "To encrypt data between switches",
                "To prevent routing loops",
                "To prevent switching loops and broadcast storms",
                "To increase switching speed"
              ],
              correctIndex: 2,
              explanation:
                  "STP (Spanning Tree Protocol) prevents switching loops in a network with multiple paths by creating a loop-free logical topology, thus avoiding broadcast storms that can bring down a network."),
          QuizQuestion(
              question:
                  "What is the primary difference between a hub and a switch?",
              options: [
                "A hub operates at Layer 1 and forwards data to all ports, while a switch operates at Layer 2 and forwards data only to the intended recipient",
                "A hub uses IP addresses while a switch uses MAC addresses",
                "A hub is faster than a switch",
                "A hub provides better security than a switch"
              ],
              correctIndex: 0,
              explanation:
                  "A hub is a Layer 1 (Physical) device that broadcasts data to all connected devices, while a switch is a Layer 2 (Data Link) device that learns MAC addresses and forwards frames only to the specific port where the destination device is connected."),
          QuizQuestion(
              question: "What is the purpose of VLAN tagging in a network?",
              options: [
                "To encrypt data between different network segments",
                "To separate a physical network into multiple logical networks",
                "To increase network speed",
                "To authenticate users on the network"
              ],
              correctIndex: 1,
              explanation:
                  "VLAN tagging (IEEE 802.1Q) allows a physical network to be logically segmented into multiple virtual networks, improving security, traffic management, and network organization without changing the physical infrastructure."),
          QuizQuestion(
              question:
                  "Which field in the IPv4 header helps prevent packets from circulating indefinitely?",
              options: [
                "Checksum",
                "Time to Live (TTL)",
                "Fragment Offset",
                "Protocol"
              ],
              correctIndex: 1,
              explanation:
                  "The Time to Live (TTL) field in the IPv4 header is decremented by each router that forwards the packet. When it reaches zero, the packet is discarded, preventing it from circulating indefinitely in case of routing loops."),
          QuizQuestion(
              question:
                  "What is the purpose of OSPF's Designated Router (DR) in a broadcast network?",
              options: [
                "To authenticate all routers in the network",
                "To reduce routing traffic by centralizing LSA exchanges",
                "To encrypt routing information",
                "To provide a backup for the primary router"
              ],
              correctIndex: 1,
              explanation:
                  "In OSPF, the Designated Router (DR) reduces routing traffic on broadcast networks by centralizing Link State Advertisement (LSA) exchanges, with all routers sending updates to the DR which then disseminates them to all other routers."),
          QuizQuestion(
              question: "What is a 'three-way handshake' in TCP?",
              options: [
                "A security mechanism with three layers of authentication",
                "The process by which a TCP connection is established using SYN, SYN-ACK, and ACK packets",
                "A method to connect three different networks",
                "A backup mechanism if the primary connection fails"
              ],
              correctIndex: 1,
              explanation:
                  "The TCP three-way handshake is the process used to establish a TCP connection between two hosts. It consists of three steps: SYN (synchronize) from client to server, SYN-ACK (synchronize-acknowledge) from server to client, and ACK (acknowledge) from client to server."),
          QuizQuestion(
              question:
                  "Which technology bonds multiple network links together to increase throughput and provide redundancy?",
              options: [
                "Network Address Translation",
                "Quality of Service",
                "Link Aggregation",
                "Proxy ARP"
              ],
              correctIndex: 2,
              explanation:
                  "Link Aggregation (also known as port trunking, NIC teaming, or IEEE 802.3ad/802.1ax) combines multiple network connections in parallel to increase throughput and provide redundancy in case one link fails."),
          QuizQuestion(
              question:
                  "What is the key difference between a default gateway and a router?",
              options: [
                "They are completely different devices with different functions",
                "Default gateway is a concept referring to the router that connects to other networks",
                "A default gateway only handles local traffic, while a router handles external traffic",
                "Default gateway is a physical device, while router is a logical concept"
              ],
              correctIndex: 1,
              explanation:
                  "A default gateway is not a specific device but a concept referring to the router interface that a host uses to send packets when the destination is on a different network. A router is the physical device that performs this function."),
          QuizQuestion(
              question: "What is the main purpose of ICMP protocol?",
              options: [
                "To transfer files between hosts",
                "To establish secure connections",
                "To report errors and provide network diagnostics",
                "To assign IP addresses dynamically"
              ],
              correctIndex: 2,
              explanation:
                  "ICMP (Internet Control Message Protocol) is primarily used to report errors and provide network diagnostics. It's the protocol used by tools such as ping and traceroute to diagnose network problems."),
          QuizQuestion(
              question:
                  "In QoS (Quality of Service), what does the term 'jitter' refer to?",
              options: [
                "Variation in packet delay",
                "Packet loss percentage",
                "Maximum bandwidth available",
                "Signal strength fluctuation"
              ],
              correctIndex: 0,
              explanation:
                  "In QoS, jitter refers to the variation in the delay (latency) of received packets. High jitter can cause issues in real-time applications like VoIP or video conferencing where consistent timing is important."),
          QuizQuestion(
              question:
                  "What is the purpose of the ARP cache in a networked device?",
              options: [
                "To store frequently accessed web pages",
                "To store recently resolved IP addresses and their corresponding MAC addresses",
                "To store routing information",
                "To store DNS query results"
              ],
              correctIndex: 1,
              explanation:
                  "The ARP (Address Resolution Protocol) cache stores recently resolved mappings between IP addresses and MAC addresses, reducing the need to repeatedly send ARP requests for frequently contacted hosts on the local network."),
          QuizQuestion(
              question: "What is the primary purpose of MPLS in networking?",
              options: [
                "To secure data through encryption",
                "To manage IP address allocation",
                "To efficiently direct data from one network node to the next using labels rather than IP routing",
                "To translate between different network protocols"
              ],
              correctIndex: 2,
              explanation:
                  "MPLS (Multiprotocol Label Switching) uses short path labels rather than network addresses to direct data from one node to the next, improving speed and enabling traffic engineering, service quality, and virtual private networks."),
          QuizQuestion(
              question:
                  "When implementing a VPN, what is the purpose of an IPsec tunnel mode?",
              options: [
                "To optimize bandwidth usage",
                "To provide maximum speed for all applications",
                "To authenticate only certain users",
                "To encrypt the entire original IP packet and add a new IP header"
              ],
              correctIndex: 3,
              explanation:
                  "In IPsec tunnel mode, the entire original IP packet (including headers) is encrypted and encapsulated inside a new IP packet with a new header. This provides complete protection of the original packet's content and addressing information."),
          QuizQuestion(
              question:
                  "Which protocol is used by routers to exchange routing information in different autonomous systems?",
              options: ["OSPF", "RIP", "BGP", "EIGRP"],
              correctIndex: 2,
              explanation:
                  "BGP (Border Gateway Protocol) is used for exchanging routing information between different autonomous systems on the Internet. It's the protocol that makes the global Internet routing possible."),
          QuizQuestion(
              question:
                  "What is the purpose of a VRRP (Virtual Router Redundancy Protocol)?",
              options: [
                "To virtualize multiple physical routers",
                "To provide failover redundancy for the default gateway",
                "To secure router communications",
                "To increase routing speed"
              ],
              correctIndex: 1,
              explanation:
                  "VRRP (Virtual Router Redundancy Protocol) provides automatic assignment of available IP routers to participating hosts. This increases the availability and reliability of routing paths by using virtual router IDs that can fail over to backup physical routers."),
          QuizQuestion(
              question:
                  "What is the difference between an access control list (ACL) and a firewall?",
              options: [
                "They are different names for the same technology",
                "ACLs filter traffic based on IP addresses and ports while firewalls can also inspect packet contents",
                "ACLs protect only internal networks while firewalls protect external connections",
                "ACLs are hardware-based while firewalls are software-based"
              ],
              correctIndex: 1,
              explanation:
                  "ACLs are simple filters that permit or deny traffic based on source/destination addresses and ports. Firewalls are more sophisticated, often including stateful inspection, deep packet inspection, and application layer filtering capabilities."),
          QuizQuestion(
              question:
                  "In the context of Ethernet switching, what does MAC address aging refer to?",
              options: [
                "The process of expiring and removing MAC addresses from the switch's address table after a period of inactivity",
                "The gradual degradation of MAC addresses over time",
                "A security feature that changes MAC addresses periodically",
                "The process of prioritizing older MAC addresses over newer ones"
              ],
              correctIndex: 0,
              explanation:
                  "MAC address aging is the process where a switch removes MAC addresses from its address table after they haven't been used for a specified period (typically 5 minutes). This helps keep the table current and manages its size."),
          QuizQuestion(
              question:
                  "What is the primary function of HSRP (Hot Standby Router Protocol)?",
              options: [
                "To increase router processing speed",
                "To provide automatic router failover for a default gateway",
                "To encrypt router communications",
                "To balance loads across multiple routers"
              ],
              correctIndex: 1,
              explanation:
                  "HSRP (Hot Standby Router Protocol) is a Cisco proprietary protocol that provides automatic router failover for a default gateway. It allows several routers to work together to present the appearance of a single virtual router to hosts."),
          QuizQuestion(
              question:
                  "What is the difference between a collision domain and a broadcast domain?",
              options: [
                "They are different terms for the same concept",
                "A collision domain is where packet collisions can occur, while a broadcast domain is where broadcast packets are propagated",
                "A collision domain applies to WAN networks while broadcast domains apply to LANs",
                "A collision domain refers to physical connections while broadcast domains are logical"
              ],
              correctIndex: 1,
              explanation:
                  "A collision domain is a network segment where data packet collisions can occur (typically in half-duplex Ethernet). A broadcast domain is a logical division of a network where broadcast packets are confined (typically separated by routers)."),
          QuizQuestion(
              question:
                  "What is the purpose of a DMZ (Demilitarized Zone) in network architecture?",
              options: [
                "To increase network speed",
                "To provide a neutral area for storing classified data",
                "To isolate servers that need to be accessible from outside while protecting the internal network",
                "To separate different departments within an organization"
              ],
              correctIndex: 2,
              explanation:
                  "A DMZ (Demilitarized Zone) is a physical or logical subnetwork that separates an internal local area network from untrusted networks like the Internet. It allows external users to access services while maintaining internal network security."),
          QuizQuestion(
              question:
                  "What is the difference between symmetric and asymmetric encryption in network security?",
              options: [
                "Symmetric encryption is more secure than asymmetric encryption",
                "Symmetric encryption uses one key for both encryption and decryption, while asymmetric uses different keys for each",
                "Symmetric encryption works only on text while asymmetric works on all data types",
                "Symmetric encryption is used only for authentication while asymmetric is used for data transfer"
              ],
              correctIndex: 1,
              explanation:
                  "Symmetric encryption uses the same key for both encryption and decryption (faster but key distribution is challenging). Asymmetric encryption uses a public-private key pair, with one key for encryption and another for decryption (slower but solves key distribution)."),
          QuizQuestion(
              question:
                  "What does MTU stand for and why is it important in networking?",
              options: [
                "Maximum Transfer Unit - It defines the largest packet size that can be transferred on a network",
                "Multi-Token Usage - It controls how many devices can use the network simultaneously",
                "Managed Traffic Utility - It helps prioritize network traffic",
                "Master Timing Unit - It synchronizes all network devices"
              ],
              correctIndex: 0,
              explanation:
                  "MTU stands for Maximum Transmission Unit, which defines the largest packet or frame size that can be transmitted across a network. If a packet exceeds the MTU, it must be fragmented or dropped, affecting network performance and reliability.")
        ];
      case QuizLevel.advanced:
        return [
          QuizQuestion(
              question:
                  "Which layer of the OSI model is responsible for end-to-end communication and reliability?",
              options: [
                "Network Layer",
                "Transport Layer",
                "Session Layer",
                "Data Link Layer"
              ],
              correctIndex: 1,
              explanation:
                  "The Transport Layer (Layer 4) of the OSI model is responsible for end-to-end communication, reliability, flow control, and error recovery between devices across a network."),
          QuizQuestion(
              question:
                  "What is the maximum transmission distance for a standard Cat 5e Ethernet cable?",
              options: ["50 meters", "100 meters", "500 meters", "1000 meters"],
              correctIndex: 1,
              explanation:
                  "The maximum transmission distance for a standard Cat 5e Ethernet cable is 100 meters (328 feet) before signal degradation becomes significant."),
          QuizQuestion(
              question:
                  "Which protocol is used to convert domain names to IP addresses?",
              options: ["HTTP", "FTP", "DHCP", "DNS"],
              correctIndex: 3,
              explanation:
                  "DNS (Domain Name System) is the protocol used to convert human-readable domain names (like www.example.com) into IP addresses that computers use to identify each other on a network."),
          QuizQuestion(
              question:
                  "What is the default subnet mask for a Class C IP address?",
              options: [
                "255.0.0.0",
                "255.255.0.0",
                "255.255.255.0",
                "255.255.255.255"
              ],
              correctIndex: 2,
              explanation:
                  "The default subnet mask for a Class C IP address is 255.255.255.0, which allows for 254 host addresses within a subnet."),
          QuizQuestion(
              question:
                  "Which of the following is a connection-oriented protocol?",
              options: ["UDP", "TCP", "ICMP", "ARP"],
              correctIndex: 1,
              explanation:
                  "TCP (Transmission Control Protocol) is a connection-oriented protocol that establishes a connection before data transmission and ensures reliable delivery through acknowledgments and retransmissions."),
          QuizQuestion(
              question: "What does CIDR stand for in networking?",
              options: [
                "Classless Inter-Domain Routing",
                "Connection Identification Data Record",
                "Centralized Internet Data Registry",
                "Common Interface for Digital Resources"
              ],
              correctIndex: 0,
              explanation:
                  "CIDR (Classless Inter-Domain Routing) is a method for allocating IP addresses and routing IP packets that replaced the earlier classful network addressing architecture."),
          QuizQuestion(
              question:
                  "Which wireless standard operates at a maximum theoretical speed of 600 Mbps?",
              options: ["802.11a", "802.11b", "802.11g", "802.11n"],
              correctIndex: 3,
              explanation:
                  "IEEE 802.11n can operate at a maximum theoretical speed of up to 600 Mbps, significantly faster than previous standards like 802.11g (54 Mbps)."),
          QuizQuestion(
              question: "What is the purpose of NAT in networking?",
              options: [
                "To secure wireless communications",
                "To translate between domain names and IP addresses",
                "To translate between private and public IP addresses",
                "To validate network users"
              ],
              correctIndex: 2,
              explanation:
                  "NAT (Network Address Translation) translates private IP addresses from an internal network to public IP addresses, allowing multiple devices to share a single public IP address."),
          QuizQuestion(
              question:
                  "Which protocol is used to securely access a remote server?",
              options: ["FTP", "HTTP", "SSH", "SMTP"],
              correctIndex: 2,
              explanation:
                  "SSH (Secure Shell) is a cryptographic network protocol used for secure data communication, remote server access, and other secure network services between two networked computers."),
          QuizQuestion(
              question: "Which of the following is NOT a valid IPv4 address?",
              options: ["192.168.1.1", "256.0.0.1", "10.0.0.1", "172.16.0.1"],
              correctIndex: 1,
              explanation:
                  "256.0.0.1 is not a valid IPv4 address because each octet in an IPv4 address must be between 0 and 255 inclusive."),
          QuizQuestion(
              question: "What does HTTPS use to secure data transmission?",
              options: [
                "Encryption only",
                "Authentication only",
                "Compression",
                "Both encryption and authentication"
              ],
              correctIndex: 3,
              explanation:
                  "HTTPS (HTTP Secure) uses both encryption (typically TLS/SSL) and authentication to secure data transmission between a client and a web server."),
          QuizQuestion(
              question: "What is the main function of a router in a network?",
              options: [
                "To amplify network signals",
                "To connect multiple devices within a single network",
                "To forward data packets between computer networks",
                "To store network data for quick retrieval"
              ],
              correctIndex: 2,
              explanation:
                  "A router's main function is to forward data packets between computer networks, making decisions based on routing tables and IP addresses."),
          QuizQuestion(
              question:
                  "Which port number is typically used for HTTPS traffic?",
              options: ["21", "25", "80", "443"],
              correctIndex: 3,
              explanation:
                  "Port 443 is the standard port used for HTTPS (HTTP Secure) traffic, while port 80 is used for standard HTTP traffic."),
          QuizQuestion(
              question: "What is the purpose of ARP in networking?",
              options: [
                "To assign IP addresses automatically",
                "To translate domain names to IP addresses",
                "To map IP addresses to MAC addresses",
                "To route packets across networks"
              ],
              correctIndex: 2,
              explanation:
                  "ARP (Address Resolution Protocol) maps IP addresses to MAC (physical) addresses, which is essential for local network communication."),
          QuizQuestion(
              question:
                  "Which network device operates at the Data Link layer of the OSI model?",
              options: ["Router", "Switch", "Hub", "Gateway"],
              correctIndex: 1,
              explanation:
                  "A switch operates at the Data Link layer (Layer 2) of the OSI model, forwarding frames based on MAC addresses within a local network."),
          QuizQuestion(
              question: "What is a firewall primarily used for in networks?",
              options: [
                "Increasing network speed",
                "Monitoring network performance",
                "Filtering traffic based on security rules",
                "Managing bandwidth allocation"
              ],
              correctIndex: 2,
              explanation:
                  "A firewall is primarily used for filtering network traffic based on predetermined security rules, protecting networks from unauthorized access and potential threats."),
          QuizQuestion(
              question: "Which protocol is used for sending email?",
              options: ["POP3", "IMAP", "SMTP", "FTP"],
              correctIndex: 2,
              explanation:
                  "SMTP (Simple Mail Transfer Protocol) is used for sending email messages between servers, while protocols like POP3 and IMAP are used for retrieving emails."),
          QuizQuestion(
              question: "What is the purpose of ICMP in networking?",
              options: [
                "To establish secure connections",
                "To send error messages and operational information",
                "To transfer files between systems",
                "To assign IP addresses dynamically"
              ],
              correctIndex: 1,
              explanation:
                  "ICMP (Internet Control Message Protocol) is primarily used to send error messages and operational information indicating success or failure when communicating with another IP address."),
          QuizQuestion(
              question:
                  "Which of the following is an example of a link-state routing protocol?",
              options: ["RIP", "BGP", "OSPF", "EIGRP"],
              correctIndex: 2,
              explanation:
                  "OSPF (Open Shortest Path First) is an example of a link-state routing protocol that uses Dijkstra's algorithm to find the shortest path to each network."),
          QuizQuestion(
              question:
                  "What is the maximum number of hosts possible in a /24 network?",
              options: ["254", "255", "256", "510"],
              correctIndex: 0,
              explanation:
                  "A /24 network (equivalent to subnet mask 255.255.255.0) has 8 host bits, allowing for 2^8 - 2 = 254 usable host addresses. Two addresses are reserved for the network address and broadcast address."),
          QuizQuestion(
              question:
                  "Which protocol provides plug-and-play connectivity by automatically assigning IP addresses?",
              options: ["DHCP", "DNS", "NAT", "SNMP"],
              correctIndex: 0,
              explanation:
                  "DHCP (Dynamic Host Configuration Protocol) automatically assigns IP addresses and other network configuration parameters to devices on a network, enabling plug-and-play connectivity."),
          QuizQuestion(
              question: "What is a MAC address?",
              options: [
                "A logical address assigned by the network administrator",
                "A physical address hardcoded into a network interface",
                "A temporary address used during data transmission",
                "An encrypted address used for security"
              ],
              correctIndex: 1,
              explanation:
                  "A MAC (Media Access Control) address is a unique physical address hardcoded into a network interface card (NIC) by the manufacturer."),
          QuizQuestion(
              question:
                  "Which of the following is NOT a characteristic of UDP?",
              options: [
                "Connectionless",
                "Fast transmission",
                "No guarantee of delivery",
                "Error recovery"
              ],
              correctIndex: 3,
              explanation:
                  "UDP (User Datagram Protocol) does not provide error recovery. It is connectionless with no guarantee of delivery, but offers fast transmission with minimal overhead."),
          QuizQuestion(
              question: "What is the purpose of a VLAN in networking?",
              options: [
                "To increase network speed",
                "To segment a network logically irrespective of physical location",
                "To connect multiple WANs together",
                "To encrypt data transmission"
              ],
              correctIndex: 1,
              explanation:
                  "A VLAN (Virtual Local Area Network) segments a network logically regardless of physical location, improving security and network management by isolating network traffic."),
          QuizQuestion(
              question:
                  "Which layer of the OSI model handles encryption and decryption?",
              options: [
                "Transport Layer",
                "Session Layer",
                "Presentation Layer",
                "Application Layer"
              ],
              correctIndex: 2,
              explanation:
                  "The Presentation Layer (Layer 6) of the OSI model handles data translation, encryption, and decryption between the application and the network format."),
          QuizQuestion(
              question: "What does TTL stand for in networking?",
              options: [
                "Time To Live",
                "Transport Transfer Layer",
                "Total Traffic Load",
                "Transmission Time Limit"
              ],
              correctIndex: 0,
              explanation:
                  "TTL (Time To Live) is a value in an IP packet that determines how many hops (router traversals) the packet can make before being discarded, preventing packets from circulating indefinitely."),
          QuizQuestion(
              question: "Which of the following is a private IP address range?",
              options: [
                "11.0.0.0 to 11.255.255.255",
                "172.16.0.0 to 172.31.255.255",
                "192.169.0.0 to 192.170.255.255",
                "200.0.0.0 to 200.255.255.255"
              ],
              correctIndex: 1,
              explanation:
                  "172.16.0.0 to 172.31.255.255 is one of the three private IP address ranges defined by RFC 1918 for use in private networks. The others are 10.0.0.0/8 and 192.168.0.0/16."),
          QuizQuestion(
              question: "What is the main benefit of IPv6 over IPv4?",
              options: [
                "Faster connection speeds",
                "Better security features",
                "Much larger address space",
                "Simplified routing protocols"
              ],
              correctIndex: 2,
              explanation:
                  "The main benefit of IPv6 over IPv4 is its much larger address space (128-bit vs. 32-bit), providing approximately 3.4 × 10^38 addresses compared to IPv4's 4.3 billion addresses."),
          QuizQuestion(
              question:
                  "Which network topology offers the highest reliability?",
              options: ["Bus", "Star", "Ring", "Mesh"],
              correctIndex: 3,
              explanation:
                  "A mesh topology offers the highest reliability because it provides multiple paths between devices, ensuring communication can continue even if some connections fail."),
        ];
    }
  }

  // Database questions based on level
  static List<QuizQuestion> _getDatabaseQuestions(QuizLevel level) {
    switch (level) {
      case QuizLevel.beginner:
        return [
          QuizQuestion(
              question: "What is a Database Management System (DBMS)?",
              options: [
                "Software that enables users to create, maintain, and manipulate data in a database",
                "A physical storage device for keeping large amounts of data",
                "A programming language used for website development",
                "A network system that connects multiple computers"
              ],
              correctIndex: 0,
              explanation:
                  "A Database Management System (DBMS) is software that facilitates the creation, maintenance, and manipulation of databases. It provides an interface between users or applications and the database, handling tasks like data organization, storage, retrieval, security, and concurrent access."),
          QuizQuestion(
              question:
                  "Which of the following is NOT a typical component of a DBMS?",
              options: [
                "Web browser",
                "Query processor",
                "Storage manager",
                "Transaction manager"
              ],
              correctIndex: 0,
              explanation:
                  "A web browser is not a component of a DBMS. The typical components include a query processor (which interprets and optimizes database queries), a storage manager (which handles data storage and retrieval), and a transaction manager (which ensures the integrity and consistency of transactions)."),
          QuizQuestion(
              question: "What is a primary key in a database?",
              options: [
                "A column or set of columns that uniquely identifies each row in a table",
                "The first column in any database table",
                "The most important data field in a record",
                "The password used to access the database"
              ],
              correctIndex: 0,
              explanation:
                  "A primary key is a column or set of columns that uniquely identifies each row in a table. It must contain unique values and cannot contain NULL values. Primary keys are used to enforce entity integrity and to create relationships between tables."),
          QuizQuestion(
              question: "What does SQL stand for?",
              options: [
                "Structured Query Language",
                "System Quality Language",
                "Sequential Query Language",
                "Structured Question Language"
              ],
              correctIndex: 0,
              explanation:
                  "SQL stands for Structured Query Language. It is a standard programming language specifically designed for managing and manipulating relational databases. SQL is used to perform tasks such as retrieving, updating, inserting, and deleting data from databases."),
          QuizQuestion(
              question:
                  "Which of the following is an example of a relational database management system?",
              options: ["MySQL", "HTML", "Python", "JavaScript"],
              correctIndex: 0,
              explanation:
                  "MySQL is an example of a relational database management system (RDBMS). Other examples include Oracle, SQL Server, PostgreSQL, and SQLite. HTML, Python, and JavaScript are not database systems - HTML is a markup language, while Python and JavaScript are programming languages."),
          QuizQuestion(
              question: "What is a foreign key in a database?",
              options: [
                "A field that links to the primary key of another table",
                "A key imported from another database",
                "An encryption key used for secure connections",
                "A backup key used when the primary key fails"
              ],
              correctIndex: 0,
              explanation:
                  "A foreign key is a field (or collection of fields) in one table that refers to the primary key in another table. It establishes a relationship between tables, enforcing referential integrity by ensuring that values in the foreign key column exist in the referenced primary key column."),
          QuizQuestion(
              question: "What is a database schema?",
              options: [
                "The structure that defines how data is organized in a database",
                "A document containing all the data in a database",
                "A backup copy of a database",
                "The user interface of a database system"
              ],
              correctIndex: 0,
              explanation:
                  "A database schema is the structure or blueprint that defines how data is organized within a database. It includes the formal definition of tables, fields, relationships, constraints, views, and other database objects. The schema acts as a framework for how data is stored and accessed."),
          QuizQuestion(
              question:
                  "Which SQL statement is used to retrieve data from a database?",
              options: ["SELECT", "UPDATE", "INSERT", "DELETE"],
              correctIndex: 0,
              explanation:
                  "The SELECT statement is used to retrieve data from a database. It allows you to specify which columns to retrieve, which tables to get data from, and conditions that records must meet to be included in the results."),
          QuizQuestion(
              question: "What is a NULL value in a database?",
              options: [
                "A special marker indicating that data is missing or unknown",
                "A value of zero in a numeric field",
                "An empty string in a text field",
                "A placeholder for future data"
              ],
              correctIndex: 0,
              explanation:
                  "A NULL value in a database represents missing, unknown, or inapplicable data. It is not the same as zero, an empty string, or a space - it specifically indicates the absence of any value. NULL is not equal to anything, even another NULL."),
          QuizQuestion(
              question:
                  "What does the term 'CRUD' stand for in database operations?",
              options: [
                "Create, Read, Update, Delete",
                "Compile, Run, Update, Debug",
                "Connect, Relate, Utilize, Disconnect",
                "Current, Recent, Used, Dormant"
              ],
              correctIndex: 0,
              explanation:
                  "CRUD stands for Create, Read, Update, and Delete. These are the four basic operations that can be performed on database data. Create adds new records, Read retrieves existing records, Update modifies existing records, and Delete removes records."),
          QuizQuestion(
              question: "Which of these is NOT a type of database model?",
              options: [
                "Procedural model",
                "Relational model",
                "Hierarchical model",
                "Network model"
              ],
              correctIndex: 0,
              explanation:
                  "The 'Procedural model' is not a recognized database model. The common database models include relational (organizing data in tables with rows and columns), hierarchical (organizing data in a tree-like structure), network (a flexible model allowing many-to-many relationships), document-oriented, and object-oriented models."),
          QuizQuestion(
              question: "What is an SQL query?",
              options: [
                "An instruction to retrieve, manipulate, or delete data from a database",
                "A request to create a new database",
                "A report generated from database data",
                "A method for backing up database tables"
              ],
              correctIndex: 0,
              explanation:
                  "An SQL query is an instruction or statement used to interact with data in a database. Queries can be used to retrieve (SELECT), insert (INSERT), update (UPDATE), or delete (DELETE) data. They specify what data to access and what operations to perform on that data."),
          QuizQuestion(
              question: "Which SQL clause is used to filter records?",
              options: ["WHERE", "ORDER BY", "GROUP BY", "JOIN"],
              correctIndex: 0,
              explanation:
                  "The WHERE clause is used to filter records in SQL queries. It specifies conditions that must be met for records to be selected, allowing you to extract only the records that fulfill a specific condition."),
          QuizQuestion(
              question: "What is a database transaction?",
              options: [
                "A sequence of operations performed as a single logical unit of work",
                "The process of migrating from one database to another",
                "A financial payment for database usage",
                "The exchange of data between two different databases"
              ],
              correctIndex: 0,
              explanation:
                  "A database transaction is a sequence of operations performed as a single logical unit of work. Transactions follow the ACID properties (Atomicity, Consistency, Isolation, Durability) to ensure data integrity. If any part of a transaction fails, the entire transaction is rolled back."),
          QuizQuestion(
              question: "What does DDL stand for in database terminology?",
              options: [
                "Data Definition Language",
                "Data Development Language",
                "Database Description List",
                "Dynamic Data Loading"
              ],
              correctIndex: 0,
              explanation:
                  "DDL stands for Data Definition Language. It is a subset of SQL used to define and modify the structure of database objects such as tables, indexes, and constraints. Common DDL commands include CREATE, ALTER, DROP, and TRUNCATE."),
          QuizQuestion(
              question: "In the context of databases, what is normalization?",
              options: [
                "A process of organizing data to minimize redundancy",
                "Converting data to a standardized format for input",
                "The process of combining multiple databases",
                "Compressing data to save storage space"
              ],
              correctIndex: 0,
              explanation:
                  "Normalization is the process of organizing data in a database to minimize redundancy and dependency by dividing larger tables into smaller, related tables. This helps improve data integrity, reduce data anomalies, and optimize database performance."),
          QuizQuestion(
              question: "What does DML stand for in database terminology?",
              options: [
                "Data Manipulation Language",
                "Database Management Logic",
                "Dynamic Memory Loading",
                "Direct Machine Language"
              ],
              correctIndex: 0,
              explanation:
                  "DML stands for Data Manipulation Language. It is a category of SQL commands used to manipulate data stored in database tables. Common DML commands include SELECT (to retrieve data), INSERT (to add data), UPDATE (to modify data), and DELETE (to remove data)."),
          QuizQuestion(
              question:
                  "Which SQL command is used to add new records to a table?",
              options: ["INSERT", "ADD", "UPDATE", "CREATE"],
              correctIndex: 0,
              explanation:
                  "The INSERT command is used to add new records to a database table. The basic syntax is 'INSERT INTO table_name (column1, column2, ...) VALUES (value1, value2, ...);', which adds a new row with the specified values for the listed columns."),
          QuizQuestion(
              question: "What is a view in a database?",
              options: [
                "A virtual table based on the result of an SQL query",
                "A graphical representation of database tables",
                "The user interface of a database application",
                "A snapshot of a database at a specific point in time"
              ],
              correctIndex: 0,
              explanation:
                  "A view in a database is a virtual table based on the result of an SQL SELECT query. Views do not store data themselves but provide a way to look at data in the base tables. They can simplify complex queries, provide security by restricting access to specific columns, and present data in a more user-friendly format."),
          QuizQuestion(
              question: "What is an index in a database?",
              options: [
                "A data structure that improves the speed of data retrieval operations",
                "A list of all tables in a database",
                "The first record in a database table",
                "A count of the total number of records"
              ],
              correctIndex: 0,
              explanation:
                  "An index in a database is a data structure that improves the speed of data retrieval operations by providing quick access to rows in a table. Similar to an index in a book, a database index allows the database engine to find data without scanning the entire table."),
          QuizQuestion(
              question:
                  "Which of the following is a characteristic of a relational database?",
              options: [
                "Data is organized in tables with rows and columns",
                "Data is stored in a hierarchical tree structure",
                "Data is stored as objects with methods and attributes",
                "Data is stored as key-value pairs"
              ],
              correctIndex: 0,
              explanation:
                  "A key characteristic of a relational database is that data is organized in tables (relations) with rows (tuples) and columns (attributes). Each table represents an entity, each row represents an instance of that entity, and each column represents an attribute or property of that entity."),
          QuizQuestion(
              question: "What is data redundancy in databases?",
              options: [
                "The duplication of data in multiple places in a database",
                "The process of backing up database data",
                "A security feature that prevents unauthorized access",
                "The compression of rarely used data"
              ],
              correctIndex: 0,
              explanation:
                  "Data redundancy refers to the duplication of data in multiple places in a database. Uncontrolled redundancy can lead to data inconsistencies, increased storage requirements, and maintenance problems. Database normalization is often used to minimize unnecessary redundancy."),
          QuizQuestion(
              question: "Which SQL clause is used to sort the result set?",
              options: ["ORDER BY", "SORT BY", "GROUP BY", "RANK BY"],
              correctIndex: 0,
              explanation:
                  "The ORDER BY clause is used to sort the result set of a query in ascending (ASC) or descending (DESC) order. For example, 'SELECT * FROM Customers ORDER BY LastName ASC' would return all customer records sorted alphabetically by last name."),
          QuizQuestion(
              question: "What is the purpose of the SQL DISTINCT keyword?",
              options: [
                "To eliminate duplicate values from the result set",
                "To mark a field as unique in the database",
                "To create distinct tables from existing ones",
                "To distinguish between different data types"
              ],
              correctIndex: 0,
              explanation:
                  "The DISTINCT keyword in SQL is used to eliminate duplicate values from the result set of a query. When used with SELECT, it ensures that only unique values or combinations of values are returned, even if there are duplicate rows in the table."),
          QuizQuestion(
              question: "Which of the following is NOT a type of SQL join?",
              options: [
                "PARALLEL JOIN",
                "INNER JOIN",
                "LEFT JOIN",
                "FULL JOIN"
              ],
              correctIndex: 0,
              explanation:
                  "PARALLEL JOIN is not a standard type of SQL join. The common types of SQL joins are INNER JOIN (returns records that have matching values in both tables), LEFT JOIN (returns all records from the left table and matched records from the right), RIGHT JOIN (the opposite of LEFT JOIN), and FULL JOIN (returns all records when there is a match in either table)."),
        ];
      case QuizLevel.intermediate:
        return [
          QuizQuestion(
              question:
                  "What is the purpose of the ACID properties in database transactions?",
              options: [
                "To ensure reliability and consistency of database transactions",
                "To optimize query performance in acid-based storage systems",
                "To define access control rules for database security",
                "To standardize coding practices for database applications"
              ],
              correctIndex: 0,
              explanation:
                  "The ACID properties ensure reliability and consistency of database transactions. ACID stands for Atomicity (transactions are all-or-nothing), Consistency (transactions bring the database from one valid state to another), Isolation (concurrent transactions don't interfere with each other), and Durability (completed transactions persist even after system failures)."),
          QuizQuestion(
              question:
                  "What is the difference between a clustered and a non-clustered index?",
              options: [
                "A clustered index determines the physical order of data in a table, while a non-clustered index creates a separate structure with pointers to the data",
                "A clustered index is used in cloud-based databases, while a non-clustered index is used in on-premises databases",
                "A clustered index is faster but requires more storage, while a non-clustered index is slower but more space-efficient",
                "A clustered index can only be applied to numeric columns, while a non-clustered index works with any data type"
              ],
              correctIndex: 0,
              explanation:
                  "A clustered index determines the physical order of data storage in a table (there can be only one per table), directly sorting the rows based on the index key. A non-clustered index creates a separate structure containing the index key values and pointers to the data rows, allowing multiple non-clustered indexes on a single table."),
          QuizQuestion(
              question: "What is a stored procedure in a database?",
              options: [
                "A prepared SQL code that can be saved and reused",
                "A method to physically store data in specific memory locations",
                "A backup procedure that automatically stores database snapshots",
                "A technique for storing large objects outside the main database file"
              ],
              correctIndex: 0,
              explanation:
                  "A stored procedure is a prepared SQL code that can be saved and reused. It's essentially a function composed of SQL statements that is stored in the database. Stored procedures can accept parameters, perform calculations, call other procedures, and return results, improving performance and security while promoting code reuse."),
          QuizQuestion(
              question:
                  "What does the term 'cardinality' refer to in database relationships?",
              options: [
                "The number of unique values in a column relative to the total number of rows",
                "The maximum number of tables allowed in a database",
                "The level of security applied to sensitive data fields",
                "The process of converting non-numeric data to numeric form"
              ],
              correctIndex: 0,
              explanation:
                  "In database relationships, cardinality refers to the number of unique values in a column relative to the total number of rows. High cardinality means a column has many unique values (like a primary key), while low cardinality means many duplicate values (like a boolean column). Cardinality affects index efficiency and query performance."),
          QuizQuestion(
              question: "What is a database trigger?",
              options: [
                "A special type of stored procedure that automatically executes when a specified event occurs",
                "A mechanism that starts the database when the system boots up",
                "A tool that monitors database performance and alerts administrators",
                "A scheduled task that performs regular database maintenance"
              ],
              correctIndex: 0,
              explanation:
                  "A database trigger is a special type of stored procedure that automatically executes in response to specific events on a particular table or view, such as INSERT, UPDATE, or DELETE operations. Triggers are used to enforce business rules, maintain data integrity, audit changes, or automatically update related data."),
          QuizQuestion(
              question: "What is denormalization in database design?",
              options: [
                "The process of adding redundancy to improve query performance",
                "The process of removing tables that are no longer needed",
                "Converting a specialized database into a more general-purpose one",
                "Simplifying complex queries into multiple simpler queries"
              ],
              correctIndex: 0,
              explanation:
                  "Denormalization is the process of intentionally adding redundancy to a database design to improve read performance. It's the opposite of normalization and involves combining tables or duplicating data to reduce the need for joins or complex queries, trading some write efficiency and data integrity for faster query response times."),
          QuizQuestion(
              question: "What is a composite key in a database?",
              options: [
                "A key that consists of two or more columns to uniquely identify records",
                "A combination of primary and foreign keys in a table",
                "A security key generated from multiple encryption algorithms",
                "A key that connects tables across different databases"
              ],
              correctIndex: 0,
              explanation:
                  "A composite key (also called a compound key) is a key that consists of two or more columns used together to uniquely identify records in a table. It's used when no single column can uniquely identify records. For example, in a course enrollment table, the combination of student_id and course_id might form a composite primary key."),
          QuizQuestion(
              question: "What is an SQL injection attack?",
              options: [
                "A security exploit where malicious SQL code is inserted into input fields to manipulate a database",
                "A technique for rapidly loading large amounts of data into a database",
                "A method for injecting missing data into incomplete database records",
                "A tool for merging two databases with different structures"
              ],
              correctIndex: 0,
              explanation:
                  "An SQL injection attack is a security vulnerability that occurs when an attacker is able to insert or 'inject' malicious SQL code into input fields that are later executed by the database. This can allow attackers to view sensitive data, modify database data, execute administrative operations, or even take control of the server. Parameterized queries and input validation are common defenses."),
          QuizQuestion(
              question: "What is the purpose of the HAVING clause in SQL?",
              options: [
                "To specify a condition for filtering group results in a GROUP BY query",
                "To define which tables to include in a join operation",
                "To specify the number of records to return in a query",
                "To temporarily hold results before final output"
              ],
              correctIndex: 0,
              explanation:
                  "The HAVING clause in SQL specifies a condition for filtering the results of GROUP BY queries. While the WHERE clause filters individual rows before grouping, HAVING filters the groups after aggregation. For example, 'SELECT department, AVG(salary) FROM employees GROUP BY department HAVING AVG(salary) > 50000' returns only departments with an average salary greater than 50,000."),
          QuizQuestion(
              question: "What is a database deadlock?",
              options: [
                "A situation where two or more transactions are waiting for each other to release locks, resulting in neither proceeding",
                "A database that has become corrupted and is no longer accessible",
                "A security mechanism that locks a database after failed login attempts",
                "A method for preventing unauthorized data modifications"
              ],
              correctIndex: 0,
              explanation:
                  "A database deadlock occurs when two or more transactions are waiting for each other to release locks on resources, resulting in none of them being able to proceed. For example, Transaction A holds a lock on Resource 1 and needs Resource 2, while Transaction B holds Resource 2 and needs Resource 1. Database systems typically detect deadlocks and resolve them by rolling back one of the transactions."),
          QuizQuestion(
              question: "What is the purpose of database sharding?",
              options: [
                "To horizontally partition data across multiple servers to improve scalability",
                "To encrypt sensitive data fields in a database",
                "To compress rarely used data for improved storage efficiency",
                "To clean up fragmented database files after deletions"
              ],
              correctIndex: 0,
              explanation:
                  "Database sharding is a horizontal partitioning strategy that distributes portions of a database across multiple servers or physical locations. Each partition (shard) contains a subset of the data, typically based on a shard key. Sharding improves scalability and performance by spreading the load across multiple resources, but increases complexity in maintaining data consistency and performing cross-shard operations."),
          QuizQuestion(
              question:
                  "What is the CAP theorem in distributed database systems?",
              options: [
                "A principle stating that a distributed database can provide at most two out of three guarantees: Consistency, Availability, and Partition tolerance",
                "A formula for calculating optimal capacity, access time, and processing power for database servers",
                "A method for balancing cost, accuracy, and performance in database design",
                "A security framework for controlling authentication, authorization, and permissions"
              ],
              correctIndex: 0,
              explanation:
                  "The CAP theorem (also known as Brewer's theorem) states that a distributed database system can provide at most two out of three guarantees: Consistency (all nodes see the same data at the same time), Availability (every request receives a response), and Partition tolerance (the system continues to operate despite network failures). This fundamental trade-off guides the design of distributed database systems."),
          QuizQuestion(
              question: "What is a materialized view in a database?",
              options: [
                "A database object that contains the results of a query stored as a physical table",
                "A virtual table that exists only in memory during query execution",
                "A graphical representation of database tables and their relationships",
                "A read-only snapshot of a database at a specific point in time"
              ],
              correctIndex: 0,
              explanation:
                  "A materialized view is a database object that contains the results of a query physically stored as a table. Unlike regular views which compute their data each time they're accessed, materialized views cache the results, improving query performance for complex queries at the cost of storage space and the need for periodic refreshes to maintain data currency."),
          QuizQuestion(
              question: "What is the purpose of an SQL EXPLAIN statement?",
              options: [
                "To show how the database engine will execute a query, including the execution plan",
                "To provide documentation about database tables and fields",
                "To translate complex SQL into simpler human-readable descriptions",
                "To explain error messages generated by failed queries"
              ],
              correctIndex: 0,
              explanation:
                  "The SQL EXPLAIN statement shows how the database engine will execute a query, providing details about the execution plan including which indexes will be used, the order of table joins, and the estimated cost. Database administrators and developers use EXPLAIN to analyze and optimize query performance by identifying inefficient operations like table scans or poor join methods."),
          QuizQuestion(
              question: "What is a database isolation level?",
              options: [
                "A setting that determines how transaction integrity is visible to other users and systems",
                "A security measure that isolates the database from network attacks",
                "The degree to which a database is separated from the application layer",
                "A metric measuring how isolated a database server is from other servers"
              ],
              correctIndex: 0,
              explanation:
                  "A database isolation level is a setting that determines how transaction integrity is maintained when multiple transactions are executing concurrently. Common isolation levels include Read Uncommitted, Read Committed, Repeatable Read, and Serializable, each offering different trade-offs between data consistency and performance. Higher isolation levels prevent more concurrency phenomena (dirty reads, non-repeatable reads, phantom reads) but may reduce performance."),
          QuizQuestion(
              question: "What is database replication?",
              options: [
                "The process of copying and maintaining database objects in multiple databases",
                "Creating duplicate backup copies of a database for disaster recovery",
                "Repeating database queries to ensure accurate results",
                "The process of creating multiple instances of the same table in a database"
              ],
              correctIndex: 0,
              explanation:
                  "Database replication is the process of copying and maintaining database objects across multiple database systems, often for distribution, availability, fault tolerance, or load balancing. Common replication methods include master-slave (one writable primary database with read-only copies) and multi-master (multiple writable databases that synchronize with each other)."),
          QuizQuestion(
              question:
                  "Which normal form eliminates transitive dependencies in a database table?",
              options: [
                "Third Normal Form (3NF)",
                "First Normal Form (1NF)",
                "Second Normal Form (2NF)",
                "Boyce-Codd Normal Form (BCNF)"
              ],
              correctIndex: 0,
              explanation:
                  "Third Normal Form (3NF) eliminates transitive dependencies in a database table. A table is in 3NF if it's in 2NF and all non-key attributes are directly dependent on the primary key, not on other non-key attributes. This further reduces data redundancy and potential anomalies by ensuring that non-key fields don't determine other non-key fields."),
          QuizQuestion(
              question: "What is database partitioning?",
              options: [
                "Dividing a large database table into smaller, more manageable pieces based on defined rules",
                "Separating a database into system and user spaces",
                "Allocating different portions of a database to different user groups",
                "Breaking a database down prior to retirement"
              ],
              correctIndex: 0,
              explanation:
                  "Database partitioning is the division of large tables into smaller, more manageable pieces called partitions, based on defined rules. Partitioning strategies include range (e.g., by date ranges), list (by specific values), hash (by a hash function), and composite (combining multiple strategies). Partitioning improves performance, manageability, and availability by localizing operations to relevant partitions."),
          QuizQuestion(
              question:
                  "What is the difference between an OLTP and an OLAP database system?",
              options: [
                "OLTP is optimized for transaction processing with many small updates, while OLAP is optimized for complex analytical queries on large datasets",
                "OLTP uses only proprietary database software, while OLAP uses only open-source solutions",
                "OLTP operates only on-premises, while OLAP is exclusively cloud-based",
                "OLTP is for small businesses, while OLAP is only used by large enterprises"
              ],
              correctIndex: 0,
              explanation:
                  "OLTP (Online Transaction Processing) systems are optimized for managing transaction-oriented applications with many concurrent users making small updates. They prioritize fast processing and maintaining data integrity. OLAP (Online Analytical Processing) systems are optimized for complex queries analyzing large volumes of data for business intelligence. Their designs differ in normalization, indexing, query complexity, and performance metrics."),
          QuizQuestion(
              question: "In database systems, what is eventual consistency?",
              options: [
                "A consistency model guaranteeing that all database replicas will eventually converge to the same state if no new updates occur",
                "A scheduling system that ensures all database operations will eventually complete",
                "The gradual process of normalizing a database over time",
                "A testing methodology that verifies database integrity through progressive stages"
              ],
              correctIndex: 0,
              explanation:
                  "Eventual consistency is a consistency model used in distributed databases that guarantees that all replicas will eventually converge to the same state if no new updates are made. Unlike strong consistency, it doesn't guarantee that all reads will return the most recent write. This model improves availability and performance in distributed systems at the cost of temporary inconsistencies."),
          QuizQuestion(
              question: "What is a database cursor?",
              options: [
                "A database object that allows traversal over the records in a result set one at a time",
                "A visual indicator showing the current position in a database management interface",
                "A tool that measures database performance and resource utilization",
                "A pointer that tracks the last modified record in a database"
              ],
              correctIndex: 0,
              explanation:
                  "A database cursor is an object that enables traversal over the records in a result set one row at a time. It's particularly useful in procedural SQL programming when you need to process rows individually. Cursors maintain a position in the result set and allow operations like fetching the next record, updating or deleting the current record, and detecting when all records have been processed."),
          QuizQuestion(
              question: "What is the purpose of the SQL Window functions?",
              options: [
                "To perform calculations across a set of rows that are related to the current row",
                "To create graphical interfaces for database applications",
                "To establish time periods when database maintenance can occur",
                "To display database query results in separate windows"
              ],
              correctIndex: 0,
              explanation:
                  "SQL Window functions perform calculations across a set of rows that are related to the current row, without collapsing groups like aggregate functions do. They allow operations like running totals, moving averages, and ranking. For example, ROW_NUMBER(), RANK(), DENSE_RANK(), LEAD(), LAG(), and analytic functions with OVER clauses are all window functions that provide powerful analysis capabilities while preserving the detail of individual rows."),
          QuizQuestion(
              question: "What is a star schema in data warehousing?",
              options: [
                "A database design with a central fact table connected to multiple dimension tables",
                "A redundant array of interconnected database servers for high availability",
                "A visual representation showing the most frequently accessed database tables",
                "A rating system for evaluating database performance"
              ],
              correctIndex: 0,
              explanation:
                  "A star schema is a database design used in data warehousing where a central fact table containing quantitative measurements is connected to multiple dimension tables containing descriptive attributes. The schema resembles a star with the fact table at the center and dimension tables as points. This design optimizes for analytical queries and reporting by simplifying joins and improving query performance."),
          QuizQuestion(
              question: "What is a database savepoint?",
              options: [
                "A marker within a transaction that allows partial rollback",
                "An automatic backup created by the database at regular intervals",
                "A point-in-time copy of the entire database",
                "A threshold indicating when the database should save data to disk"
              ],
              correctIndex: 0,
              explanation:
                  "A database savepoint is a marker within a transaction that allows for a partial rollback. By setting savepoints, you can control which changes within a transaction are committed or rolled back. This provides more granular control than all-or-nothing transaction processing, allowing recovery from errors without losing all work done in a large transaction."),
        ];
      case QuizLevel.advanced:
        return [
          QuizQuestion(
              question: "Which normal form eliminates transitive dependencies?",
              options: [
                "First Normal Form (1NF)",
                "Second Normal Form (2NF)",
                "Third Normal Form (3NF)",
                "Boyce-Codd Normal Form (BCNF)"
              ],
              correctIndex: 2,
              explanation:
                  "Third Normal Form (3NF) eliminates transitive dependencies, where non-key attributes depend on other non-key attributes rather than depending directly on the primary key."),
          QuizQuestion(
              question:
                  "What type of SQL command is used to retrieve data from a database?",
              options: [
                "DDL (Data Definition Language)",
                "DML (Data Manipulation Language)",
                "DCL (Data Control Language)",
                "TCL (Transaction Control Language)"
              ],
              correctIndex: 1,
              explanation:
                  "DML (Data Manipulation Language) commands like SELECT, INSERT, UPDATE, and DELETE are used to retrieve and manipulate data in a database."),
          QuizQuestion(
              question:
                  "Which of the following is NOT an example of a NoSQL database?",
              options: ["MongoDB", "Oracle", "Cassandra", "Redis"],
              correctIndex: 1,
              explanation:
                  "Oracle is a relational database management system (RDBMS), while MongoDB, Cassandra, and Redis are all examples of NoSQL databases."),
          QuizQuestion(
              question: "What is a primary key in a relational database?",
              options: [
                "A key that can contain NULL values",
                "A unique identifier for each record in a table",
                "A key that refers to another table",
                "The first column in any table"
              ],
              correctIndex: 1,
              explanation:
                  "A primary key is a column or group of columns that uniquely identifies each record in a database table. It cannot contain NULL values and must be unique for each record."),
          QuizQuestion(
              question:
                  "Which SQL statement is used to add new data to a database?",
              options: ["ADD", "CREATE", "INSERT", "UPDATE"],
              correctIndex: 2,
              explanation:
                  "The INSERT statement is used to add new records (rows) of data to a table in a database."),
          QuizQuestion(
              question: "What is a foreign key?",
              options: [
                "A key used to encrypt database records",
                "A field that links to the primary key of another table",
                "A key that must be unique for all records",
                "The main key of a non-relational database"
              ],
              correctIndex: 1,
              explanation:
                  "A foreign key is a field (or collection of fields) in one table that refers to the primary key in another table, establishing a link between the two tables."),
          QuizQuestion(
              question:
                  "Which of the following is a property of transactions in databases?",
              options: ["RISK", "ACID", "BASE", "SOAP"],
              correctIndex: 1,
              explanation:
                  "ACID (Atomicity, Consistency, Isolation, Durability) is a set of properties that guarantee database transactions are processed reliably."),
          QuizQuestion(
              question: "What is denormalization in database design?",
              options: [
                "The process of converting structured data into multiple tables",
                "The process of adding redundant data to improve query performance",
                "The process of removing redundancy from database tables",
                "The process of securing sensitive data"
              ],
              correctIndex: 1,
              explanation:
                  "Denormalization is a strategy used to add redundant data to a normalized database to improve read performance, often at the expense of write performance."),
          QuizQuestion(
              question: "What SQL clause is used to filter records?",
              options: ["WHERE", "HAVING", "GROUP BY", "ORDER BY"],
              correctIndex: 0,
              explanation:
                  "The WHERE clause is used to filter records in SQL queries based on specified conditions."),
          QuizQuestion(
              question:
                  "Which type of join returns rows that have matching values in both tables?",
              options: [
                "LEFT JOIN",
                "RIGHT JOIN",
                "INNER JOIN",
                "FULL OUTER JOIN"
              ],
              correctIndex: 2,
              explanation:
                  "An INNER JOIN returns only the rows where there is a match in both tables based on the join condition."),
          QuizQuestion(
              question: "What is a deadlock in database systems?",
              options: [
                "When a database crashes due to hardware failure",
                "When two transactions wait indefinitely for each other to release locks",
                "When a query takes too long to execute",
                "When a database table becomes corrupted"
              ],
              correctIndex: 1,
              explanation:
                  "A deadlock occurs when two or more transactions are waiting indefinitely for one another to release locks on resources, resulting in neither being able to proceed."),
          QuizQuestion(
              question:
                  "Which of the following is NOT a type of database index?",
              options: [
                "B-Tree Index",
                "Bitmap Index",
                "Convex Index",
                "Hash Index"
              ],
              correctIndex: 2,
              explanation:
                  "Convex Index is not a type of database index. Common index types include B-Tree, Bitmap, and Hash indexes, each optimized for different query patterns."),
          QuizQuestion(
              question: "What does SQL stand for?",
              options: [
                "Structured Query Language",
                "Sequential Query Language",
                "Simple Query Logic",
                "System Query Level"
              ],
              correctIndex: 0,
              explanation:
                  "SQL stands for Structured Query Language, which is a standard language for managing and manipulating relational databases."),
          QuizQuestion(
              question:
                  "Which of the following is an aggregate function in SQL?",
              options: ["JOIN", "WHERE", "COUNT", "DISTINCT"],
              correctIndex: 2,
              explanation:
                  "COUNT is an aggregate function in SQL that returns the number of rows that match a specified condition. Other examples include SUM, AVG, MIN, and MAX."),
          QuizQuestion(
              question: "What is a view in a database?",
              options: [
                "A physical table storing data",
                "A virtual table based on the result of an SQL statement",
                "A graphical user interface for database administration",
                "A backup copy of a table"
              ],
              correctIndex: 1,
              explanation:
                  "A view is a virtual table that is based on the result-set of an SQL statement. It contains rows and columns, just like a real table, but doesn't store the data physically."),
          QuizQuestion(
              question:
                  "Which of the following is a characteristic of a NoSQL database?",
              options: [
                "Always follows ACID properties",
                "Always requires a fixed schema",
                "Typically uses SQL for queries",
                "Designed for distributed data stores"
              ],
              correctIndex: 3,
              explanation:
                  "NoSQL databases are often designed for distributed data stores, allowing for horizontal scaling across multiple servers, which is a key advantage over traditional relational databases."),
          QuizQuestion(
              question: "What is data integrity in a database?",
              options: [
                "The process of backing up database data",
                "The accuracy and consistency of data stored in a database",
                "The speed at which data can be retrieved",
                "The encryption level of sensitive data"
              ],
              correctIndex: 1,
              explanation:
                  "Data integrity refers to the accuracy, consistency, and reliability of data stored in a database throughout its lifecycle."),
          QuizQuestion(
              question: "Which SQL command is used to create a new table?",
              options: [
                "BUILD TABLE",
                "GENERATE TABLE",
                "CREATE TABLE",
                "CONSTRUCT TABLE"
              ],
              correctIndex: 2,
              explanation:
                  "The CREATE TABLE command is used to create a new table in a database, defining its columns, data types, and constraints."),
          QuizQuestion(
              question: "What does CRUD stand for in database operations?",
              options: [
                "Create, Read, Update, Delete",
                "Collect, Retrieve, Update, Destroy",
                "Connect, Run, Update, Disconnect",
                "Create, Relate, Undo, Drop"
              ],
              correctIndex: 0,
              explanation:
                  "CRUD stands for Create, Read, Update, and Delete, which are the four basic functions of persistent storage in database applications."),
          QuizQuestion(
              question:
                  "Which of the following is NOT a transaction isolation level in SQL?",
              options: [
                "Read Uncommitted",
                "Read Committed",
                "Repeatable Read",
                "Absolute Serialization"
              ],
              correctIndex: 3,
              explanation:
                  "Absolute Serialization is not a standard transaction isolation level. The standard levels are Read Uncommitted, Read Committed, Repeatable Read, and Serializable."),
          QuizQuestion(
              question: "What is a stored procedure in a database?",
              options: [
                "A way to store database backups",
                "A saved SQL code that can be reused",
                "A method to encrypt sensitive data",
                "A physical storage location for database files"
              ],
              correctIndex: 1,
              explanation:
                  "A stored procedure is a prepared SQL code that can be saved and reused. It can accept parameters, perform operations, and return results."),
          QuizQuestion(
              question: "What is database sharding?",
              options: [
                "Breaking a database into smaller, more manageable pieces across multiple servers",
                "Encrypting database contents for security",
                "Compressing database tables to save space",
                "Converting a relational database to NoSQL"
              ],
              correctIndex: 0,
              explanation:
                  "Database sharding is a type of horizontal partitioning that splits a database into smaller, more manageable pieces called shards, which are distributed across multiple servers."),
          QuizQuestion(
              question:
                  "Which of the following best describes a composite key?",
              options: [
                "A key that automatically increments with each new record",
                "A primary key made up of multiple columns",
                "A key that references a table in another database",
                "A temporary key used during data migration"
              ],
              correctIndex: 1,
              explanation:
                  "A composite key is a primary key that consists of multiple columns used together to uniquely identify records in a table."),
          QuizQuestion(
              question: "What is a database trigger?",
              options: [
                "A notification system for database administrators",
                "A scheduled database backup",
                "A procedure that automatically executes in response to certain events",
                "A special key combination to optimize queries"
              ],
              correctIndex: 2,
              explanation:
                  "A database trigger is a stored procedure that automatically executes when specific events occur in the database, such as INSERT, UPDATE, or DELETE operations."),
          QuizQuestion(
              question:
                  "Which statement correctly describes a non-clustered index?",
              options: [
                "It determines the physical order of data in a table",
                "It creates a separate structure that points to the data in the table",
                "It can only be created on primary key columns",
                "It always performs better than clustered indexes"
              ],
              correctIndex: 1,
              explanation:
                  "A non-clustered index creates a separate structure from the data storage that contains the index key values and pointers to the table rows that contain the data."),
          QuizQuestion(
              question: "What is the purpose of the HAVING clause in SQL?",
              options: [
                "To filter records before grouping",
                "To filter groups based on specified conditions",
                "To sort the result set",
                "To join multiple tables"
              ],
              correctIndex: 1,
              explanation:
                  "The HAVING clause in SQL is used to filter groups based on specified conditions after the GROUP BY clause aggregates the data."),
          QuizQuestion(
              question:
                  "Which of the following is a characteristic of a data warehouse?",
              options: [
                "Optimized for transaction processing",
                "Stores only current data",
                "Subject-oriented and integrated for analysis",
                "Updates data in real-time"
              ],
              correctIndex: 2,
              explanation:
                  "Data warehouses are subject-oriented, integrated repositories designed for data analysis and reporting rather than transaction processing. They typically contain historical data aggregated from multiple sources."),
          QuizQuestion(
              question: "What is referential integrity in a database?",
              options: [
                "A security feature that prevents unauthorized access",
                "A constraint that ensures relationships between tables remain consistent",
                "A process to check for duplicate data",
                "A method for optimizing query performance"
              ],
              correctIndex: 1,
              explanation:
                  "Referential integrity is a constraint that ensures relationships between tables remain consistent. It prevents users from adding records to a related table if there is no associated record in the primary table."),
        ];
    }
  }

  // Operating System questions based on level
  static List<QuizQuestion> _getOSQuestions(QuizLevel level) {
    switch (level) {
      case QuizLevel.beginner:
        return [
          QuizQuestion(
              question: "What is an operating system?",
              options: [
                "Software that manages hardware resources and provides services for computer programs",
                "Hardware that connects computer components",
                "A programming language used to develop applications",
                "A type of computer memory"
              ],
              correctIndex: 0,
              explanation:
                  "An operating system is software that manages computer hardware resources and provides common services for computer programs. It acts as an intermediary between users and the computer hardware."),
          QuizQuestion(
              question:
                  "Which of the following is NOT an example of an operating system?",
              options: ["Microsoft Excel", "Windows 11", "macOS", "Linux"],
              correctIndex: 0,
              explanation:
                  "Microsoft Excel is an application software (spreadsheet program), not an operating system. Windows 11, macOS, and Linux are all examples of operating systems."),
          QuizQuestion(
              question:
                  "What is the primary function of the kernel in an operating system?",
              options: [
                "To manage core operations of the computer and hardware",
                "To provide a user interface",
                "To run application software",
                "To connect to the internet"
              ],
              correctIndex: 0,
              explanation:
                  "The kernel is the core component of an operating system that manages system resources, memory, processes, and provides the interface between hardware and software components."),
          QuizQuestion(
              question: "What does CPU scheduling determine?",
              options: [
                "Which process gets the processor next and for how long",
                "How much memory is allocated to each program",
                "Which files to save on the hard drive",
                "How fast the computer can connect to the internet"
              ],
              correctIndex: 0,
              explanation:
                  "CPU scheduling determines which process in the ready queue gets the CPU next and for how long. It aims to maximize CPU utilization and throughput while minimizing response time and waiting time."),
          QuizQuestion(
              question: "What is a process in operating systems?",
              options: [
                "A program in execution",
                "A section of code",
                "A type of computer memory",
                "A hardware component"
              ],
              correctIndex: 0,
              explanation:
                  "A process is a program in execution. It is an active entity that requires resources like CPU time, memory, files, and I/O devices to accomplish its task."),
          QuizQuestion(
              question:
                  "What is the purpose of virtual memory in an operating system?",
              options: [
                "To use hard disk space as an extension of RAM",
                "To increase the speed of the CPU",
                "To improve graphics processing",
                "To encrypt data on the hard drive"
              ],
              correctIndex: 0,
              explanation:
                  "Virtual memory uses hard disk space as an extension of RAM, allowing a computer to run programs larger than its physical memory by swapping data between RAM and disk storage as needed."),
          QuizQuestion(
              question:
                  "Which term describes when multiple processes are executed simultaneously by alternating between them?",
              options: [
                "Multitasking",
                "Multiprocessing",
                "Networking",
                "Multiplexing"
              ],
              correctIndex: 0,
              explanation:
                  "Multitasking refers to the ability of an operating system to execute multiple processes concurrently by rapidly switching between them, giving users the impression that multiple operations are occurring simultaneously."),
          QuizQuestion(
              question: "What is a device driver?",
              options: [
                "Software that allows the OS to communicate with hardware devices",
                "Hardware that connects peripheral devices",
                "A person who installs computer components",
                "Software that speeds up the CPU"
              ],
              correctIndex: 0,
              explanation:
                  "A device driver is a specialized software component that allows the operating system to communicate with and control hardware devices by translating general commands into specific instructions for the device."),
          QuizQuestion(
              question:
                  "What does the acronym 'GUI' stand for in operating systems?",
              options: [
                "Graphical User Interface",
                "Grand Unified Integration",
                "General User Input",
                "Guided User Interaction"
              ],
              correctIndex: 0,
              explanation:
                  "GUI stands for Graphical User Interface, which is a visual way of interacting with a computer using items such as windows, icons, and menus, manipulated by a pointing device like a mouse."),
          QuizQuestion(
              question:
                  "Which of the following is an example of a single-user operating system?",
              options: ["MS-DOS", "Unix", "Windows Server", "Linux"],
              correctIndex: 0,
              explanation:
                  "MS-DOS (Microsoft Disk Operating System) is an example of a single-user operating system, designed to be used by one user at a time. Unix, Windows Server, and most Linux distributions are multi-user systems."),
          QuizQuestion(
              question:
                  "What is the purpose of a file system in an operating system?",
              options: [
                "To organize and store files on storage devices",
                "To speed up the processor",
                "To create a user interface",
                "To connect to networks"
              ],
              correctIndex: 0,
              explanation:
                  "A file system is responsible for organizing, storing, retrieving, and managing files on storage devices. It determines how data is stored, named, accessed, and organized on the storage media."),
          QuizQuestion(
              question:
                  "What is the function of the command line interface (CLI)?",
              options: [
                "To allow users to interact with the OS using text commands",
                "To display graphics and videos",
                "To connect to the internet",
                "To run virus scans"
              ],
              correctIndex: 0,
              explanation:
                  "The Command Line Interface (CLI) allows users to interact with the operating system by typing text commands instead of using graphical elements. Users enter commands that perform specific operations or run programs."),
          QuizQuestion(
              question: "What is a deadlock in operating systems?",
              options: [
                "A situation where two or more processes are unable to proceed because each is waiting for resources held by others",
                "When a computer completely freezes and requires a restart",
                "A security feature that locks files after multiple failed access attempts",
                "A special type of computer virus"
              ],
              correctIndex: 0,
              explanation:
                  "A deadlock is a situation where two or more processes are unable to proceed because each is waiting for resources that are held by another process in the same group, creating a circular wait condition."),
          QuizQuestion(
              question:
                  "What is the purpose of a task manager in an operating system?",
              options: [
                "To monitor and control running processes and system resources",
                "To organize daily tasks for the user",
                "To automatically schedule system maintenance",
                "To manage network connections"
              ],
              correctIndex: 0,
              explanation:
                  "A task manager allows users to monitor system performance, view and control running processes, and manage system resources. It provides information about CPU usage, memory utilization, and allows termination of unresponsive programs."),
          QuizQuestion(
              question:
                  "Which of the following best describes 'booting' a computer?",
              options: [
                "The process of starting or restarting the computer and loading the operating system",
                "Installing a new operating system",
                "Running a virus scan on startup",
                "Connecting peripheral devices"
              ],
              correctIndex: 0,
              explanation:
                  "Booting refers to the process of starting or restarting a computer and loading the operating system into memory, making the computer ready for use."),
          QuizQuestion(
              question: "What is a system call in an operating system?",
              options: [
                "A request from a program to the operating system kernel for a service",
                "An emergency alert when the system fails",
                "A phone call to technical support",
                "A method to call another computer over the network"
              ],
              correctIndex: 0,
              explanation:
                  "A system call is a programmatic way for an application program to request a service from the operating system's kernel. It provides an interface between user programs and the operating system."),
          QuizQuestion(
              question: "What does 'BIOS' stand for?",
              options: [
                "Basic Input/Output System",
                "Binary Integrated Operating System",
                "Built-In Operating System",
                "Backup Input/Output Storage"
              ],
              correctIndex: 0,
              explanation:
                  "BIOS stands for Basic Input/Output System. It's firmware used during the startup process to initialize hardware components and load the operating system."),
          QuizQuestion(
              question:
                  "Which of the following is NOT a function of an operating system?",
              options: [
                "Creating spreadsheets and presentations",
                "Memory management",
                "Process scheduling",
                "File system management"
              ],
              correctIndex: 0,
              explanation:
                  "Creating spreadsheets and presentations is a function of application software like Microsoft Office or Google Workspace, not the operating system. Memory management, process scheduling, and file system management are core functions of an operating system."),
          QuizQuestion(
              question: "What is a shell in an operating system?",
              options: [
                "An interface that allows users to access OS services",
                "A protective layer around the CPU",
                "A type of computer virus",
                "The physical casing of the computer"
              ],
              correctIndex: 0,
              explanation:
                  "A shell is a user interface that provides access to operating system services. It can be either a command-line interface (CLI) like Bash or PowerShell, or a graphical user interface (GUI) like Windows Explorer."),
          QuizQuestion(
              question:
                  "What is the primary purpose of an operating system's file protection mechanism?",
              options: [
                "To control access to files based on user permissions",
                "To compress files to save storage space",
                "To encrypt all files automatically",
                "To back up files regularly"
              ],
              correctIndex: 0,
              explanation:
                  "File protection mechanisms in operating systems control access to files based on user permissions, ensuring that users can only access files they are authorized to use and preventing unauthorized modifications."),
          QuizQuestion(
              question:
                  "What does 'plug and play' refer to in operating systems?",
              options: [
                "The ability to automatically recognize and configure new hardware devices",
                "A feature for playing media files",
                "A method for connecting to game servers",
                "A tool for installing software applications"
              ],
              correctIndex: 0,
              explanation:
                  "Plug and play refers to the ability of an operating system to automatically detect, recognize, and configure new hardware devices when they are connected, without requiring manual driver installation or complex setup."),
          QuizQuestion(
              question:
                  "Which scheduling algorithm selects the process with the shortest estimated execution time first?",
              options: [
                "Shortest Job First (SJF)",
                "First Come First Served (FCFS)",
                "Round Robin",
                "Priority Scheduling"
              ],
              correctIndex: 0,
              explanation:
                  "The Shortest Job First (SJF) scheduling algorithm selects the process with the shortest estimated execution time to run next, which minimizes average waiting time but requires knowledge of execution times in advance."),
          QuizQuestion(
              question: "What happens in a context switch?",
              options: [
                "The system saves the state of a process and loads the state of another process",
                "The user switches between different applications",
                "The computer switches between different power modes",
                "The network switches between different connection types"
              ],
              correctIndex: 0,
              explanation:
                  "A context switch is the process of storing the state of a currently executing process and restoring the state of a different process when switching the CPU from one process to another in multitasking systems."),
          QuizQuestion(
              question:
                  "What is the purpose of a swap space in an operating system?",
              options: [
                "To temporarily store memory contents when RAM is full",
                "To exchange files between computers",
                "To back up important system files",
                "To store user preferences and settings"
              ],
              correctIndex: 0,
              explanation:
                  "Swap space is a designated area on the hard drive that the operating system uses to temporarily store memory contents when physical RAM is full. It's an essential component of virtual memory systems."),
          QuizQuestion(
              question:
                  "Which of the following best describes an interrupt in an operating system?",
              options: [
                "A signal to the processor that an event needs immediate attention",
                "A power outage affecting the computer",
                "A break in network connectivity",
                "A pause button for running applications"
              ],
              correctIndex: 0,
              explanation:
                  "An interrupt is a signal sent to the processor indicating that an event requires immediate attention, causing the processor to pause its current execution, save its state, and execute an interrupt handler routine."),
        ];
      case QuizLevel.intermediate:
        return [
          QuizQuestion(
              question:
                  "What is the difference between preemptive and non-preemptive scheduling?",
              options: [
                "Preemptive scheduling allows the OS to interrupt and temporarily suspend a running process, while non-preemptive scheduling runs each process until it voluntarily yields",
                "Preemptive scheduling is used only for batch processing, while non-preemptive scheduling is used for real-time systems",
                "Preemptive scheduling applies only to kernel processes, while non-preemptive scheduling applies to user processes",
                "Preemptive scheduling uses multiple CPUs, while non-preemptive scheduling uses a single CPU"
              ],
              correctIndex: 0,
              explanation:
                  "In preemptive scheduling, the operating system can forcibly suspend a running process to allocate the CPU to another process, typically when a higher priority process arrives or a time slice expires. In non-preemptive scheduling, once a process starts execution, it continues until it voluntarily blocks or terminates."),
          QuizQuestion(
              question:
                  "What is the purpose of a semaphore in operating systems?",
              options: [
                "To control access to shared resources in a multi-process environment",
                "To detect and remove computer viruses",
                "To compress large files for storage",
                "To translate between different programming languages"
              ],
              correctIndex: 0,
              explanation:
                  "A semaphore is a synchronization tool used to control access to shared resources in a multi-process environment. It consists of a counter that helps manage concurrent access to resources, preventing race conditions and ensuring mutual exclusion when necessary."),
          QuizQuestion(
              question:
                  "In the context of process synchronization, what is a critical section?",
              options: [
                "A segment of code where shared resources are accessed and modified",
                "A part of memory reserved for the operating system",
                "A crucial system file that cannot be modified",
                "An area in the CPU where high-priority calculations are performed"
              ],
              correctIndex: 0,
              explanation:
                  "A critical section is a segment of code where a process accesses and manipulates shared resources. It must be executed atomically (as an indivisible unit) to prevent race conditions and ensure data consistency in concurrent programming."),
          QuizQuestion(
              question: "What is thrashing in an operating system?",
              options: [
                "A state where the system spends more time swapping pages than executing processes",
                "A method to rapidly delete temporary files",
                "A security attack that overloads the CPU",
                "A technique to quickly initialize memory"
              ],
              correctIndex: 0,
              explanation:
                  "Thrashing is a condition where the operating system spends more time swapping pages between memory and disk than executing actual processes. It occurs when there is excessive paging due to insufficient physical memory for all active processes."),
          QuizQuestion(
              question:
                  "What is the difference between a monolithic kernel and a microkernel?",
              options: [
                "A monolithic kernel runs all OS services in kernel space, while a microkernel runs minimal services in kernel space and the rest in user space",
                "A monolithic kernel works only with single-core CPUs, while a microkernel requires multiple cores",
                "A monolithic kernel is used in older operating systems, while all modern OSes use microkernels",
                "A monolithic kernel requires less memory than a microkernel"
              ],
              correctIndex: 0,
              explanation:
                  "A monolithic kernel implements all operating system services in kernel space, running in privileged mode. A microkernel implements only essential services (like IPC, memory management, and scheduling) in kernel space, with other services running as processes in user space, improving modularity and reliability at the cost of performance."),
          QuizQuestion(
              question:
                  "What is copy-on-write (COW) in the context of process creation?",
              options: [
                "A technique where memory pages are shared between parent and child processes until one attempts to modify them",
                "A method of copying files while they are being edited by users",
                "A backup strategy that copies only modified files",
                "A technique for writing data to multiple disk locations simultaneously"
              ],
              correctIndex: 0,
              explanation:
                  "Copy-on-write is a resource management technique used in process creation (like fork() in Unix) where memory pages are initially shared between parent and child processes. When either process attempts to modify a shared page, a separate copy is created for that process, optimizing memory usage and process creation speed."),
          QuizQuestion(
              question:
                  "What problem does the banker's algorithm solve in operating systems?",
              options: [
                "Deadlock avoidance",
                "CPU scheduling",
                "Memory fragmentation",
                "File allocation"
              ],
              correctIndex: 0,
              explanation:
                  "The banker's algorithm is used for deadlock avoidance in operating systems. It determines whether allocating resources to a process will lead to a safe state (where no deadlock can occur) or an unsafe state, and only grants requests that maintain the system in a safe state."),
          QuizQuestion(
              question:
                  "What is the purpose of a TLB (Translation Lookaside Buffer) in virtual memory systems?",
              options: [
                "To cache recently used page table entries to speed up virtual-to-physical address translation",
                "To store translation rules for different programming languages",
                "To buffer data being transferred between the CPU and RAM",
                "To temporarily store instructions before execution"
              ],
              correctIndex: 0,
              explanation:
                  "A Translation Lookaside Buffer (TLB) is a specialized cache that stores recently used page table entries to speed up virtual-to-physical address translation. It reduces the time needed to access memory by avoiding frequent page table lookups from main memory."),
          QuizQuestion(
              question:
                  "Which file allocation method suffers from external fragmentation?",
              options: [
                "Contiguous allocation",
                "Linked allocation",
                "Indexed allocation",
                "All of these"
              ],
              correctIndex: 0,
              explanation:
                  "Contiguous allocation suffers from external fragmentation because files must be stored as a single contiguous block on disk. As files are created and deleted, free space becomes fragmented into small blocks that may be too small to accommodate new files, even though the total free space might be sufficient."),
          QuizQuestion(
              question:
                  "What is the main advantage of a multi-level page table over a single-level page table?",
              options: [
                "It reduces the memory required to store page tables for large address spaces",
                "It allows faster address translation",
                "It supports larger page sizes",
                "It prevents page faults"
              ],
              correctIndex: 0,
              explanation:
                  "A multi-level page table reduces the memory required to store page tables for large address spaces by allowing parts of the page table that are not in use to not be created. This is particularly beneficial in systems with sparse address spaces where only a small portion of the virtual address space is actually used."),
          QuizQuestion(
              question:
                  "What is the difference between soft and hard real-time operating systems?",
              options: [
                "Soft real-time systems can occasionally miss deadlines with degraded service, while hard real-time systems must never miss deadlines",
                "Soft real-time systems are used for consumer applications, while hard real-time systems are only used for military applications",
                "Soft real-time systems use interpreted languages, while hard real-time systems use compiled languages",
                "Soft real-time systems have flexible requirements, while hard real-time systems have fixed but not time-critical requirements"
              ],
              correctIndex: 0,
              explanation:
                  "In soft real-time systems, missing an occasional deadline results in degraded performance but the system continues to function. In hard real-time systems, missing deadlines can lead to complete system failure and potentially catastrophic consequences, so timing constraints must be strictly guaranteed."),
          QuizQuestion(
              question:
                  "What is the purpose of the working set model in operating systems?",
              options: [
                "To identify the set of pages a process needs in memory to execute efficiently and prevent thrashing",
                "To organize files based on how frequently they are used",
                "To group related processes for batch execution",
                "To determine which applications should start automatically at boot time"
              ],
              correctIndex: 0,
              explanation:
                  "The working set model identifies the set of pages a process actively uses during a certain time window. By ensuring that a process's working set is kept in memory before allowing it to execute, the system can prevent thrashing and maintain good performance in a multiprogramming environment."),
          QuizQuestion(
              question:
                  "What is the purpose of reentrant code in operating systems?",
              options: [
                "To allow multiple processes to execute the same code simultaneously without interference",
                "To enable a program to re-enter the operating system after a crash",
                "To force a process to restart from the beginning if it encounters an error",
                "To reload code into memory each time it is executed"
              ],
              correctIndex: 0,
              explanation:
                  "Reentrant code is designed to be safely executed concurrently by multiple processes without interference. It doesn't modify itself during execution and stores process-specific data in stack or registers rather than in the code itself, allowing safe sharing of a single copy of the code among multiple processes."),
          QuizQuestion(
              question:
                  "What is the primary difference between symmetric and asymmetric multiprocessing?",
              options: [
                "In symmetric multiprocessing, all processors are treated equally, while in asymmetric multiprocessing, processors have specific roles",
                "Symmetric multiprocessing uses identical processors, while asymmetric uses different types of processors",
                "Symmetric multiprocessing is faster than asymmetric multiprocessing",
                "Symmetric multiprocessing is used only in servers, while asymmetric is used in personal computers"
              ],
              correctIndex: 0,
              explanation:
                  "In symmetric multiprocessing (SMP), all processors are treated equally, run the same copy of the OS, and can perform any task. In asymmetric multiprocessing, processors have specific roles—typically a master processor assigns tasks to slave processors, which may run different code or have restricted system access."),
          QuizQuestion(
              question: "What is the purpose of a mutex in operating systems?",
              options: [
                "To ensure mutual exclusion when accessing shared resources",
                "To multiplex several virtual connections over a single physical connection",
                "To check for memory corruption",
                "To extend user permissions temporarily"
              ],
              correctIndex: 0,
              explanation:
                  "A mutex (mutual exclusion) is a synchronization primitive used to ensure that only one process or thread can access a shared resource at a time. It provides a locking mechanism that prevents multiple execution threads from simultaneously executing critical sections of code that access shared resources."),
          QuizQuestion(
              question:
                  "What problem does the readers-writers problem address in process synchronization?",
              options: [
                "Controlling access when some processes read from and others write to a shared resource",
                "Managing communication between input and output devices",
                "Resolving conflicts when multiple users attempt to log in simultaneously",
                "Determining which process should read or write to disk first"
              ],
              correctIndex: 0,
              explanation:
                  "The readers-writers problem addresses how to control access to a shared resource when some processes (readers) only read the resource and others (writers) modify it. The challenge is to allow multiple readers simultaneous access while ensuring exclusive access for writers to maintain data consistency."),
          QuizQuestion(
              question:
                  "Which of the following best describes the purpose of demand paging?",
              options: [
                "To load pages into memory only when they are needed, rather than loading entire processes at once",
                "To force the system to create more swap space when memory is low",
                "To prioritize which processes get memory based on user demands",
                "To require payment for additional memory allocation in cloud computing"
              ],
              correctIndex: 0,
              explanation:
                  "Demand paging is a virtual memory management technique that loads pages into physical memory only when they are accessed (demanded), rather than loading an entire process at once. This optimizes memory usage and allows processes larger than physical memory to run."),
          QuizQuestion(
              question:
                  "What is the primary goal of the page replacement algorithm in virtual memory systems?",
              options: [
                "To select which page to remove from memory when a new page needs to be loaded",
                "To determine the optimal page size for a system",
                "To reorganize pages in memory to reduce fragmentation",
                "To encrypt page contents for security"
              ],
              correctIndex: 0,
              explanation:
                  "The primary goal of page replacement algorithms is to select which page to remove from memory when a new page needs to be loaded and no free frames are available. Good algorithms minimize page faults by keeping frequently used pages in memory."),
          QuizQuestion(
              question:
                  "In the context of I/O management, what is the purpose of spooling?",
              options: [
                "To buffer data for devices that cannot support interleaved data streams from multiple processes",
                "To encrypt data before sending it to output devices",
                "To compress data for more efficient storage",
                "To convert data between different formats"
              ],
              correctIndex: 0,
              explanation:
                  "Spooling (Simultaneous Peripheral Operations On-Line) buffers data for devices like printers that cannot support interleaved data streams from multiple processes. It allows multiple processes to queue their output for a device, which then processes these requests sequentially."),
          QuizQuestion(
              question:
                  "What is the difference between internal and external fragmentation?",
              options: [
                "Internal fragmentation occurs when allocated memory is larger than requested, while external fragmentation occurs when free memory is divided into small, non-contiguous blocks",
                "Internal fragmentation affects RAM, while external fragmentation affects disk storage",
                "Internal fragmentation occurs in single-user systems, while external occurs in multi-user systems",
                "Internal fragmentation is a hardware issue, while external fragmentation is a software issue"
              ],
              correctIndex: 0,
              explanation:
                  "Internal fragmentation occurs when allocated memory is slightly larger than requested (e.g., due to fixed block sizes), resulting in wasted space within allocated blocks. External fragmentation occurs when free memory is divided into small, non-contiguous blocks that individually are too small to satisfy allocation requests, even though the total free space is sufficient."),
          QuizQuestion(
              question:
                  "What is the purpose of an inode in Unix-like file systems?",
              options: [
                "To store metadata about a file but not its actual contents",
                "To encrypt file contents for security",
                "To compress files to save disk space",
                "To translate between different file formats"
              ],
              correctIndex: 0,
              explanation:
                  "An inode (index node) in Unix-like file systems stores metadata about a file including permissions, ownership, timestamps, size, and pointers to the disk blocks containing the file's data. It does not store the filename or the actual file contents."),
          QuizQuestion(
              question:
                  "What is the purpose of the process control block (PCB) in operating systems?",
              options: [
                "To store all the information needed to manage a process",
                "To physically control access to the CPU",
                "To block malicious processes from executing",
                "To prevent users from running too many processes simultaneously"
              ],
              correctIndex: 0,
              explanation:
                  "The Process Control Block (PCB) is a data structure used by the operating system to store all the information needed to manage a process, including process state, program counter, CPU registers, memory management information, accounting information, and I/O status information."),
          QuizQuestion(
              question: "What is a race condition in operating systems?",
              options: [
                "A situation where multiple processes access and manipulate shared data concurrently, and the outcome depends on the relative timing of their execution",
                "A competition between processors to complete tasks as quickly as possible",
                "A method of process scheduling based on priority",
                "A technique to speed up program execution by predicting branching outcomes"
              ],
              correctIndex: 0,
              explanation:
                  "A race condition occurs when multiple processes access and manipulate shared data concurrently, and the final outcome depends on the precise timing of their execution. These conditions can lead to unpredictable results and are a common source of bugs in concurrent programming."),
          QuizQuestion(
              question:
                  "Which of the following is true about the Completely Fair Scheduler (CFS) used in Linux?",
              options: [
                "It attempts to give each process a fair share of CPU time based on weights",
                "It always prioritizes I/O-bound processes over CPU-bound processes",
                "It schedules processes based solely on their static priorities",
                "It only works in single-processor systems"
              ],
              correctIndex: 0,
              explanation:
                  "The Completely Fair Scheduler (CFS) in Linux attempts to give each process a fair share of CPU time based on their weights (nice values). It tracks the 'virtual runtime' of each process and schedules the process with the smallest virtual runtime next, ensuring fairness over time."),
          QuizQuestion(
              question:
                  "What is NUMA (Non-Uniform Memory Access) architecture?",
              options: [
                "A memory design where memory access time depends on the memory location relative to the processor",
                "A technique where non-essential memory is compressed to save space",
                "A memory allocation strategy that prevents fragmentation",
                "A special type of RAM that doesn't require refreshing"
              ],
              correctIndex: 0,
              explanation:
                  "NUMA (Non-Uniform Memory Access) is a memory architecture used in multiprocessing systems where memory access time depends on the memory location relative to the processor. In NUMA systems, a processor can access its local memory faster than non-local memory (memory local to another processor or shared between processors)."),
        ];
      case QuizLevel.advanced:
        return [
          QuizQuestion(
              question: "What is a deadlock in an operating system?",
              options: [
                "When a process is killed by the OS",
                "When two or more processes are unable to proceed because each is waiting for resources held by others",
                "When a process consumes too much CPU time",
                "When the system crashes due to hardware failure"
              ],
              correctIndex: 1,
              explanation:
                  "A deadlock occurs when two or more processes are blocked forever, waiting for each other to release resources they need."),
          QuizQuestion(
              question: "What is virtual memory in operating systems?",
              options: [
                "Memory that doesn't physically exist",
                "A technique that uses disk space to simulate additional RAM",
                "Memory reserved for virtual machines",
                "The cache memory on the CPU"
              ],
              correctIndex: 1,
              explanation:
                  "Virtual memory is a memory management technique that uses disk space to simulate additional RAM, allowing programs to use more memory than physically available."),
          QuizQuestion(
              question: "What is thrashing in an operating system?",
              options: [
                "When a program crashes unexpectedly",
                "When the CPU utilization is very high",
                "When the OS spends more time paging than executing",
                "When multiple processes compete for CPU time"
              ],
              correctIndex: 2,
              explanation:
                  "Thrashing occurs when the system spends a disproportionate amount of time paging data between memory and disk, severely degrading system performance."),
          QuizQuestion(
              question:
                  "Which scheduling algorithm always selects the process with the shortest estimated processing time?",
              options: [
                "First-Come-First-Served (FCFS)",
                "Round Robin",
                "Shortest Job First (SJF)",
                "Priority Scheduling"
              ],
              correctIndex: 2,
              explanation:
                  "Shortest Job First (SJF) always selects the process with the shortest estimated processing time to execute next."),
          QuizQuestion(
              question:
                  "What is the purpose of a semaphore in operating systems?",
              options: [
                "To encrypt data transmissions",
                "To control access to shared resources",
                "To allocate memory to processes",
                "To detect hardware failures"
              ],
              correctIndex: 1,
              explanation:
                  "Semaphores are synchronization tools used to control access to shared resources in a multi-process environment, preventing race conditions."),
          QuizQuestion(
              question:
                  "What is the difference between a process and a thread?",
              options: [
                "Processes share memory while threads do not",
                "Threads are faster but use more resources than processes",
                "Processes are independent execution units while threads share memory within a process",
                "Threads can only be created in multicore systems"
              ],
              correctIndex: 2,
              explanation:
                  "Processes are independent execution units with their own memory space, while threads are lighter-weight execution units that share memory within the same process."),
          QuizQuestion(
              question:
                  "Which of the following is NOT a state in the process life cycle?",
              options: ["Ready", "Running", "Blocked", "Compiling"],
              correctIndex: 3,
              explanation:
                  "The typical process states are New, Ready, Running, Blocked/Waiting, and Terminated. 'Compiling' is not a process state but rather a step in program development."),
          QuizQuestion(
              question: "What is the purpose of paging in memory management?",
              options: [
                "To delete unused files",
                "To divide physical memory into fixed-sized blocks",
                "To prioritize which processes get CPU time",
                "To encrypt sensitive data in memory"
              ],
              correctIndex: 1,
              explanation:
                  "Paging is a memory management scheme that eliminates the need for contiguous allocation of physical memory by dividing memory into fixed-sized blocks called pages."),
          QuizQuestion(
              question: "What is the main purpose of an operating system?",
              options: [
                "To provide a user interface",
                "To manage hardware resources and provide services for applications",
                "To run applications faster",
                "To protect against viruses"
              ],
              correctIndex: 1,
              explanation:
                  "The primary purpose of an operating system is to manage computer hardware resources and provide common services for computer programs while acting as an intermediary between users and the computer hardware."),
          QuizQuestion(
              question: "What is a race condition?",
              options: [
                "When two processes compete for CPU cycles",
                "When a process is running too slowly",
                "When the outcome depends on the sequence or timing of uncontrollable events",
                "When multiple CPUs run the same process simultaneously"
              ],
              correctIndex: 2,
              explanation:
                  "A race condition occurs when the behavior of a system depends on the sequence or timing of uncontrollable events, typically when multiple processes access and manipulate shared data concurrently."),
          QuizQuestion(
              question: "What is the purpose of a context switch?",
              options: [
                "To change the user interface",
                "To save the state of a process so another can run",
                "To switch between different operating systems",
                "To change memory allocation strategies"
              ],
              correctIndex: 1,
              explanation:
                  "A context switch is the process of saving the state of a currently running process so that it can be restored and resumed later, allowing another process to run in the meantime."),
          QuizQuestion(
              question:
                  "What is the main advantage of a microkernel architecture?",
              options: [
                "Faster system calls",
                "More features available to users",
                "Enhanced security and reliability through modularity",
                "Better compatibility with older hardware"
              ],
              correctIndex: 2,
              explanation:
                  "Microkernel architecture enhances security and reliability through modularity by running essential services in user space rather than kernel space, isolating components and minimizing the impact of failures."),
          QuizQuestion(
              question:
                  "Which scheduling algorithm is most likely to cause starvation?",
              options: [
                "Round Robin",
                "First-Come-First-Served",
                "Priority Scheduling",
                "Shortest Job First"
              ],
              correctIndex: 2,
              explanation:
                  "Priority Scheduling is most likely to cause starvation because lower-priority processes may never execute if there is a continuous stream of higher-priority processes."),
          QuizQuestion(
              question: "What is the banker's algorithm used for?",
              options: [
                "Managing financial transactions in banking software",
                "Scheduling processes based on priority",
                "Deadlock avoidance by resource allocation",
                "Optimizing memory allocation"
              ],
              correctIndex: 2,
              explanation:
                  "The banker's algorithm is a resource allocation and deadlock avoidance algorithm that tests for safety by simulating allocation of maximum possible resources to processes."),
          QuizQuestion(
              question: "What is a page fault?",
              options: [
                "When a page in memory is corrupted",
                "When the OS tries to access a page that's not in physical memory",
                "When a process tries to access a restricted memory area",
                "When there's a hardware failure in the memory module"
              ],
              correctIndex: 1,
              explanation:
                  "A page fault occurs when a program accesses a memory page that is mapped in the virtual address space but not loaded in physical memory, requiring the OS to load it from secondary storage."),
          QuizQuestion(
              question:
                  "What is the purpose of a TLB (Translation Lookaside Buffer)?",
              options: [
                "To store temporary files",
                "To cache recently used page table entries",
                "To buffer network packets",
                "To store translation dictionaries for international OS versions"
              ],
              correctIndex: 1,
              explanation:
                  "A TLB is a memory cache that stores recent translations of virtual memory to physical memory addresses to reduce the time taken to access memory locations."),
          QuizQuestion(
              question:
                  "Which of the following is NOT a common disk scheduling algorithm?",
              options: [
                "FCFS (First-Come-First-Served)",
                "SCAN (Elevator)",
                "LIFO (Last-In-First-Out)",
                "C-SCAN (Circular SCAN)"
              ],
              correctIndex: 2,
              explanation:
                  "LIFO is not a common disk scheduling algorithm. Common algorithms include FCFS, SCAN (Elevator), C-SCAN, LOOK, and Shortest Seek Time First (SSTF)."),
          QuizQuestion(
              question:
                  "What is the primary difference between preemptive and non-preemptive scheduling?",
              options: [
                "Preemptive uses more memory",
                "Non-preemptive is always faster",
                "Preemptive can interrupt running processes",
                "Non-preemptive only works on single-core systems"
              ],
              correctIndex: 2,
              explanation:
                  "In preemptive scheduling, the operating system can interrupt a running process and switch to another based on priorities or time slices. In non-preemptive scheduling, once a process starts executing, it runs until it completes or blocks voluntarily."),
          QuizQuestion(
              question: "What is the main purpose of a device driver?",
              options: [
                "To physically power the hardware device",
                "To act as an interface between the OS and a specific hardware device",
                "To enhance the performance of hardware devices",
                "To protect hardware from unauthorized access"
              ],
              correctIndex: 1,
              explanation:
                  "A device driver is a specialized program that acts as an interface between the operating system and a specific hardware device, allowing the OS to communicate with and control the device."),
          QuizQuestion(
              question:
                  "What is the function of a file system in an operating system?",
              options: [
                "To create files",
                "To execute programs faster",
                "To organize and manage how data is stored and retrieved",
                "To compress data to save space"
              ],
              correctIndex: 2,
              explanation:
                  "A file system is responsible for organizing and managing how data is stored, accessed, and retrieved on storage devices, providing methods for naming, storing, retrieving, and updating data."),
          QuizQuestion(
              question:
                  "Which of the following best describes a zombie process?",
              options: [
                "A process that consumes excessive system resources",
                "A process that has completed execution but still has an entry in the process table",
                "A process that cannot be terminated by normal means",
                "A process infected by malware"
              ],
              correctIndex: 1,
              explanation:
                  "A zombie process (or defunct process) is one that has completed execution but still has an entry in the process table because its parent has not yet called wait() to read its exit status."),
          QuizQuestion(
              question:
                  "What is the difference between internal and external fragmentation?",
              options: [
                "Internal fragmentation occurs in RAM, external in storage devices",
                "Internal fragmentation is wasted space within allocated memory blocks, external is wasted space between allocated blocks",
                "Internal fragmentation can be fixed, external cannot",
                "Internal fragmentation affects performance, external does not"
              ],
              correctIndex: 1,
              explanation:
                  "Internal fragmentation occurs when allocated memory is slightly larger than requested memory, leaving unused space within allocated blocks. External fragmentation occurs when free memory is separated into small blocks, making it impossible to allocate large contiguous chunks."),
          QuizQuestion(
              question: "What is the purpose of swapping in memory management?",
              options: [
                "To exchange data between processes",
                "To temporarily move processes from memory to disk to free up RAM",
                "To switch between different user accounts",
                "To change the priority of running processes"
              ],
              correctIndex: 1,
              explanation:
                  "Swapping is a memory management technique where processes or parts of processes are temporarily moved from main memory to secondary storage (disk) to free up RAM for other processes."),
          QuizQuestion(
              question:
                  "What is the critical section problem in concurrent programming?",
              options: [
                "When critical system files become corrupted",
                "When multiple threads need to access shared resources simultaneously",
                "When a system reaches a critical state and might crash",
                "When the CPU reaches critical temperature levels"
              ],
              correctIndex: 1,
              explanation:
                  "The critical section problem deals with designing protocols that ensure when one process is executing in its critical section (accessing shared resources), no other process is allowed to execute in its critical section, preventing race conditions."),
          QuizQuestion(
              question:
                  "What is the main function of the scheduler in an operating system?",
              options: [
                "To schedule system maintenance",
                "To decide which process runs when",
                "To schedule backups of important files",
                "To manage clock synchronization"
              ],
              correctIndex: 1,
              explanation:
                  "The scheduler is responsible for deciding which process runs when and for how long, managing the allocation of CPU time among various processes to optimize system performance."),
          QuizQuestion(
              question:
                  "What is the difference between a monolithic kernel and a microkernel?",
              options: [
                "Monolithic kernels are smaller in code size",
                "Microkernels run entirely in user space",
                "Monolithic kernels run all OS services in kernel space, while microkernels run minimal services in kernel space",
                "Monolithic kernels are more modern than microkernels"
              ],
              correctIndex: 2,
              explanation:
                  "In a monolithic kernel architecture, all OS services run in kernel space, while in a microkernel architecture, only essential services run in kernel space and others run in user space as processes."),
          QuizQuestion(
              question: "What is the purpose of the fork() system call?",
              options: [
                "To split files into smaller pieces",
                "To create a copy of the calling process",
                "To branch execution in a program",
                "To handle multiple inputs simultaneously"
              ],
              correctIndex: 1,
              explanation:
                  "The fork() system call creates a new process by duplicating the calling process. The new process becomes the child process of the caller and gets a copy of the caller's data and stack segments."),
          QuizQuestion(
              question: "What is the role of the MMU (Memory Management Unit)?",
              options: [
                "To manage multimedia files",
                "To perform calculations for memory-intensive applications",
                "To translate virtual memory addresses to physical addresses",
                "To monitor memory usage statistics"
              ],
              correctIndex: 2,
              explanation:
                  "The Memory Management Unit (MMU) is a hardware component responsible for translating virtual memory addresses to physical addresses, handling memory protection, and cache control."),
          QuizQuestion(
              question: "Which of the following best describes mutexes?",
              options: [
                "High-speed network protocols",
                "Tools for detecting malware",
                "Synchronization primitives that provide exclusive access to shared resources",
                "Methods for compressing files"
              ],
              correctIndex: 2,
              explanation:
                  "Mutexes (mutual exclusion objects) are synchronization primitives that prevent multiple threads from simultaneously accessing shared resources in a critical section, thus avoiding race conditions."),
          QuizQuestion(
              question:
                  "What is the main advantage of the SSTF (Shortest Seek Time First) disk scheduling algorithm?",
              options: [
                "It guarantees fairness to all requests",
                "It minimizes seek time for individual requests",
                "It prevents starvation completely",
                "It works well with solid-state drives"
              ],
              correctIndex: 1,
              explanation:
                  "The main advantage of SSTF is that it minimizes seek time for individual requests by selecting the request closest to the current head position, which can improve overall system performance but may cause starvation.")
        ];
    }
  }

  // Data Structures and Algorithms questions based on level
  static List<QuizQuestion> _getDSAQuestions(QuizLevel level) {
    switch (level) {
      case QuizLevel.beginner:
        return [
          QuizQuestion(
              question:
                  "What is the time complexity of searching for an element in an unsorted array?",
              options: ["O(1)", "O(log n)", "O(n)", "O(n²)"],
              correctIndex: 2,
              explanation:
                  "In an unsorted array, we need to check each element one by one until we find the target element or reach the end. This requires examining up to n elements in the worst case, resulting in O(n) time complexity."),
          QuizQuestion(
              question:
                  "Which data structure operates on the LIFO (Last In First Out) principle?",
              options: ["Queue", "Stack", "Linked List", "Binary Tree"],
              correctIndex: 1,
              explanation:
                  "A stack operates on the Last In First Out (LIFO) principle, where the last element added is the first one to be removed, similar to a stack of plates where you add and remove from the top."),
          QuizQuestion(
              question:
                  "Which sorting algorithm has an average case time complexity of O(n log n) and is considered efficient for most inputs?",
              options: [
                "Bubble Sort",
                "Selection Sort",
                "Merge Sort",
                "Insertion Sort"
              ],
              correctIndex: 2,
              explanation:
                  "Merge Sort has an average case time complexity of O(n log n) and is considered efficient. It uses a divide-and-conquer approach and maintains this time complexity even in worst-case scenarios."),
          QuizQuestion(
              question:
                  "What is the main advantage of a linked list over an array?",
              options: [
                "Faster random access to elements",
                "Dynamic size (efficient insertion and deletion)",
                "Less memory usage",
                "Better cache locality"
              ],
              correctIndex: 1,
              explanation:
                  "The main advantage of a linked list over an array is its dynamic size, allowing for efficient insertions and deletions without requiring contiguous memory allocation. Elements can be added or removed with O(1) time complexity if the position is known."),
          QuizQuestion(
              question:
                  "What is the time complexity of accessing an element by index in an array?",
              options: ["O(1)", "O(log n)", "O(n)", "O(n log n)"],
              correctIndex: 0,
              explanation:
                  "Arrays provide constant-time O(1) access to elements by index because the memory address of any element can be calculated directly using its index, regardless of the array size."),
          QuizQuestion(
              question:
                  "Which data structure operates on the FIFO (First In First Out) principle?",
              options: ["Stack", "Queue", "Binary Tree", "Hash Table"],
              correctIndex: 1,
              explanation:
                  "A queue operates on the First In First Out (FIFO) principle, where the first element added is the first one to be removed, similar to a line of people waiting for service."),
          QuizQuestion(
              question: "In Big O notation, what does O(1) represent?",
              options: [
                "Linear time complexity",
                "Logarithmic time complexity",
                "Constant time complexity",
                "Quadratic time complexity"
              ],
              correctIndex: 2,
              explanation:
                  "O(1) represents constant time complexity, meaning the operation takes the same amount of time regardless of the input size. Examples include accessing an array element by index or adding an element to a stack."),
          QuizQuestion(
              question:
                  "What is the worst-case time complexity of bubble sort?",
              options: ["O(n)", "O(n log n)", "O(n²)", "O(log n)"],
              correctIndex: 2,
              explanation:
                  "The worst-case time complexity of bubble sort is O(n²), where n is the number of elements to be sorted. This occurs when the array is in reverse order and requires maximum comparisons and swaps."),
          QuizQuestion(
              question:
                  "Which of the following is NOT a linear data structure?",
              options: ["Array", "Linked List", "Stack", "Binary Tree"],
              correctIndex: 3,
              explanation:
                  "A Binary Tree is not a linear data structure because elements are arranged in a hierarchical manner with each element having at most two children. Linear data structures like arrays, linked lists, and stacks arrange elements sequentially."),
          QuizQuestion(
              question:
                  "What is the time complexity of inserting an element at the beginning of a linked list?",
              options: ["O(1)", "O(log n)", "O(n)", "O(n²)"],
              correctIndex: 0,
              explanation:
                  "Inserting an element at the beginning of a linked list has a time complexity of O(1) because it only requires updating a few pointers, regardless of the list size."),
          QuizQuestion(
              question:
                  "Which sorting algorithm is known for being stable, in-place, and efficient for small data sets or nearly sorted data?",
              options: [
                "Quick Sort",
                "Insertion Sort",
                "Heap Sort",
                "Merge Sort"
              ],
              correctIndex: 1,
              explanation:
                  "Insertion Sort is stable (maintains relative order of equal elements), in-place (uses minimal extra space), and performs well on small or nearly sorted data sets, with best case time complexity of O(n) when data is already sorted."),
          QuizQuestion(
              question:
                  "What data structure is typically used to implement a priority queue?",
              options: ["Stack", "Queue", "Heap", "Linked List"],
              correctIndex: 2,
              explanation:
                  "A Heap (typically a binary heap) is the most common data structure for implementing a priority queue because it efficiently supports the operations of finding and removing the highest priority element in O(log n) time."),
          QuizQuestion(
              question:
                  "In an undirected graph with n vertices, what is the maximum number of edges possible?",
              options: ["n", "n-1", "n(n-1)/2", "n²"],
              correctIndex: 2,
              explanation:
                  "In an undirected graph with n vertices, each vertex can be connected to at most n-1 other vertices. Since each edge connects two vertices and we need to avoid counting edges twice, the maximum number of edges is n(n-1)/2."),
          QuizQuestion(
              question: "What is the time complexity of binary search?",
              options: ["O(1)", "O(log n)", "O(n)", "O(n²)"],
              correctIndex: 1,
              explanation:
                  "Binary search has a time complexity of O(log n) because it halves the search space with each comparison, allowing it to efficiently find elements in sorted arrays by repeatedly dividing the search interval in half."),
          QuizQuestion(
              question:
                  "Which of these data structures allows for direct access to any element?",
              options: ["Linked List", "Array", "Stack", "Queue"],
              correctIndex: 1,
              explanation:
                  "Arrays allow for direct access to any element using its index, providing O(1) time complexity for element retrieval. The other data structures require traversal from beginning or end to access elements in the middle."),
          QuizQuestion(
              question:
                  "What is the space complexity of an algorithm that uses a fixed amount of additional memory regardless of input size?",
              options: ["O(1)", "O(log n)", "O(n)", "O(n²)"],
              correctIndex: 0,
              explanation:
                  "If an algorithm uses a fixed amount of additional memory regardless of input size, its space complexity is O(1), also known as constant space complexity."),
          QuizQuestion(
              question:
                  "Which of the following sorting algorithms uses a pivot element as part of its approach?",
              options: [
                "Insertion Sort",
                "Bubble Sort",
                "Quick Sort",
                "Selection Sort"
              ],
              correctIndex: 2,
              explanation:
                  "Quick Sort uses a pivot element as a key part of its divide-and-conquer strategy. It partitions the array around the pivot, placing elements smaller than the pivot to its left and larger elements to its right."),
          QuizQuestion(
              question:
                  "What is the primary limitation of using an array data structure?",
              options: [
                "Slow element access",
                "High memory overhead",
                "Fixed size at creation",
                "Cannot store multiple data types"
              ],
              correctIndex: 2,
              explanation:
                  "The primary limitation of arrays in most programming languages is their fixed size at creation. Once an array is allocated with a specific size, it cannot be easily resized without creating a new array and copying elements."),
          QuizQuestion(
              question:
                  "Which search algorithm requires the input data to be sorted?",
              options: [
                "Linear Search",
                "Binary Search",
                "Depth-First Search",
                "Breadth-First Search"
              ],
              correctIndex: 1,
              explanation:
                  "Binary Search requires the input data to be sorted in order to work correctly, as it relies on comparing the middle element with the target value to determine which half of the array to search next."),
          QuizQuestion(
              question:
                  "What is the worst-case time complexity for finding an element in a Binary Search Tree?",
              options: ["O(1)", "O(log n)", "O(n)", "O(n log n)"],
              correctIndex: 2,
              explanation:
                  "The worst-case time complexity for searching in a Binary Search Tree is O(n), which occurs when the tree is completely unbalanced (essentially a linked list). In a balanced BST, it would be O(log n)."),
          QuizQuestion(
              question:
                  "Which data structure is best suited for implementing a dictionary with key-value pairs?",
              options: ["Array", "Linked List", "Hash Table", "Queue"],
              correctIndex: 2,
              explanation:
                  "A Hash Table is ideal for implementing a dictionary with key-value pairs because it provides fast O(1) average-case time complexity for insertion, deletion, and lookup operations using keys."),
          QuizQuestion(
              question:
                  "What does the term 'stable' mean when referring to a sorting algorithm?",
              options: [
                "The algorithm never crashes",
                "The algorithm maintains the relative order of equal elements",
                "The algorithm works for any input size",
                "The algorithm has consistent performance"
              ],
              correctIndex: 1,
              explanation:
                  "A stable sorting algorithm maintains the relative order of equal elements in the sorted output as they appeared in the original input. This can be important when sorting by multiple criteria."),
          QuizQuestion(
              question:
                  "What is the best data structure for implementing an undo functionality in a text editor?",
              options: ["Array", "Stack", "Queue", "Hash Table"],
              correctIndex: 1,
              explanation:
                  "A Stack is the best choice for implementing undo functionality because it follows the Last In First Out (LIFO) principle, allowing the most recent changes to be undone first, which matches the expected behavior of an undo operation."),
          QuizQuestion(
              question:
                  "Which of the following is NOT an advantage of recursion?",
              options: [
                "It can simplify complex problems",
                "It often mirrors the problem's natural structure",
                "It is always more memory-efficient than iteration",
                "It can lead to elegant solutions"
              ],
              correctIndex: 2,
              explanation:
                  "Recursion is not always more memory-efficient than iteration. In fact, recursion often uses more memory due to the overhead of maintaining a call stack for each recursive call, which can lead to stack overflow for deep recursion."),
          QuizQuestion(
              question:
                  "In the context of graphs, what does 'adjacency list' refer to?",
              options: [
                "A list of all vertices in the graph",
                "A method for traversing graphs",
                "A representation where each vertex has a list of its connected vertices",
                "A sorted list of edges by weight"
              ],
              correctIndex: 2,
              explanation:
                  "An adjacency list is a graph representation where each vertex maintains a list of vertices it is connected to by edges. This is memory-efficient for sparse graphs where most vertices are not connected to each other."),
        ];
      case QuizLevel.intermediate:
        return [
          QuizQuestion(
              question:
                  "What is the time complexity of finding the kth smallest element using QuickSelect algorithm in the average case?",
              options: ["O(n)", "O(n log n)", "O(log n)", "O(k log n)"],
              correctIndex: 0,
              explanation:
                  "QuickSelect has an average-case time complexity of O(n) for finding the kth smallest element. It uses principles similar to QuickSort but only recurses into one partition, making it more efficient than sorting the entire array which would take O(n log n)."),
          QuizQuestion(
              question: "In a min-heap, where is the largest element located?",
              options: [
                "At the root",
                "At one of the leaf nodes",
                "Always at the last level",
                "In the middle of the heap"
              ],
              correctIndex: 1,
              explanation:
                  "In a min-heap, the smallest element is at the root, and each parent is smaller than its children. Consequently, the largest element must be at one of the leaf nodes, though determining which specific leaf requires examining all leaves."),
          QuizQuestion(
              question:
                  "What is the time complexity of the Floyd-Warshall algorithm for finding all shortest paths in a weighted graph?",
              options: ["O(V + E)", "O(V log V + E)", "O(V²)", "O(V³)"],
              correctIndex: 3,
              explanation:
                  "The Floyd-Warshall algorithm has a time complexity of O(V³), where V is the number of vertices. It uses dynamic programming to find the shortest paths between all pairs of vertices in a weighted graph, including those with negative edge weights (but no negative cycles)."),
          QuizQuestion(
              question:
                  "Which of the following data structures provides O(log n) time complexity for both insertion and deletion operations?",
              options: [
                "Unsorted Array",
                "Hash Table",
                "Binary Search Tree",
                "Balanced Binary Search Tree (e.g., AVL or Red-Black)"
              ],
              correctIndex: 3,
              explanation:
                  "Balanced Binary Search Trees like AVL or Red-Black trees provide O(log n) time complexity for both insertion and deletion operations. They maintain balance during modifications to ensure the height remains logarithmic, unlike regular BSTs which can degenerate."),
          QuizQuestion(
              question:
                  "What is the primary difference between a B-tree and a binary search tree?",
              options: [
                "B-trees can only store integers",
                "B-trees allow more than two children per node",
                "B-trees don't require balancing",
                "B-trees can't be traversed in-order"
              ],
              correctIndex: 1,
              explanation:
                  "The primary difference is that B-trees allow more than two children per node (they are m-way search trees). This property makes them well-suited for storage systems where data is read in blocks, such as databases and file systems."),
          QuizQuestion(
              question:
                  "What is the worst-case time complexity of the Dijkstra's algorithm when using a binary heap for the priority queue?",
              options: ["O(V)", "O(E)", "O(V log V)", "O(E log V)"],
              correctIndex: 3,
              explanation:
                  "Using a binary heap for the priority queue, Dijkstra's algorithm has a worst-case time complexity of O(E log V), where E is the number of edges and V is the number of vertices. Each edge relaxation operation takes O(log V) time due to heap operations."),
          QuizQuestion(
              question:
                  "What problem does the union-find (disjoint set) data structure help solve?",
              options: [
                "Sorting elements efficiently",
                "Finding shortest paths",
                "Detecting cycles in undirected graphs",
                "Traversing trees in-order"
              ],
              correctIndex: 2,
              explanation:
                  "The union-find (disjoint set) data structure is particularly useful for detecting cycles in undirected graphs and is a key component in algorithms like Kruskal's for finding minimum spanning trees. It efficiently handles operations to merge sets and determine if elements belong to the same set."),
          QuizQuestion(
              question:
                  "What is the advantage of using a trie (prefix tree) over a hash table for storing strings?",
              options: [
                "Tries use less memory than hash tables",
                "Tries provide faster lookup times in all cases",
                "Tries allow efficient prefix matching and lexicographic sorting",
                "Tries have simpler implementation"
              ],
              correctIndex: 2,
              explanation:
                  "Tries excel at prefix matching operations (finding all strings with a common prefix) and lexicographic sorting, which are operations that hash tables don't efficiently support. This makes tries especially useful for applications like autocomplete and spell checking."),
          QuizQuestion(
              question:
                  "In the context of graph algorithms, what does the term 'topological sorting' refer to?",
              options: [
                "Sorting vertices by their degree (number of connections)",
                "Arranging vertices in order of their discovery during traversal",
                "Linear ordering of vertices such that for every directed edge (u,v), vertex u comes before v",
                "Sorting edges by their weights"
              ],
              correctIndex: 2,
              explanation:
                  "Topological sorting is a linear ordering of vertices in a directed acyclic graph (DAG) such that for every directed edge (u,v), vertex u comes before v in the ordering. It's used in scheduling tasks with dependencies, build systems, and course prerequisites."),
          QuizQuestion(
              question:
                  "What is the primary benefit of using a skip list over a balanced binary search tree?",
              options: [
                "Lower memory usage",
                "Simpler implementation while maintaining logarithmic operations",
                "Better worst-case performance",
                "Support for range queries"
              ],
              correctIndex: 1,
              explanation:
                  "A skip list's primary benefit is its relatively simple implementation while still providing expected O(log n) time complexity for search, insert, and delete operations. Unlike balanced trees that require complex rotation operations, skip lists use randomization to maintain balance probabilistically."),
          QuizQuestion(
              question:
                  "Which type of algorithm is best suited for finding all possible solutions to a problem like generating all permutations or combinations?",
              options: [
                "Greedy algorithms",
                "Dynamic programming",
                "Divide and conquer",
                "Backtracking"
              ],
              correctIndex: 3,
              explanation:
                  "Backtracking is well-suited for problems that require finding all possible solutions, like generating permutations or combinations. It works by incrementally building candidates and abandoning them (backtracking) when they cannot lead to a valid solution."),
          QuizQuestion(
              question:
                  "When implementing a hash table, what is the purpose of a load factor?",
              options: [
                "To measure the hash function's collision rate",
                "To determine how full the hash table is and when to resize",
                "To calculate the optimal hash key length",
                "To track the number of successful lookups"
              ],
              correctIndex: 1,
              explanation:
                  "The load factor in a hash table is a measure of how full the table is (number of stored elements divided by table size). It helps determine when to resize the table to maintain efficient operations, as performance degrades when the load factor becomes too high."),
          QuizQuestion(
              question:
                  "What is the space complexity of the recursive implementation of QuickSort?",
              options: ["O(1)", "O(log n)", "O(n)", "O(n log n)"],
              correctIndex: 1,
              explanation:
                  "The recursive implementation of QuickSort has a space complexity of O(log n) in the average case due to the call stack depth for recursion. In the worst case (already sorted array with poor pivot selection), it can degrade to O(n)."),
          QuizQuestion(
              question:
                  "Which of the following is NOT a property of a Red-Black Tree?",
              options: [
                "Every node is either red or black",
                "The root is always black",
                "Red nodes cannot have red children",
                "All paths from root to leaves contain the same number of black nodes"
              ],
              correctIndex: 3,
              explanation:
                  "In a Red-Black Tree, all paths from the root to any leaf must contain the same number of black nodes (the 'black height'), but not necessarily the same total number of nodes. The property 'All paths from root to leaves contain the same number of nodes' is incorrect."),
          QuizQuestion(
              question:
                  "What is the time complexity of building a heap from an unsorted array?",
              options: ["O(n)", "O(n log n)", "O(log n)", "O(n²)"],
              correctIndex: 0,
              explanation:
                  "Building a heap from an unsorted array can be done in O(n) time using the heapify algorithm. This is more efficient than inserting elements one by one, which would take O(n log n) time."),
          QuizQuestion(
              question:
                  "In the context of dynamic programming, what is 'memoization'?",
              options: [
                "Dividing a problem into non-overlapping subproblems",
                "Storing results of expensive function calls to avoid redundant recalculation",
                "Converting recursive algorithms to iterative ones",
                "Optimizing space complexity by reusing memory"
              ],
              correctIndex: 1,
              explanation:
                  "Memoization in dynamic programming refers to storing the results of expensive function calls (typically recursive) and returning the cached result when the same inputs occur again. This avoids redundant calculations and significantly improves performance for problems with overlapping subproblems."),
          QuizQuestion(
              question:
                  "What is the primary difference between Breadth-First Search (BFS) and Depth-First Search (DFS)?",
              options: [
                "BFS uses a queue while DFS uses a stack",
                "BFS works only on trees while DFS works on any graph",
                "BFS finds the shortest path while DFS always finds the optimal solution",
                "BFS has lower space complexity than DFS"
              ],
              correctIndex: 0,
              explanation:
                  "The primary implementation difference is that BFS uses a queue to explore all neighbors at the current depth before moving to the next level, while DFS uses a stack (or recursion) to explore as far as possible along each branch before backtracking."),
          QuizQuestion(
              question:
                  "What algorithm would you use to find the strongly connected components in a directed graph?",
              options: [
                "Dijkstra's algorithm",
                "Prim's algorithm",
                "Kruskal's algorithm",
                "Kosaraju's algorithm"
              ],
              correctIndex: 3,
              explanation:
                  "Kosaraju's algorithm is specifically designed to find strongly connected components (SCCs) in a directed graph. It uses two passes of DFS: first to determine the finishing times of vertices, and second to find the SCCs in the transposed graph."),
          QuizQuestion(
              question: "What is amortized time complexity?",
              options: [
                "The average time taken over all possible inputs",
                "The cost of an operation averaged over a sequence of operations",
                "The time complexity when memory access is optimized",
                "The time complexity when using parallel processing"
              ],
              correctIndex: 1,
              explanation:
                  "Amortized time complexity refers to the cost of an operation averaged over a sequence of operations. It's useful for analyzing data structures like dynamic arrays where occasional operations (like resizing) are expensive, but happen infrequently enough that the average cost per operation remains low."),
          QuizQuestion(
              question:
                  "Which of the following problems cannot be solved efficiently using dynamic programming?",
              options: [
                "Finding the longest common subsequence",
                "Solving the traveling salesman problem exactly",
                "Computing Fibonacci numbers",
                "Finding the longest increasing subsequence"
              ],
              correctIndex: 1,
              explanation:
                  "The traveling salesman problem (TSP) cannot be solved efficiently with dynamic programming for large inputs. While DP can be applied to TSP, its time complexity remains exponential O(n²·2ⁿ), making it impractical for large n. The other listed problems have polynomial-time DP solutions."),
          QuizQuestion(
              question:
                  "In a B+ tree used in databases, where is all the data stored?",
              options: [
                "In all nodes throughout the tree",
                "Only in the internal nodes",
                "Only in the leaf nodes",
                "Only in the root node"
              ],
              correctIndex: 2,
              explanation:
                  "In a B+ tree, all data records or pointers to data records are stored exclusively in the leaf nodes. Internal nodes (including the root if it's not a leaf) only contain keys for navigating the tree, which enables more efficient indexing and range queries."),
          QuizQuestion(
              question:
                  "What is the time complexity of the Bellman-Ford algorithm for finding shortest paths from a single source?",
              options: ["O(V)", "O(E log V)", "O(V + E)", "O(V·E)"],
              correctIndex: 3,
              explanation:
                  "The Bellman-Ford algorithm has a time complexity of O(V·E), where V is the number of vertices and E is the number of edges. Unlike Dijkstra's algorithm, it can handle graphs with negative edge weights and detect negative weight cycles."),
          QuizQuestion(
              question:
                  "Which sorting algorithm is used by most programming languages for their built-in sort functions?",
              options: [
                "Quicksort with optimizations",
                "Merge sort",
                "Heap sort",
                "Insertion sort"
              ],
              correctIndex: 0,
              explanation:
                  "Most programming languages implement their built-in sort functions using Quicksort with various optimizations. These often include switching to insertion sort for small subarrays, using median-of-three pivot selection, and other enhancements to address Quicksort's worst-case scenarios."),
          QuizQuestion(
              question: "What is the purpose of the A* search algorithm?",
              options: [
                "To find the shortest path between two nodes in an unweighted graph",
                "To find a minimum spanning tree",
                "To find the shortest path using heuristics to improve performance",
                "To detect negative cycles in a graph"
              ],
              correctIndex: 2,
              explanation:
                  "A* search algorithm is used to find the shortest path from a start node to a goal node in a weighted graph. It uses heuristics to guide the search more efficiently than algorithms like Dijkstra's by prioritizing paths that appear to lead closer to the goal."),
          QuizQuestion(
              question: "What technique does Radix Sort use to sort elements?",
              options: [
                "Comparison-based sorting",
                "Dividing the array into smaller subarrays",
                "Sorting by individual digits or characters",
                "Using a heap data structure"
              ],
              correctIndex: 2,
              explanation:
                  "Radix Sort is a non-comparative sorting algorithm that sorts data by processing individual digits or characters. It sorts numbers digit by digit from the least significant digit to the most significant digit (LSD Radix Sort) or vice versa (MSD Radix Sort).")
        ];
      case QuizLevel.advanced:
        return [
          QuizQuestion(
              question: "What is the time complexity of binary search?",
              options: ["O(n)", "O(log n)", "O(n log n)", "O(n²)"],
              correctIndex: 1,
              explanation:
                  "Binary search has a time complexity of O(log n) because it repeatedly divides the search interval in half, eliminating half of the remaining elements in each iteration."),

          QuizQuestion(
              question:
                  "Which data structure operates on a LIFO (Last In First Out) principle?",
              options: ["Queue", "Stack", "Linked List", "Binary Tree"],
              correctIndex: 1,
              explanation:
                  "A stack operates on the LIFO (Last In First Out) principle, where the last element added is the first one to be removed, similar to a stack of plates."),

          QuizQuestion(
              question: "What is the worst-case time complexity of quicksort?",
              options: ["O(n)", "O(log n)", "O(n log n)", "O(n²)"],
              correctIndex: 3,
              explanation:
                  "The worst-case time complexity of quicksort is O(n²), which occurs when the pivot selected is consistently the smallest or largest element, causing highly unbalanced partitions."),

          QuizQuestion(
              question: "Which of the following is NOT a balanced binary tree?",
              options: [
                "AVL Tree",
                "Red-Black Tree",
                "B-Tree",
                "Binary Search Tree"
              ],
              correctIndex: 3,
              explanation:
                  "A regular Binary Search Tree (BST) is not necessarily balanced. Without balancing mechanisms like those in AVL, Red-Black trees, or B-Trees, a BST can degenerate into a linked list in worst cases."),

          QuizQuestion(
              question:
                  "What data structure would be most suitable for implementing a priority queue?",
              options: ["Array", "Stack", "Heap", "Hash Table"],
              correctIndex: 2,
              explanation:
                  "A heap is most suitable for implementing a priority queue because it provides efficient (O(log n)) operations for both insertion and deletion of the highest/lowest priority element."),

          QuizQuestion(
              question:
                  "Which sorting algorithm has the same time complexity in best, average, and worst cases?",
              options: [
                "Bubble Sort",
                "Quick Sort",
                "Merge Sort",
                "Insertion Sort"
              ],
              correctIndex: 2,
              explanation:
                  "Merge Sort has O(n log n) time complexity in all cases (best, average, and worst), making it very predictable regardless of the input data's initial arrangement."),

          QuizQuestion(
              question:
                  "What is the time complexity of inserting an element at the end of an array?",
              options: ["O(1)", "O(log n)", "O(n)", "O(n log n)"],
              correctIndex: 0,
              explanation:
                  "Inserting an element at the end of an array (assuming there's enough space) has a time complexity of O(1) since it involves a single operation to place the element at the last position."),

          QuizQuestion(
              question:
                  "Which data structure is best for implementing a dictionary (key-value pairs)?",
              options: ["Array", "Linked List", "Hash Table", "Queue"],
              correctIndex: 2,
              explanation:
                  "A Hash Table is best for implementing a dictionary because it provides O(1) average time complexity for insertion, deletion, and lookup operations based on keys."),

          QuizQuestion(
              question:
                  "What is the space complexity of depth-first search (DFS) on a graph with V vertices and E edges?",
              options: ["O(1)", "O(V)", "O(E)", "O(V+E)"],
              correctIndex: 1,
              explanation:
                  "The space complexity of DFS is O(V) in the worst case, due to the recursion stack or explicit stack used to track visited vertices, which can contain up to V vertices in a path."),

          QuizQuestion(
              question:
                  "Which of the following algorithms can be used to find the shortest path in a weighted graph?",
              options: [
                "Depth-First Search",
                "Breadth-First Search",
                "Dijkstra's Algorithm",
                "Kruskal's Algorithm"
              ],
              correctIndex: 2,
              explanation:
                  "Dijkstra's Algorithm is used to find the shortest path in a weighted graph with non-negative edge weights, by greedily selecting the unvisited vertex with the smallest tentative distance."),

          QuizQuestion(
              question:
                  "What is the time complexity of accessing an element in a linked list by index?",
              options: ["O(1)", "O(log n)", "O(n)", "O(n log n)"],
              correctIndex: 2,
              explanation:
                  "Accessing an element by index in a linked list has a time complexity of O(n) because you need to traverse the list from the beginning until you reach the desired index."),

          QuizQuestion(
              question:
                  "Which of the following is NOT an advantage of using a B-tree?",
              options: [
                "Good for disk access",
                "Self-balancing",
                "Constant time operations",
                "Reduces disk I/O"
              ],
              correctIndex: 2,
              explanation:
                  "B-trees do not offer constant time O(1) operations. Their search, insertion, and deletion operations have O(log n) time complexity. Their key advantages are being good for disk access, self-balancing, and reducing disk I/O."),

          QuizQuestion(
              question: "What is the purpose of hashing in data structures?",
              options: [
                "To encrypt data",
                "To compress data",
                "To map data to a fixed size array",
                "To sort data efficiently"
              ],
              correctIndex: 2,
              explanation:
                  "The primary purpose of hashing in data structures is to map data of arbitrary size to a fixed size array (hash table), allowing for efficient retrieval, insertion, and deletion operations."),

          QuizQuestion(
              question:
                  "Which of the following is a divide-and-conquer algorithm?",
              options: [
                "Bubble Sort",
                "Insertion Sort",
                "Selection Sort",
                "Merge Sort"
              ],
              correctIndex: 3,
              explanation:
                  "Merge Sort is a divide-and-conquer algorithm that divides the input array into two halves, recursively sorts them, and then merges the sorted halves to produce the final sorted array."),

          QuizQuestion(
              question:
                  "What is the worst-case time complexity of searching in a binary search tree?",
              options: ["O(1)", "O(log n)", "O(n)", "O(n log n)"],
              correctIndex: 2,
              explanation:
                  "The worst-case time complexity of searching in a binary search tree is O(n), which occurs when the tree is completely unbalanced (essentially a linked list)."),

          QuizQuestion(
              question:
                  "Which data structure is typically used to implement breadth-first search?",
              options: ["Stack", "Queue", "Heap", "Hash Table"],
              correctIndex: 1,
              explanation:
                  "A Queue is typically used to implement breadth-first search (BFS) because it processes nodes in a first-in, first-out manner, exploring all neighbors at the current depth before moving to the next level."),

          QuizQuestion(
              question: "What is dynamic programming?",
              options: [
                "A programming paradigm for mobile apps",
                "An algorithm design technique that solves problems by breaking them down into simpler subproblems",
                "A method to write code that changes during runtime",
                "A technique for automatically modifying code based on user input"
              ],
              correctIndex: 1,
              explanation:
                  "Dynamic programming is an algorithm design technique that solves complex problems by breaking them down into simpler overlapping subproblems and storing the results of these subproblems to avoid redundant calculations."),

          QuizQuestion(
              question:
                  "What is the time complexity of heapify operation in a binary heap?",
              options: ["O(1)", "O(log n)", "O(n)", "O(n log n)"],
              correctIndex: 1,
              explanation:
                  "The heapify operation in a binary heap has a time complexity of O(log n) because it involves comparing and potentially swapping elements from the target node down to a leaf, with a maximum path length of log n."),

          QuizQuestion(
              question:
                  "Which of the following is NOT a graph traversal algorithm?",
              options: [
                "Depth-First Search",
                "Breadth-First Search",
                "Quicksort",
                "Topological Sort"
              ],
              correctIndex: 2,
              explanation:
                  "Quicksort is a sorting algorithm, not a graph traversal algorithm. Depth-First Search, Breadth-First Search, and Topological Sort are all graph traversal algorithms."),

          QuizQuestion(
              question:
                  "What is the space complexity of an adjacency matrix representation of a graph with V vertices?",
              options: ["O(1)", "O(V)", "O(V²)", "O(V+E)"],
              correctIndex: 2,
              explanation:
                  "An adjacency matrix for a graph with V vertices requires O(V²) space because it uses a V×V matrix to represent all possible connections between vertices, regardless of how many edges actually exist."),

          QuizQuestion(
              question:
                  "In a min-heap, what is the relationship between a parent node and its children?",
              options: [
                "Parent is greater than both children",
                "Parent is less than both children",
                "Parent is equal to both children",
                "Parent is the average of its children"
              ],
              correctIndex: 1,
              explanation:
                  "In a min-heap, every parent node has a value less than or equal to the values of its children, ensuring that the minimum element is always at the root."),

          QuizQuestion(
              question: "What problem does the Knapsack algorithm solve?",
              options: [
                "Finding the shortest path in a graph",
                "Sorting an array of elements",
                "Maximizing value while keeping weight under a limit",
                "Searching for elements in a sorted array"
              ],
              correctIndex: 2,
              explanation:
                  "The Knapsack algorithm solves the problem of maximizing the total value of items placed in a knapsack while keeping the total weight under a given limit, a classic optimization problem."),

          QuizQuestion(
              question:
                  "Which of the following data structures allows for O(1) insertion and deletion at both ends?",
              options: [
                "Array",
                "Singly Linked List",
                "Deque (Double-ended queue)",
                "Binary Search Tree"
              ],
              correctIndex: 2,
              explanation:
                  "A Deque (Double-ended queue) allows for O(1) insertion and deletion at both ends, making it more flexible than both stacks and queues."),

          QuizQuestion(
              question:
                  "What is the primary advantage of a trie data structure?",
              options: [
                "Efficient storage of integers",
                "Fast string search and prefix operations",
                "Constant time complexity for all operations",
                "Simple implementation"
              ],
              correctIndex: 1,
              explanation:
                  "The primary advantage of a trie (prefix tree) is fast string search, prefix operations, and autocomplete functionality, with time complexity dependent on the string length rather than the number of strings stored."),

          QuizQuestion(
              question:
                  "Which algorithm is used to find the minimum spanning tree of a graph?",
              options: [
                "Dijkstra's Algorithm",
                "A* Search Algorithm",
                "Floyd-Warshall Algorithm",
                "Kruskal's Algorithm"
              ],
              correctIndex: 3,
              explanation:
                  "Kruskal's Algorithm is used to find the minimum spanning tree of a graph, which is a subset of edges that connects all vertices with the minimum possible total edge weight."),

          QuizQuestion(
              question:
                  "What data structure would you use to check if a given string is a palindrome?",
              options: [
                "Queue",
                "Stack",
                "Heap",
                "Any of the above could be used efficiently"
              ],
              correctIndex: 1,
              explanation:
                  "A Stack is particularly useful for checking if a string is a palindrome. You can push the first half of characters onto the stack, then pop and compare with the second half of the string to check for matching characters."),

          QuizQuestion(
              question:
                  "Which of the following sorting algorithms is in-place?",
              options: [
                "Merge Sort",
                "Radix Sort",
                "Quick Sort",
                "Counting Sort"
              ],
              correctIndex: 2,
              explanation:
                  "Quick Sort is typically implemented as an in-place sorting algorithm, meaning it doesn't require significant additional space proportional to the input size beyond the original array and a small, constant-sized call stack."),

          QuizQuestion(
              question:
                  "What is the average time complexity of hash table operations (insert, delete, search)?",
              options: ["O(1)", "O(log n)", "O(n)", "O(n log n)"],
              correctIndex: 0,
              explanation:
                  "The average time complexity of hash table operations (insert, delete, search) is O(1) with a good hash function and appropriate load factor, making hash tables extremely efficient for these operations."),

          QuizQuestion(
              question:
                  "In algorithm analysis, what does 'amortized time complexity' refer to?",
              options: [
                "The complexity of an algorithm averaged over all possible inputs",
                "The worst-case complexity when the algorithm is run repeatedly",
                "The average cost of an operation over a sequence of operations",
                "The minimum time required for an algorithm to complete"
              ],
              correctIndex: 2,
              explanation:
                  "Amortized time complexity refers to the average cost of an operation over a sequence of operations, accounting for occasional expensive operations balanced by many inexpensive ones, like in dynamic arrays where occasional resizing is balanced by simple insertions."),
          // QuizQuestion(
          //     question: "What is the time complexity of binary search?",
          //     options: ["O(n)", "O(log n)", "O(n log n)", "O(n²)"],
          //     correctIndex: 1,
          //     explanation:
          //         "Binary search has a time complexity of O(log n) because with each comparison, it eliminates half of the remaining elements."),
          // QuizQuestion(
          //     question: "Which data structure operates on the LIFO principle?",
          //     options: ["Queue", "Stack", "Linked List", "Binary Tree"],
          //     correctIndex: 1,
          //     explanation:
          //         "A Stack follows the Last In First Out (LIFO) principle, where the last element added is the first one to be removed."),
          QuizQuestion(
              question: "What is the space complexity of merge sort?",
              options: ["O(1)", "O(log n)", "O(n)", "O(n log n)"],
              correctIndex: 2,
              explanation:
                  "Merge sort has a space complexity of O(n) because it requires additional space proportional to the size of the input array."),
          QuizQuestion(
              question:
                  "Which of the following is not a balanced binary search tree?",
              options: [
                "AVL Tree",
                "Red-Black Tree",
                "B-Tree",
                "Binary Search Tree"
              ],
              correctIndex: 3,
              explanation:
                  "A standard Binary Search Tree is not necessarily balanced. AVL, Red-Black, and B-Trees are all balanced tree data structures."),
          QuizQuestion(
              question: "What is the worst-case time complexity of quicksort?",
              options: ["O(n)", "O(log n)", "O(n log n)", "O(n²)"],
              correctIndex: 3,
              explanation:
                  "The worst-case time complexity of quicksort is O(n²), which occurs when the pivot chosen is consistently the smallest or largest element.")
        ];
    }
  }

  // Web Development questions based on level
  static List<QuizQuestion> _getWebDevQuestions(QuizLevel level) {
    switch (level) {
      case QuizLevel.beginner:
        return [
          QuizQuestion(
              question: "What does HTML stand for?",
              options: [
                "Hyper Text Markup Language",
                "High Tech Modern Language",
                "Hyperlink and Text Markup Language",
                "Home Tool Markup Language"
              ],
              correctIndex: 0,
              explanation:
                  "HTML stands for Hyper Text Markup Language. It is the standard markup language for creating web pages and web applications."),
          QuizQuestion(
              question: "Which HTML tag is used to define an unordered list?",
              options: ["<ol>", "<li>", "<ul>", "<list>"],
              correctIndex: 2,
              explanation:
                  "The <ul> tag defines an unordered (bulleted) list. Use the <li> tag to define list items within the unordered list."),
          QuizQuestion(
              question:
                  "What is the correct HTML element for the largest heading?",
              options: ["<heading>", "<h6>", "<head>", "<h1>"],
              correctIndex: 3,
              explanation:
                  "<h1> defines the largest heading in HTML. Headings range from <h1> (largest) to <h6> (smallest)."),
          QuizQuestion(
              question:
                  "Which CSS property is used to change the text color of an element?",
              options: ["text-color", "font-color", "color", "text-style"],
              correctIndex: 2,
              explanation:
                  "The 'color' property is used to set the color of text in CSS."),
          QuizQuestion(
              question:
                  "What is the correct CSS syntax for making all the <p> elements bold?",
              options: [
                "p {font-weight: bold;}",
                "p {text-size: bold;}",
                "<p style='font-size: bold;'>",
                "p.all {font-weight: bold;}"
              ],
              correctIndex: 0,
              explanation:
                  "The correct CSS syntax is 'p {font-weight: bold;}' which selects all paragraph elements and applies the bold font weight."),
          QuizQuestion(
              question:
                  "In CSS, what property is used to set the background color?",
              options: ["bgcolor", "color", "background-color", "background"],
              correctIndex: 2,
              explanation:
                  "The 'background-color' property is used to set the background color of an element in CSS."),
          QuizQuestion(
              question: "What does CSS stand for?",
              options: [
                "Creative Style Sheets",
                "Computer Style Sheets",
                "Cascading Style Sheets",
                "Colorful Style Sheets"
              ],
              correctIndex: 2,
              explanation:
                  "CSS stands for Cascading Style Sheets. It describes how HTML elements should be displayed."),
          QuizQuestion(
              question: "What is the correct HTML for creating a hyperlink?",
              options: [
                "<a url='http://www.example.com'>Example</a>",
                "<a href='http://www.example.com'>Example</a>",
                "<hyperlink='http://www.example.com'>Example</hyperlink>",
                "<link>http://www.example.com</link>"
              ],
              correctIndex: 1,
              explanation:
                  "The correct HTML syntax for creating a hyperlink is using the <a> tag with the href attribute that specifies the URL."),
          QuizQuestion(
              question: "Which HTML attribute is used to define inline styles?",
              options: ["class", "styles", "style", "font"],
              correctIndex: 2,
              explanation:
                  "The 'style' attribute is used to define inline CSS styles for an HTML element."),
          QuizQuestion(
              question:
                  "What is the correct HTML element for inserting a line break?",
              options: ["<br>", "<break>", "<lb>", "<newline>"],
              correctIndex: 0,
              explanation:
                  "The <br> tag inserts a single line break. It's an empty tag which means it has no end tag."),
          QuizQuestion(
              question:
                  "What is JavaScript primarily used for in web development?",
              options: [
                "Styling web pages",
                "Creating structure for web content",
                "Adding interactivity to websites",
                "Managing server databases"
              ],
              correctIndex: 2,
              explanation:
                  "JavaScript is primarily used to add interactivity to web pages, allowing them to respond to user actions, update content dynamically, and create interactive features."),
          QuizQuestion(
              question: "Which symbol is used to start a CSS ID selector?",
              options: [".", "#", "*", "@"],
              correctIndex: 1,
              explanation:
                  "The '#' symbol is used to define an ID selector in CSS. ID selectors select a single, unique element."),
          QuizQuestion(
              question: "What is the purpose of the HTML <meta> tag?",
              options: [
                "To create navigation menus",
                "To provide metadata about the HTML document",
                "To define a mathematical formula",
                "To create a table in HTML"
              ],
              correctIndex: 1,
              explanation:
                  "The <meta> tag provides metadata about the HTML document. Metadata is information about data that is not displayed on the page but is used by browsers and search engines."),
          QuizQuestion(
              question: "What is the correct way to comment in JavaScript?",
              options: [
                "<!-- This is a comment -->",
                "// This is a comment",
                "/* This is a comment */",
                "Both B and C"
              ],
              correctIndex: 3,
              explanation:
                  "JavaScript supports both single-line comments using // and multi-line comments using /* */."),
          QuizQuestion(
              question:
                  "What is the correct HTML for adding a background color?",
              options: [
                "<body style='background-color: yellow;'>",
                "<background>yellow</background>",
                "<body bg='yellow'>",
                "<div color='yellow'>"
              ],
              correctIndex: 0,
              explanation:
                  "To add a background color to an HTML element, you use the 'style' attribute with the 'background-color' property."),
          QuizQuestion(
              question: "Which CSS property controls the text size?",
              options: ["text-size", "font-style", "text-style", "font-size"],
              correctIndex: 3,
              explanation:
                  "The 'font-size' property is used to control the size of text in CSS."),
          QuizQuestion(
              question: "What is the correct HTML for making a drop-down list?",
              options: [
                "<list>",
                "<input type='dropdown'>",
                "<select>",
                "<dropdown>"
              ],
              correctIndex: 2,
              explanation:
                  "The <select> element is used to create a drop-down list in HTML. It is used together with <option> elements to define the available options in the list."),
          QuizQuestion(
              question: "In JavaScript, how do you declare a variable?",
              options: [
                "v myVariable;",
                "var myVariable;",
                "variable myVariable;",
                "int myVariable;"
              ],
              correctIndex: 1,
              explanation:
                  "In JavaScript, you can declare a variable using 'var', 'let', or 'const'. The traditional way is with 'var'."),
          QuizQuestion(
              question: "Which HTML element is used to display an image?",
              options: ["<picture>", "<image>", "<img>", "<src>"],
              correctIndex: 2,
              explanation:
                  "The <img> tag is used to embed an image in an HTML page. It requires the 'src' attribute to specify the source of the image."),
          QuizQuestion(
              question: "What should be the first tag in any HTML document?",
              options: ["<head>", "<title>", "<!DOCTYPE html>", "<html>"],
              correctIndex: 2,
              explanation:
                  "The <!DOCTYPE html> declaration should be the first thing in an HTML document. It tells the browser what document type to expect."),
          QuizQuestion(
              question:
                  "Which CSS property is used to control the space between elements?",
              options: ["spacing", "margin", "padding", "border"],
              correctIndex: 1,
              explanation:
                  "The 'margin' property in CSS is used to create space around elements, outside of any defined borders."),
          QuizQuestion(
              question: "What does the <footer> element define in HTML5?",
              options: [
                "The header of a document",
                "The main content of a document",
                "The footer section of a document or section",
                "A navigation menu"
              ],
              correctIndex: 2,
              explanation:
                  "The <footer> element in HTML5 defines a footer section for a document or a section, typically containing authorship information, copyright, contact info, etc."),
          QuizQuestion(
              question: "How do you add a comment in HTML?",
              options: [
                "// This is a comment",
                "/* This is a comment */",
                "<!-- This is a comment -->",
                "# This is a comment"
              ],
              correctIndex: 2,
              explanation:
                  "In HTML, comments start with <!-- and end with -->. Comments are not displayed in the browser."),
          QuizQuestion(
              question:
                  "What is the purpose of the localStorage object in JavaScript?",
              options: [
                "To store data temporarily for one session",
                "To store data with no expiration date",
                "To store data on a server",
                "To create local variables in functions"
              ],
              correctIndex: 1,
              explanation:
                  "The localStorage object in JavaScript allows you to store data with no expiration date. The data will not be deleted when the browser is closed and will be available the next day, week, or year."),
          QuizQuestion(
              question:
                  "Which of the following is not a valid CSS length unit?",
              options: ["px", "pt", "dm", "em"],
              correctIndex: 2,
              explanation:
                  "dm is not a valid CSS length unit. Valid length units include px (pixels), pt (points), em (relative to font size), rem, vh, vw, etc."),
        ];
      case QuizLevel.intermediate:
        return [
          QuizQuestion(
              question:
                  "What is the output of the following JavaScript code?\n\nconsole.log(typeof(null));",
              options: ["null", "undefined", "object", "string"],
              correctIndex: 2,
              explanation:
                  "In JavaScript, typeof(null) returns 'object'. This is actually considered a bug in JavaScript, as null is technically not an object."),
          QuizQuestion(
              question:
                  "Which CSS property would you use to create a flexible box layout?",
              options: [
                "display: block;",
                "display: flex;",
                "display: grid;",
                "display: inline-flex;"
              ],
              correctIndex: 1,
              explanation:
                  "The 'display: flex;' property creates a flexible box layout, often called Flexbox, which provides a more efficient way to lay out, align and distribute space among items in a container."),
          QuizQuestion(
              question:
                  "What does the 'async' attribute do in the following HTML? \n<script async src='script.js'></script>",
              options: [
                "Loads the script asynchronously",
                "Ensures the script is executed in the background",
                "Prevents the script from being executed",
                "Makes the script load faster"
              ],
              correctIndex: 0,
              explanation:
                  "The 'async' attribute in a script tag means the script will be executed asynchronously as soon as it's available, without blocking the HTML parsing."),
          QuizQuestion(
              question:
                  "What is the purpose of the following JavaScript code?\n\nfunction debounce(func, wait) {\n  let timeout;\n  return function() {\n    clearTimeout(timeout);\n    timeout = setTimeout(() => func.apply(this, arguments), wait);\n  };\n}",
              options: [
                "To repeat a function call at fixed intervals",
                "To delay function execution until after a certain amount of time has passed since the last invocation",
                "To prevent a function from being called more than once",
                "To ensure a function executes instantly"
              ],
              correctIndex: 1,
              explanation:
                  "This is a debounce function that limits how often a function can be called by delaying execution until after a specified amount of time has passed since the last time it was invoked. It's commonly used for performance optimization in event handlers."),
          QuizQuestion(
              question: "What is the CSS 'z-index' property used for?",
              options: [
                "To set the width of an element",
                "To position elements side by side",
                "To specify the stack order of an element",
                "To create a zoom effect when hovering"
              ],
              correctIndex: 2,
              explanation:
                  "The 'z-index' property specifies the stack order of an element (which element should be placed in front of, or behind, the others). It only works on positioned elements (position: absolute, position: relative, position: fixed, or position: sticky)."),
          QuizQuestion(
              question:
                  "In JavaScript, what is the difference between '==' and '==='?",
              options: [
                "No difference, they are interchangeable",
                "'==' compares values only, '===' compares both values and types",
                "'===' compares values only, '==' compares both values and types",
                "Neither compares types, only the number of values being compared"
              ],
              correctIndex: 1,
              explanation:
                  "In JavaScript, '==' is the equality operator that compares values after converting them to a common type, while '===' is the strict equality operator that compares both values and types without performing type conversions."),
          QuizQuestion(
              question:
                  "What does the following CSS selector target? \n.container > p",
              options: [
                "All p elements inside an element with class 'container'",
                "Only p elements that are direct children of an element with class 'container'",
                "Only the first p element inside an element with class 'container'",
                "Elements with both 'container' and 'p' classes"
              ],
              correctIndex: 1,
              explanation:
                  "The '>' selector in CSS is called the child combinator. It selects only those elements matched by the second selector that are direct children of elements matched by the first selector."),
          QuizQuestion(
              question:
                  "What is the purpose of the following HTML5 code? \n<picture>\n  <source media='(min-width: 650px)' srcset='img_large.jpg'>\n  <source media='(min-width: 465px)' srcset='img_medium.jpg'>\n  <img src='img_small.jpg' alt='Image'>\n</picture>",
              options: [
                "To create a slideshow of images",
                "To display multiple images at once",
                "To use different images based on screen width (responsive images)",
                "To create an image map with clickable areas"
              ],
              correctIndex: 2,
              explanation:
                  "The <picture> element in HTML5 allows for responsive images by defining multiple sources for an image and letting the browser choose the most appropriate one based on the viewport size or other factors."),
          QuizQuestion(
              question:
                  "What will be logged to the console with this JavaScript code?\n\nlet array = [1, 2, 3, 4, 5];\nlet result = array.filter(num => num > 3);\nconsole.log(result);",
              options: ["[4, 5]", "[1, 2, 3]", "[3, 4, 5]", "[true, true]"],
              correctIndex: 0,
              explanation:
                  "The filter() method creates a new array with all elements that pass the test implemented by the provided function. Here, it returns an array with only the elements greater than 3, which are 4 and 5."),
          QuizQuestion(
              question:
                  "What is the main purpose of RESTful APIs in web development?",
              options: [
                "To create responsive designs for mobile devices",
                "To implement server-side rendering",
                "To provide a standardized way for different systems to communicate over HTTP",
                "To enhance security through encryption"
              ],
              correctIndex: 2,
              explanation:
                  "RESTful APIs (Representational State Transfer) provide a standardized architectural style for building web services that allow different systems to communicate with each other over HTTP using standard methods like GET, POST, PUT, and DELETE."),
          QuizQuestion(
              question:
                  "What is the purpose of the 'srcset' attribute in HTML5?",
              options: [
                "To specify multiple CSS style sheets",
                "To provide different image resources for different screen resolutions",
                "To set multiple source files for audio elements",
                "To define fallback sources for video elements"
              ],
              correctIndex: 1,
              explanation:
                  "The 'srcset' attribute in HTML5 allows you to specify different image resources for different screen densities or viewport sizes, enabling responsive images that load appropriate resources based on the user's device capabilities."),
          QuizQuestion(
              question:
                  "What does the following JavaScript code do?\n\nconst promise = new Promise((resolve, reject) => {\n  setTimeout(() => resolve('Success!'), 1000);\n});",
              options: [
                "Creates a timer that runs for 1 second",
                "Returns 'Success!' immediately",
                "Creates a Promise that resolves with 'Success!' after 1 second",
                "Creates an error handler"
              ],
              correctIndex: 2,
              explanation:
                  "This code creates a Promise that waits for 1 second (1000 milliseconds) and then resolves with the value 'Success!'. Promises are used for handling asynchronous operations in JavaScript."),
          QuizQuestion(
              question:
                  "What is the purpose of CSS preprocessors like SASS or LESS?",
              options: [
                "To convert CSS to JavaScript",
                "To optimize CSS loading speeds",
                "To add features not available in standard CSS like variables, nesting, and mixins",
                "To provide cross-browser compatibility"
              ],
              correctIndex: 2,
              explanation:
                  "CSS preprocessors like SASS and LESS extend CSS by adding features that aren't available in standard CSS, such as variables, nesting, mixins, inheritance, and other programming capabilities that make CSS more maintainable and easier to work with."),
          QuizQuestion(
              question:
                  "What does CORS stand for and what purpose does it serve?",
              options: [
                "Cross-Origin Resource Sharing - It restricts resources on a web page to be requested from another domain",
                "Create Origin Resource System - It helps optimize website loading speed",
                "Cross-Origin Rendering System - It manages how websites are rendered across devices",
                "Create Object Resource Structure - It defines how objects are created in JavaScript"
              ],
              correctIndex: 0,
              explanation:
                  "CORS stands for Cross-Origin Resource Sharing. It's a security feature implemented by browsers that restricts web pages from making requests to a different domain than the one that served the original web page, unless the domain explicitly allows it."),
          QuizQuestion(
              question:
                  "What is the Web Storage API used for in modern web development?",
              options: [
                "For storing large files on the server",
                "For client-side storage of data in key/value pairs without expiration date",
                "For connecting to databases like MongoDB",
                "For optimizing image storage on websites"
              ],
              correctIndex: 1,
              explanation:
                  "The Web Storage API provides mechanisms (localStorage and sessionStorage) for websites to store key/value pairs in a user's browser. This data persists even when the page is refreshed (localStorage) or until the browser tab is closed (sessionStorage)."),
          QuizQuestion(
              question:
                  "What is the purpose of a Service Worker in modern web applications?",
              options: [
                "To handle user authentication",
                "To manage database connections",
                "To act as a proxy between web apps and the network, enabling offline functionality",
                "To optimize server response times"
              ],
              correctIndex: 2,
              explanation:
                  "Service Workers act as a programmable network proxy between web applications and the network, allowing developers to control how network requests are handled. They enable features like offline functionality, background sync, and push notifications in Progressive Web Apps."),
          QuizQuestion(
              question:
                  "What will be the output of this JavaScript code?\n\nlet x = 0;\nconsole.log(x++ === ++x);",
              options: ["true", "false", "undefined", "NaN"],
              correctIndex: 1,
              explanation:
                  "This will output 'false'. The expression is evaluated from left to right. First, x++ returns 0 (the original value) and then increments x to 1. Then ++x increments x to 2 and returns 2. So the comparison becomes (0 === 2), which is false."),
          QuizQuestion(
              question:
                  "Which method would you use to perform DOM manipulation without jQuery?",
              options: [
                "document.getElement('id')",
                "document.getElementById('id')",
                "document.querySelector('id')",
                "document.manipulate('id')"
              ],
              correctIndex: 1,
              explanation:
                  "To manipulate the DOM without jQuery, you can use native JavaScript methods like document.getElementById(), document.querySelector(), document.querySelectorAll(), or other DOM API methods."),
          QuizQuestion(
              question:
                  "What is the purpose of the 'box-sizing' property in CSS?",
              options: [
                "To change the color of boxes",
                "To control how the total width and height of an element is calculated",
                "To define how elements are positioned",
                "To create animated boxes"
              ],
              correctIndex: 1,
              explanation:
                  "The 'box-sizing' property in CSS controls how the total width and height of an element is calculated. When set to 'border-box', padding and border are included in the element's width and height calculations, making layouts more predictable."),
          QuizQuestion(
              question:
                  "What is the significance of the 'event loop' in JavaScript?",
              options: [
                "It manages DOM events only",
                "It's responsible for executing JavaScript code, collecting and processing events, and executing queued sub-tasks",
                "It's a deprecated feature in modern JavaScript",
                "It controls the looping constructs like for and while"
              ],
              correctIndex: 1,
              explanation:
                  "The event loop is a fundamental part of JavaScript's concurrency model. It's responsible for executing code, collecting and processing events, and executing queued asynchronous tasks. Understanding the event loop is crucial for writing efficient non-blocking JavaScript code."),
          QuizQuestion(
              question:
                  "What does the following HTML5 attribute do? \n<input type='text' required>",
              options: [
                "Makes the input field read-only",
                "Makes the input field mandatory to fill before form submission",
                "Restricts the input to text only",
                "Automatically focuses the input field when the page loads"
              ],
              correctIndex: 1,
              explanation:
                  "The 'required' attribute in HTML5 form elements makes the input field mandatory. The form cannot be submitted if a required field is empty, providing built-in form validation."),
          QuizQuestion(
              question:
                  "What is the purpose of a WebSocket in web development?",
              options: [
                "To create socket connections to databases",
                "To establish a persistent, two-way communication channel between client and server",
                "To optimize web server performance",
                "To enhance CSS styling capabilities"
              ],
              correctIndex: 1,
              explanation:
                  "WebSockets provide a persistent connection between a client and server, allowing for real-time, two-way communication. Unlike HTTP, once a WebSocket connection is established, both the client and server can send messages at any time without initiating a new connection each time."),
          QuizQuestion(
              question:
                  "What is the main advantage of using a transpiler like Babel in JavaScript development?",
              options: [
                "It makes JavaScript code run faster",
                "It adds security features to JavaScript",
                "It allows developers to use newer JavaScript features while maintaining compatibility with older browsers",
                "It reduces the size of JavaScript files"
              ],
              correctIndex: 2,
              explanation:
                  "Babel is a JavaScript transpiler that converts code written in newer versions of JavaScript (ES6+) into older versions that can run in environments that don't support the newer features, allowing developers to use modern JavaScript while maintaining backwards compatibility."),
          QuizQuestion(
              question:
                  "What is the purpose of JSON Web Tokens (JWT) in web development?",
              options: [
                "To encrypt all website traffic",
                "To securely transmit information between parties as a JSON object",
                "To optimize JSON data structures",
                "To convert between different JSON formats"
              ],
              correctIndex: 1,
              explanation:
                  "JSON Web Tokens (JWT) are used to securely transmit information between parties as a JSON object. They are commonly used for authentication and authorization purposes in web applications, allowing servers to verify the identity of clients making requests."),
          QuizQuestion(
              question: "What does the 'position: sticky' CSS property do?",
              options: [
                "Makes an element always stick to the center of the screen",
                "Positions an element based on the user's scroll position, toggling between relative and fixed",
                "Applies a sticky texture to the background of an element",
                "Makes elements stick together when they overlap"
              ],
              correctIndex: 1,
              explanation:
                  "The 'position: sticky' CSS property makes an element positioned based on the user's scroll position. It behaves like 'position: relative' until a given offset position is met in the viewport, then it behaves like 'position: fixed'."),
        ];
      case QuizLevel.advanced:
        return [
          // QuizQuestion(
          //     question: "What does CSS stand for?",
          //     options: [
          //       "Computer Style Sheets",
          //       "Creative Style System",
          //       "Cascading Style Sheets",
          //       "Custom Style Sheets"
          //     ],
          //     correctIndex: 2,
          //     explanation:
          //         "CSS stands for Cascading Style Sheets, which is a style sheet language used for describing the presentation of a document written in HTML."),
          // QuizQuestion(
          //     question: "Which of the following is a JavaScript framework?",
          //     options: ["Django", "Flask", "Ruby on Rails", "Vue.js"],
          //     correctIndex: 3,
          //     explanation:
          //         "Vue.js is a JavaScript framework for building user interfaces. Django, Flask, and Ruby on Rails are web frameworks for Python and Ruby."),
          // QuizQuestion(
          //     question: "What is the purpose of the HTML <canvas> element?",
          //     options: [
          //       "To display database tables",
          //       "To create graphics dynamically via scripting",
          //       "To create form inputs",
          //       "To embed external content"
          //     ],
          //     correctIndex: 1,
          //     explanation:
          //         "The HTML <canvas> element is used to draw graphics, animations, or other visual images on the web page via scripting (usually JavaScript)."),
          // QuizQuestion(
          //     question: "Which HTTP status code indicates a successful response?",
          //     options: ["200", "404", "500", "302"],
          //     correctIndex: 0,
          //     explanation:
          //         "HTTP status code 200 (OK) indicates that the request has succeeded. 404 means Not Found, 500 means Internal Server Error, and 302 means Found (temporary redirect)."),
          // QuizQuestion(
          //     question: "What is CORS in web development?",
          //     options: [
          //       "A programming language",
          //       "A security feature that restricts web page requests to other domains",
          //       "A design pattern for CSS",
          //       "A type of web server"
          //     ],
          //     correctIndex: 1,
          //     explanation:
          //         "CORS (Cross-Origin Resource Sharing) is a security mechanism that allows or restricts web page requests to resources from a different domain than the one from which the request originated.")
          QuizQuestion(
              question: "Which HTML tag is used to create a hyperlink?",
              options: ["<link>", "<a>", "<href>", "<hyperlink>"],
              correctIndex: 1,
              explanation:
                  "The <a> (anchor) tag is used to create hyperlinks in HTML, typically with the href attribute specifying the URL."),

          QuizQuestion(
              question:
                  "What is the purpose of JavaScript's 'localStorage' object?",
              options: [
                "To store session cookies",
                "To store data with no expiration date in the browser",
                "To communicate with a local database",
                "To cache JavaScript files locally"
              ],
              correctIndex: 1,
              explanation:
                  "localStorage allows you to store data with no expiration date in the browser. The data will persist even after the browser window is closed."),

          QuizQuestion(
              question: "What does the 'DOCTYPE' declaration in HTML do?",
              options: [
                "Defines the document type and version of HTML",
                "Links to external style sheets",
                "Declares the document's author",
                "Sets the default language for the document"
              ],
              correctIndex: 0,
              explanation:
                  "The DOCTYPE declaration specifies the document type and version of HTML the page is using, which helps browsers render the page correctly."),

          QuizQuestion(
              question:
                  "Which CSS property is used to control the space between elements?",
              options: ["spacing", "margin", "padding", "gap"],
              correctIndex: 1,
              explanation:
                  "The margin property in CSS is used to create space around elements, outside of any defined borders."),

          QuizQuestion(
              question: "What is a REST API?",
              options: [
                "A programming language for web development",
                "A type of database specifically for websites",
                "An architectural style for designing networked applications",
                "A security protocol for web servers"
              ],
              correctIndex: 2,
              explanation:
                  "REST (Representational State Transfer) is an architectural style for designing networked applications that use HTTP requests to access and manipulate data."),

          QuizQuestion(
              question: "Which of the following is a JavaScript framework?",
              options: ["Django", "Flask", "Ruby on Rails", "Vue.js"],
              correctIndex: 3,
              explanation:
                  "Vue.js is a progressive JavaScript framework used for building user interfaces and single-page applications."),

          QuizQuestion(
              question: "What does JSON stand for?",
              options: [
                "JavaScript Object Notation",
                "Java Standard Object Notation",
                "JavaScript Oriented Navigation",
                "Java Source Open Network"
              ],
              correctIndex: 0,
              explanation:
                  "JSON stands for JavaScript Object Notation, which is a lightweight data-interchange format that is easy for humans to read and write and easy for machines to parse and generate."),

          QuizQuestion(
              question:
                  "Which HTML element is used to define a table header cell?",
              options: ["<td>", "<th>", "<header>", "<thead>"],
              correctIndex: 1,
              explanation:
                  "The <th> element is used to define a header cell in an HTML table. The content inside is typically bold and centered."),

          QuizQuestion(
              question: "What is the purpose of media queries in CSS?",
              options: [
                "To query a database for multimedia files",
                "To integrate social media content",
                "To apply different styles for different devices/screen sizes",
                "To optimize media files for faster loading"
              ],
              correctIndex: 2,
              explanation:
                  "Media queries in CSS allow you to apply different styles based on device characteristics like screen width, height, and resolution, making websites responsive."),

          QuizQuestion(
              question:
                  "Which HTTP status code indicates a successful request?",
              options: ["200", "404", "500", "302"],
              correctIndex: 0,
              explanation:
                  "HTTP status code 200 (OK) indicates that the request has succeeded and the server has returned the requested content."),

          QuizQuestion(
              question: "What is the purpose of npm in web development?",
              options: [
                "Network Protocol Manager",
                "Node Package Manager",
                "New Project Module",
                "Node Programming Method"
              ],
              correctIndex: 1,
              explanation:
                  "npm (Node Package Manager) is the default package manager for Node.js, used for installing, sharing, and managing dependencies in JavaScript projects."),

          QuizQuestion(
              question:
                  "Which CSS property changes the text color of an element?",
              options: ["font-color", "text-color", "color", "text-style"],
              correctIndex: 2,
              explanation:
                  "The CSS 'color' property sets the color of text content and text decorations."),

          QuizQuestion(
              question:
                  "What is the purpose of the 'alt' attribute in HTML image tags?",
              options: [
                "To provide alternative text if the image cannot be displayed",
                "To specify an alternative image URL",
                "To add a caption to the image",
                "To control image alignment"
              ],
              correctIndex: 0,
              explanation:
                  "The 'alt' attribute provides alternative text for an image if it cannot be displayed, and helps with accessibility for screen readers."),

          QuizQuestion(
              question:
                  "Which JavaScript method is used to remove the last element from an array?",
              options: ["pop()", "push()", "shift()", "unshift()"],
              correctIndex: 0,
              explanation:
                  "The pop() method removes the last element from an array and returns that element. This method changes the length of the array."),

          QuizQuestion(
              question: "What is the box model in CSS?",
              options: [
                "A 3D modeling system for web graphics",
                "A layout system for organizing page elements into boxes",
                "A concept that describes how elements are sized with content, padding, border, and margin",
                "A tool for creating dialog boxes in web pages"
              ],
              correctIndex: 2,
              explanation:
                  "The CSS box model describes how elements are rendered as rectangular boxes with content, padding, border, and margin areas."),

          QuizQuestion(
              question: "Which HTML5 element is used to play video files?",
              options: ["<media>", "<video>", "<player>", "<movie>"],
              correctIndex: 1,
              explanation:
                  "The <video> element is used to embed video content in an HTML document."),

          QuizQuestion(
              question: "What is a callback function in JavaScript?",
              options: [
                "A function that returns multiple values",
                "A function that executes when a user clicks a button",
                "A function passed as an argument to another function to be executed later",
                "A function that calls the server for data"
              ],
              correctIndex: 2,
              explanation:
                  "A callback function is a function passed as an argument to another function, which is then invoked inside the outer function to complete an action."),

          QuizQuestion(
              question:
                  "Which property is used to change the font of an element in CSS?",
              options: ["font-style", "font-family", "text-font", "font-type"],
              correctIndex: 1,
              explanation:
                  "The font-family property in CSS specifies the font for an element, providing a prioritized list of font family names."),

          QuizQuestion(
              question: "What is AJAX in web development?",
              options: [
                "A programming language",
                "A web security protocol",
                "A technique for creating interactive web applications",
                "A database management system"
              ],
              correctIndex: 2,
              explanation:
                  "AJAX (Asynchronous JavaScript and XML) is a technique that allows web pages to be updated asynchronously by exchanging data with a server behind the scenes."),

          QuizQuestion(
              question:
                  "Which CSS positioning property places an element relative to the viewport?",
              options: ["relative", "absolute", "fixed", "static"],
              correctIndex: 2,
              explanation:
                  "The 'fixed' positioning property places an element relative to the viewport, so it always stays in the same place even if the page is scrolled."),

          QuizQuestion(
              question:
                  "What is the purpose of the 'defer' attribute in a script tag?",
              options: [
                "To prevent the script from loading",
                "To delay script execution until after the page has loaded",
                "To download the script at a lower priority",
                "To mark the script as optional"
              ],
              correctIndex: 1,
              explanation:
                  "The 'defer' attribute indicates that the script should be executed after the document has been parsed, but before the DOMContentLoaded event."),

          QuizQuestion(
              question: "Which of the following is NOT a valid CSS selector?",
              options: [".classname", "#idname", "*element", "[attribute]"],
              correctIndex: 2,
              explanation:
                  "There is no '*element' selector in CSS. The correct selectors are: '.classname' for classes, '#idname' for IDs, and '[attribute]' for attributes."),

          QuizQuestion(
              question: "What does the 'z-index' property in CSS control?",
              options: [
                "The horizontal position of an element",
                "The vertical position of an element",
                "The stacking order of elements",
                "The transparency of an element"
              ],
              correctIndex: 2,
              explanation:
                  "The z-index property specifies the stack order of an element (which element should be placed in front of, or behind, the others)."),

          QuizQuestion(
              question:
                  "Which HTML element is used to define navigation links?",
              options: ["<navigation>", "<links>", "<nav>", "<menu>"],
              correctIndex: 2,
              explanation:
                  "The <nav> element is used to define a set of navigation links in HTML5."),

          QuizQuestion(
              question:
                  "What is webpack primarily used for in web development?",
              options: [
                "Server-side rendering",
                "Module bundling and asset management",
                "Database operations",
                "API development"
              ],
              correctIndex: 1,
              explanation:
                  "Webpack is a static module bundler for JavaScript applications that processes and bundles various assets like JavaScript, CSS, and images."),

          QuizQuestion(
              question:
                  "What is the purpose of the 'async' keyword in JavaScript?",
              options: [
                "To declare a variable as asynchronous",
                "To mark a function that returns a Promise",
                "To prevent a function from being called",
                "To run code in parallel with other code"
              ],
              correctIndex: 1,
              explanation:
                  "The 'async' keyword is used to declare an asynchronous function that implicitly returns a Promise and allows the use of the 'await' keyword."),

          QuizQuestion(
              question:
                  "Which CSS property is used to add shadows to elements?",
              options: [
                "element-shadow",
                "shadow-effect",
                "box-shadow",
                "drop-shadow"
              ],
              correctIndex: 2,
              explanation:
                  "The 'box-shadow' property adds shadow effects around an element's frame."),

          QuizQuestion(
              question: "What is Cross-Origin Resource Sharing (CORS)?",
              options: [
                "A technique for sharing resources between different websites",
                "A security feature that restricts web page requests to other domains",
                "A protocol for cross-browser compatibility",
                "A method for loading resources faster"
              ],
              correctIndex: 1,
              explanation:
                  "CORS is a security mechanism that allows or restricts web page requests to resources from a different origin (domain) than the page itself."),
        ];
    }
  }

  // Cloud Computing questions based on level
  static List<QuizQuestion> _getCloudQuestions(QuizLevel level) {
    switch (level) {
      case QuizLevel.beginner:
        return [
          QuizQuestion(
              question: "What is cloud computing?",
              options: [
                "A network of physical servers in a single location",
                "Computing resources delivered over the internet on a pay-as-you-go basis",
                "A type of weather forecasting technology",
                "A method of storing data exclusively on local drives"
              ],
              correctIndex: 1,
              explanation:
                  "Cloud computing delivers computing services—including servers, storage, databases, networking, software, and analytics—over the internet ('the cloud') on a pay-as-you-go basis, allowing businesses to consume resources as a utility rather than building and maintaining physical infrastructure."),
          QuizQuestion(
              question:
                  "Which of the following is NOT a major cloud service model?",
              options: [
                "Infrastructure as a Service (IaaS)",
                "Platform as a Service (PaaS)",
                "Software as a Service (SaaS)",
                "Maintenance as a Service (MaaS)"
              ],
              correctIndex: 3,
              explanation:
                  "The three standard cloud service models are IaaS (providing virtualized computing resources), PaaS (providing platforms for developing, running, and managing applications), and SaaS (providing software applications over the internet). 'Maintenance as a Service' is not a standard cloud service model."),
          QuizQuestion(
              question:
                  "Which of these is a primary benefit of cloud computing?",
              options: [
                "Increased IT maintenance requirements",
                "Higher upfront infrastructure costs",
                "Reduced scalability options",
                "Pay-as-you-go pricing model"
              ],
              correctIndex: 3,
              explanation:
                  "A primary benefit of cloud computing is the pay-as-you-go pricing model, which allows organizations to pay only for the resources they actually use, avoiding large upfront capital expenditures for hardware and reducing waste from overprovisioning."),
          QuizQuestion(
              question: "What does the term 'cloud elasticity' refer to?",
              options: [
                "The physical flexibility of data center equipment",
                "The ability to stretch your budget for cloud services",
                "The ability to quickly scale resources up or down based on demand",
                "The stretchable nature of cloud storage"
              ],
              correctIndex: 2,
              explanation:
                  "Cloud elasticity refers to the ability to quickly scale computing resources up or down as demand changes. This allows organizations to match resource allocation with actual needs in near real-time, improving efficiency and cost-effectiveness."),
          QuizQuestion(
              question: "Which of the following is a public cloud provider?",
              options: [
                "Microsoft Excel",
                "Adobe Photoshop",
                "Amazon Web Services (AWS)",
                "Local Data Center"
              ],
              correctIndex: 2,
              explanation:
                  "Amazon Web Services (AWS) is one of the largest public cloud providers, offering a wide range of cloud computing services that are accessible to the general public over the internet. Other major public cloud providers include Microsoft Azure, Google Cloud Platform, and IBM Cloud."),
          QuizQuestion(
              question: "What is a private cloud?",
              options: [
                "Cloud services used only by CEOs and executives",
                "Cloud infrastructure dedicated to a single organization",
                "Personal cloud storage for individual users",
                "Cloud services only accessible through private networks"
              ],
              correctIndex: 1,
              explanation:
                  "A private cloud is cloud infrastructure provisioned for exclusive use by a single organization. It can be owned, managed, and operated by the organization, a third party, or a combination, and may exist on or off premises. It provides many of the benefits of public clouds but with greater control and customization."),
          QuizQuestion(
              question: "What is a hybrid cloud?",
              options: [
                "A cloud that uses both Windows and Linux operating systems",
                "A combination of public and private cloud environments",
                "A cloud that serves both businesses and individuals",
                "A cloud that offers both storage and processing capabilities"
              ],
              correctIndex: 1,
              explanation:
                  "A hybrid cloud is a computing environment that combines a public cloud and a private cloud by allowing data and applications to be shared between them. It provides businesses with greater flexibility by moving workloads between cloud solutions as needs and costs change."),
          QuizQuestion(
              question: "What is multi-cloud?",
              options: [
                "Using multiple user accounts on a single cloud provider",
                "Using cloud services in multiple geographic regions",
                "Using cloud services from multiple providers",
                "Creating multiple backups in the cloud"
              ],
              correctIndex: 2,
              explanation:
                  "Multi-cloud refers to the use of cloud computing services from multiple cloud providers for different tasks. Organizations might choose a multi-cloud strategy to avoid vendor lock-in, leverage best-of-breed services, or improve redundancy and disaster recovery capabilities."),
          QuizQuestion(
              question:
                  "Which statement best describes Infrastructure as a Service (IaaS)?",
              options: [
                "Providing complete software applications over the internet",
                "Providing development tools and execution environments for creating cloud applications",
                "Providing virtualized computing resources like virtual machines, storage, and networks",
                "Providing database administration services over the cloud"
              ],
              correctIndex: 2,
              explanation:
                  "Infrastructure as a Service (IaaS) provides virtualized computing resources over the internet. IaaS providers offer virtual machines, storage, networks, and other fundamental computing resources that customers can provision and manage, without having to invest in physical hardware."),
          QuizQuestion(
              question:
                  "Which statement best describes Platform as a Service (PaaS)?",
              options: [
                "Providing virtualized computing infrastructure",
                "Providing a platform with tools and environments for building and deploying applications",
                "Providing complete software applications over the internet",
                "Providing hardware maintenance services remotely"
              ],
              correctIndex: 1,
              explanation:
                  "Platform as a Service (PaaS) provides a platform with tools, programming languages, and environments for building, deploying, and managing applications. PaaS removes the need for organizations to manage the underlying infrastructure while giving them control over the deployed applications and configuration settings."),
          QuizQuestion(
              question:
                  "Which statement best describes Software as a Service (SaaS)?",
              options: [
                "Providing complete software applications delivered over the internet",
                "Providing custom software development services",
                "Providing virtualized computing resources",
                "Providing platforms for building custom applications"
              ],
              correctIndex: 0,
              explanation:
                  "Software as a Service (SaaS) provides complete application software that is owned, delivered, and managed remotely by one or more providers and made available to customers over the internet, typically on a subscription basis. Users can access these applications through a web browser without needing to install or maintain the software."),
          QuizQuestion(
              question:
                  "What is the main advantage of a consumption-based pricing model in cloud computing?",
              options: [
                "It always results in lower overall costs than traditional IT",
                "It allows users to pay only for the resources they actually use",
                "It provides guaranteed fixed monthly costs",
                "It eliminates the need for budgeting for IT resources"
              ],
              correctIndex: 1,
              explanation:
                  "The main advantage of consumption-based pricing in cloud computing is that users only pay for the specific resources they consume, rather than investing in potentially underutilized infrastructure. This converts capital expenses to operational expenses and helps match costs directly to usage patterns."),
          QuizQuestion(
              question: "What is a cloud region?",
              options: [
                "A geographical area with one or more data centers that are connected and centrally managed",
                "Any country that allows cloud computing services",
                "The physical space occupied by cloud servers in a data center",
                "A virtual space allocated to a specific cloud customer"
              ],
              correctIndex: 0,
              explanation:
                  "A cloud region is a geographic area or location where a cloud provider has built a cluster of data centers. Each region typically contains multiple availability zones and operates independently of other regions, allowing customers to deploy resources close to their users for better performance and to meet data residency requirements."),
          QuizQuestion(
              question: "What is cloud storage?",
              options: [
                "A physical storage device kept in a humidity-controlled environment",
                "A service that provides storage resources over the internet",
                "A backup system that only works when it's raining",
                "Storage that's only available to large enterprises"
              ],
              correctIndex: 1,
              explanation:
                  "Cloud storage is a service where data is maintained, managed, and backed up remotely and made available to users over the internet. It allows users to store files on remote servers accessed from the internet, rather than storing data locally on a physical device."),
          QuizQuestion(
              question:
                  "What does the term 'availability zone' refer to in cloud computing?",
              options: [
                "The geographic regions where cloud services are available",
                "The amount of time cloud services are guaranteed to be operational",
                "A discrete data center with independent power, cooling, and networking in a cloud region",
                "Areas where cloud services are provided at discounted rates"
              ],
              correctIndex: 2,
              explanation:
                  "An availability zone is a discrete data center with independent power, cooling, and networking within a cloud region. Cloud providers design availability zones to be isolated from failures in other zones, enabling customers to build highly available applications by distributing resources across multiple zones."),
          QuizQuestion(
              question: "What is a Virtual Machine (VM) in cloud computing?",
              options: [
                "A physical computer that runs cloud software",
                "A software emulation of a physical computer that can run an operating system and applications",
                "A specialized hardware device for cloud networking",
                "An alternative name for a cloud account"
              ],
              correctIndex: 1,
              explanation:
                  "A Virtual Machine (VM) is a software emulation of a physical computer that can run an operating system and applications. In cloud computing, VMs are created on physical servers in the cloud provider's data centers and allow multiple operating systems to run simultaneously on a single physical machine, improving resource utilization."),
          QuizQuestion(
              question: "What is auto-scaling in cloud computing?",
              options: [
                "Automatic adjustment of resource pricing based on demand",
                "The automatic resizing of images stored in the cloud",
                "Automatic adjustment of resources based on workload demands",
                "The process of automatically moving data between storage tiers"
              ],
              correctIndex: 2,
              explanation:
                  "Auto-scaling is a cloud computing feature that automatically adjusts the number of computational resources (like virtual machines or containers) based on current workload demands. It ensures applications have the resources they need during peak times while minimizing costs during periods of lower demand."),
          QuizQuestion(
              question: "What does serverless computing mean?",
              options: [
                "Computing without any servers involved",
                "A computing model where servers are managed by the cloud provider, not the customer",
                "Running applications on local machines instead of remote servers",
                "Computing services that are free of charge"
              ],
              correctIndex: 1,
              explanation:
                  "Serverless computing is a cloud computing model where the cloud provider manages the infrastructure (servers) entirely. Developers focus solely on writing code (functions) that are triggered by events, and they pay only for the exact amount of resources used by their code. Servers still exist, but their provisioning and maintenance are abstracted away from the user."),
          QuizQuestion(
              question:
                  "What is a Content Delivery Network (CDN) in cloud computing?",
              options: [
                "A network exclusively for delivering streaming content",
                "A globally distributed network of servers that speeds up web content delivery",
                "A private network used only by content creators",
                "A special internet connection required for cloud computing"
              ],
              correctIndex: 1,
              explanation:
                  "A Content Delivery Network (CDN) is a globally distributed network of servers that speeds up the delivery of web content by serving content from locations closer to the user. CDNs store cached copies of content (like images, videos, and web pages) to reduce latency, decrease server load, and improve user experience."),
          QuizQuestion(
              question: "What is cloud orchestration?",
              options: [
                "Playing music through cloud-based audio services",
                "Automated arrangement, coordination, and management of complex cloud systems",
                "Directing traffic between different cloud providers",
                "The process of migrating from on-premises to cloud environments"
              ],
              correctIndex: 1,
              explanation:
                  "Cloud orchestration refers to the automated arrangement, coordination, and management of complex cloud systems, services, and middleware. It involves automating the workflow for provisioning resources, deploying applications, and managing how different cloud components interact."),
          QuizQuestion(
              question:
                  "Which of the following is NOT typically considered a benefit of cloud computing?",
              options: [
                "Reduced need for physical infrastructure",
                "Greater physical control over hardware",
                "Improved disaster recovery capabilities",
                "Ability to scale resources quickly"
              ],
              correctIndex: 1,
              explanation:
                  "Greater physical control over hardware is not typically considered a benefit of cloud computing. In fact, the opposite is true—cloud computing means relinquishing physical control of infrastructure to the cloud provider. The benefits include reduced need for physical infrastructure, improved disaster recovery, and scalability."),
          QuizQuestion(
              question: "What is a cloud service provider (CSP)?",
              options: [
                "A meteorologist who specializes in cloud formations",
                "A company that offers cloud computing services over the internet",
                "A device that connects local networks to the cloud",
                "Software that monitors cloud performance"
              ],
              correctIndex: 1,
              explanation:
                  "A cloud service provider (CSP) is a company that offers cloud computing services—including infrastructure, platforms, storage, and software—delivered over the internet. Examples include Amazon Web Services (AWS), Microsoft Azure, Google Cloud Platform, and IBM Cloud."),
          QuizQuestion(
              question: "What is cloud migration?",
              options: [
                "The seasonal movement of cloud data centers to cooler climates",
                "The process of moving digital assets from local systems to cloud environments",
                "The automatic transfer of data between different cloud regions",
                "When a cloud provider moves your data to a different data center without notice"
              ],
              correctIndex: 1,
              explanation:
                  "Cloud migration is the process of moving digital assets—such as data, applications, IT resources, or services—from on-premises infrastructure or legacy environments to cloud-based infrastructure. It can also refer to moving between different cloud environments."),
          QuizQuestion(
              question:
                  "Which of the following describes 'data residency' in cloud computing?",
              options: [
                "How long data is stored before automatic deletion",
                "The physical location where data is stored and processed",
                "The process of transferring data between cloud providers",
                "The portion of data that resides in cache memory"
              ],
              correctIndex: 1,
              explanation:
                  "Data residency refers to the physical or geographic location where an organization's data is stored and processed in the cloud. Many countries have regulations requiring certain types of data to be kept within specific geographic boundaries, making data residency an important compliance consideration for cloud deployments."),
          QuizQuestion(
              question: "What is cloud bursting?",
              options: [
                "When a cloud service experiences a sudden crash",
                "A deployment model where applications run primarily in private cloud but burst into public cloud when demand increases",
                "The release of excess water vapor from cooling systems in data centers",
                "When a cloud account exceeds its storage limit"
              ],
              correctIndex: 1,
              explanation:
                  "Cloud bursting is a deployment model in which an application runs primarily in a private cloud but can 'burst' into a public cloud when computing demand exceeds the private cloud's capacity. This hybrid approach allows organizations to maintain sensitive workloads on-premises while leveraging public cloud resources for handling peak loads."),
        ];
      case QuizLevel.intermediate:
        return [
          QuizQuestion(
              question:
                  "What is the principle behind 'immutable infrastructure' in cloud environments?",
              options: [
                "Infrastructure that cannot be accessed by unauthorized users",
                "Infrastructure that never changes after deployment; modifications require new deployments",
                "Infrastructure that is immune to cyber attacks",
                "Infrastructure with guaranteed 100% uptime"
              ],
              correctIndex: 1,
              explanation:
                  "Immutable infrastructure is a deployment approach where infrastructure components are never modified after deployment. Instead of updating existing resources, they are replaced with new versions containing the desired changes. This approach improves reliability, consistency, and security by reducing configuration drift and simplifying rollbacks."),
          QuizQuestion(
              question: "What is the CAP theorem in distributed cloud systems?",
              options: [
                "A pricing model for cloud capacity",
                "A theorem stating it's impossible for a distributed system to simultaneously provide Consistency, Availability, and Partition tolerance",
                "A security framework for cloud applications",
                "A law governing cloud provider accountability"
              ],
              correctIndex: 1,
              explanation:
                  "The CAP theorem (also called Brewer's theorem) states that a distributed database system can only guarantee two of the following three properties simultaneously: Consistency (all nodes see the same data at the same time), Availability (every request receives a response), and Partition tolerance (the system continues operating despite network partitions). Cloud architects must consider these tradeoffs when designing distributed systems."),
          QuizQuestion(
              question: "What is the purpose of a virtual private cloud (VPC)?",
              options: [
                "To provide free cloud services to non-profit organizations",
                "To isolate cloud resources within a private, secure section of a public cloud",
                "To create a completely offline backup of cloud data",
                "To virtualize on-premises data centers"
              ],
              correctIndex: 1,
              explanation:
                  "A Virtual Private Cloud (VPC) is a private, isolated section of a public cloud that allows users to deploy cloud resources in a logically isolated network they define and control. VPCs combine the scalability and convenience of public cloud services with the isolation and control of private networks, providing enhanced security and customization."),
          QuizQuestion(
              question: "What is 'infrastructure as code' (IaC)?",
              options: [
                "Writing code that runs directly on cloud infrastructure",
                "Managing and provisioning infrastructure through machine-readable definition files rather than manual processes",
                "Encrypting infrastructure components with code-based algorithms",
                "Converting legacy software code to run on modern cloud platforms"
              ],
              correctIndex: 1,
              explanation:
                  "Infrastructure as Code (IaC) is the practice of managing and provisioning computing infrastructure through machine-readable definition files rather than manual configuration or interactive tools. IaC treats infrastructure configuration files as software code that can be versioned, tested, and deployed through CI/CD pipelines, ensuring consistency and enabling automation."),
          QuizQuestion(
              question:
                  "Which of the following best describes 'edge computing' in relation to cloud computing?",
              options: [
                "Computing focused exclusively on advanced graphics processing",
                "Processing data near the edge of the network, closer to where it's generated",
                "A specialized cloud service for competitive advantage",
                "Computing that takes place at the physical edges of data centers"
              ],
              correctIndex: 1,
              explanation:
                  "Edge computing is a distributed computing paradigm that brings computation and data storage closer to the sources of data (the 'edge' of the network) instead of relying on a central cloud. This reduces latency, saves bandwidth, enables real-time processing, and allows applications to function even with intermittent cloud connectivity."),
          QuizQuestion(
              question: "What is the purpose of a cloud load balancer?",
              options: [
                "To balance the billing between different cloud services",
                "To distribute incoming network traffic across multiple servers to ensure no single server is overwhelmed",
                "To balance data storage evenly across storage devices",
                "To manage the physical weight distribution in data centers"
              ],
              correctIndex: 1,
              explanation:
                  "A cloud load balancer distributes incoming network traffic across multiple computing resources (such as virtual machines, containers, or servers) to prevent any single resource from becoming overwhelmed. This improves application responsiveness, availability, and scalability by optimizing resource utilization and providing failover capabilities."),
          QuizQuestion(
              question:
                  "In the context of cloud computing, what is a 'container'?",
              options: [
                "A storage unit for physical hardware in data centers",
                "A standardized unit of software that packages code and all its dependencies",
                "A dedicated connection between two cloud regions",
                "A security boundary around sensitive data"
              ],
              correctIndex: 1,
              explanation:
                  "In cloud computing, a container is a standardized unit of software that packages code and all its dependencies (libraries, frameworks, configuration files) into a single package. Containers ensure that applications run quickly and reliably regardless of the computing environment. They are more lightweight than virtual machines as they share the host system's OS kernel rather than requiring a full OS."),
          QuizQuestion(
              question: "What does Kubernetes do in cloud environments?",
              options: [
                "Provides end-to-end encryption for all cloud data",
                "Orchestrates container deployment, scaling, and management",
                "Converts traditional applications to cloud-native formats",
                "Monitors cloud spending and provides cost optimization recommendations"
              ],
              correctIndex: 1,
              explanation:
                  "Kubernetes is an open-source container orchestration platform that automates the deployment, scaling, and management of containerized applications. It groups containers into logical units for easy management and discovery, provides service discovery, load balancing, storage orchestration, automated rollouts/rollbacks, and self-healing capabilities."),
          QuizQuestion(
              question:
                  "What is a microservices architecture in cloud computing?",
              options: [
                "Using the smallest possible virtual machines to save costs",
                "An approach where an application is built as a collection of small, loosely coupled services",
                "Building extremely small data centers distributed across many locations",
                "A technique for compressing cloud data to minimize storage costs"
              ],
              correctIndex: 1,
              explanation:
                  "Microservices architecture is an approach to software development where an application is built as a collection of small, independent services that communicate over well-defined APIs. Each microservice focuses on a single business function, can be developed and deployed independently, and typically runs in its own process. This architecture improves scalability, resilience, and development agility in cloud environments."),
          QuizQuestion(
              question:
                  "What is a key characteristic of 'cloud-native' applications?",
              options: [
                "They can only run on one specific cloud provider",
                "They are designed specifically to take advantage of cloud computing architectures",
                "They must be written in cloud-specific programming languages",
                "They run exclusively at the edge, not in centralized data centers"
              ],
              correctIndex: 1,
              explanation:
                  "Cloud-native applications are specifically designed to take advantage of cloud computing architectures and services. They typically incorporate practices like microservices, containers, dynamic orchestration, and DevOps processes. Cloud-native applications are resilient, agile, scalable, and designed to thrive in the dynamic, distributed cloud environment."),
          QuizQuestion(
              question:
                  "What is a key purpose of 'blue-green deployment' in cloud environments?",
              options: [
                "To use environmentally friendly power sources in data centers",
                "To minimize downtime and risk during application updates",
                "To separate development environments by color codes",
                "To manage communication between public and private clouds"
              ],
              correctIndex: 1,
              explanation:
                  "Blue-green deployment is a technique for releasing applications with zero downtime and reduced risk. It involves maintaining two identical production environments ('blue' and 'green'). At any time, one environment is live while changes are applied to the non-live environment. Once tested, traffic is switched from the old environment to the new one, allowing for immediate rollback if issues arise."),
          QuizQuestion(
              question:
                  "What is the concept of 'data sovereignty' in cloud computing?",
              options: [
                "The exclusive ownership of data by the cloud provider",
                "The total control of all data by a single administrator",
                "The principle that data is subject to the laws of the country where it is stored",
                "The encryption level needed to protect high-value data"
              ],
              correctIndex: 2,
              explanation:
                  "Data sovereignty refers to the principle that data is subject to the laws and governance structures of the nation where it is physically stored. Organizations must consider data sovereignty when selecting cloud providers and regions to ensure compliance with regulations that may restrict where certain types of data can be stored or processed."),
          QuizQuestion(
              question:
                  "What is the function of a 'hypervisor' in cloud computing?",
              options: [
                "To provide extremely fast internet connections",
                "Software that creates and manages virtual machines",
                "A supervisor who manages human resources in cloud companies",
                "A device that connects multiple cloud networks"
              ],
              correctIndex: 1,
              explanation:
                  "A hypervisor (also known as a Virtual Machine Monitor) is software, firmware, or hardware that creates and manages virtual machines. It allows multiple virtual machines, each running their own operating system, to share a single hardware host. Hypervisors are fundamental to cloud computing as they enable resource isolation, multi-tenancy, and efficient hardware utilization."),
          QuizQuestion(
              question:
                  "What does the term 'containerization' refer to in cloud computing?",
              options: [
                "The process of shipping physical servers to data centers",
                "Packaging an application and its dependencies into a standardized unit for software development",
                "Storing data in isolated containers to prevent data breaches",
                "Converting traditional servers into cloud-compatible formats"
              ],
              correctIndex: 1,
              explanation:
                  "Containerization refers to the process of packaging an application along with its environment, dependencies, and configuration into a container. This creates a consistent, portable unit that can run anywhere the container runtime is supported. Containerization improves deployment consistency, efficiency, and developer productivity compared to traditional deployment methods."),
          QuizQuestion(
              question:
                  "What is the principle of 'least privilege' in cloud security?",
              options: [
                "Providing users with the minimum level of cloud resources to save costs",
                "Granting users only the permissions they need to perform their specific tasks",
                "Ensuring basic access to cloud services for all users",
                "Restricting cloud access to only the most essential employees"
              ],
              correctIndex: 1,
              explanation:
                  "The principle of least privilege is a security concept in which users, systems, and processes are granted only those permissions necessary to perform their authorized tasks and no more. Implementing least privilege in cloud environments helps minimize the potential damage from accidents, errors, or security breaches by limiting what actions users can perform."),
          QuizQuestion(
              question:
                  "What is a 'shared responsibility model' in cloud computing?",
              options: [
                "A billing model where costs are shared among multiple departments",
                "A framework defining which security responsibilities belong to the provider and which to the customer",
                "A collaborative approach where multiple cloud providers serve one customer",
                "A model where cloud resources are shared equally among all users"
              ],
              correctIndex: 1,
              explanation:
                  "The shared responsibility model defines how security responsibilities are divided between the cloud provider and customer. Typically, providers are responsible for securing the underlying infrastructure (compute, storage, networking, etc.), while customers are responsible for securing their data, applications, access management, and configurations within the cloud environment."),
          QuizQuestion(
              question: "What is 'lift and shift' in cloud migration?",
              options: [
                "A technique for physically relocating servers to cloud data centers",
                "Migrating applications to the cloud with minimal modifications",
                "A process for elevating cloud administrators' privileges",
                "Moving data between different cloud storage tiers"
              ],
              correctIndex: 1,
              explanation:
                  "Lift and shift (also called rehosting) is a cloud migration strategy where applications are moved from on-premises to the cloud with minimal or no modifications. The application architecture remains essentially the same, but runs on cloud infrastructure instead of physical hardware. This approach typically offers the fastest migration path but may not fully leverage cloud-native benefits."),
          QuizQuestion(
              question:
                  "What is a key characteristic of 'cloud-agnostic' applications?",
              options: [
                "They can only run in private clouds",
                "They are designed to work on multiple cloud platforms without significant modifications",
                "They are not aware they are running in a cloud environment",
                "They are limited to basic cloud functionality"
              ],
              correctIndex: 1,
              explanation:
                  "Cloud-agnostic applications are designed to work across multiple cloud platforms without significant modifications. They typically avoid using proprietary services from specific cloud providers and instead rely on standard interfaces, protocols, and patterns. This approach reduces vendor lock-in and gives organizations more flexibility in their cloud strategy."),
          QuizQuestion(
              question: "What does 'idempotence' mean in cloud API operations?",
              options: [
                "The ability to process extremely large volumes of API requests",
                "Operations that produce the same result regardless of how many times they are performed",
                "APIs that can only be called by authenticated users",
                "The capability to revert API changes automatically"
              ],
              correctIndex: 1,
              explanation:
                  "In cloud computing, an idempotent operation is one that produces the same result regardless of how many times it is performed. For example, if you send the same API request to create a resource multiple times, only one resource should be created. Idempotence is important for reliable distributed systems as it allows operations to be safely retried in case of communication failures."),
          QuizQuestion(
              question: "What is a cloud service mesh?",
              options: [
                "A physical network connecting cloud data centers",
                "A network visualization tool for cloud administrators",
                "An infrastructure layer that enables managed, observable, and secure communication between services",
                "A redundant array of cloud storage devices"
              ],
              correctIndex: 2,
              explanation:
                  "A service mesh is an infrastructure layer for microservices applications that handles service-to-service communication. It provides capabilities like traffic management, security, observability, and reliability features without requiring changes to application code. A service mesh typically consists of a control plane for administration and a data plane made up of proxies deployed alongside services."),
          QuizQuestion(
              question: "What is the function of a cloud 'availability set'?",
              options: [
                "A guarantee of specific service uptime percentages",
                "A logical grouping of VMs that protects against hardware and software failures",
                "A record of when cloud services are available to specific users",
                "A list of all available cloud services in a subscription"
              ],
              correctIndex: 1,
              explanation:
                  "An availability set is a logical grouping of VMs in a cloud environment that helps protect against hardware and software failures within a data center. VMs in an availability set are distributed across multiple physical servers, compute racks, storage units, and network switches to avoid a single point of failure, thus improving application reliability and availability."),
          QuizQuestion(
              question:
                  "What is a key function of 'chaos engineering' in cloud environments?",
              options: [
                "Deliberately introducing failures to test system resilience",
                "Creating completely unpredictable cost structures",
                "Allowing developers to deploy code changes without oversight",
                "Randomly allocating computing resources to applications"
              ],
              correctIndex: 0,
              explanation:
                  "Chaos engineering is the practice of deliberately introducing failures into a system to test its resilience and identify weaknesses before they cause real outages. In cloud environments, chaos engineering helps organizations build confidence in their systems' ability to withstand turbulent and unexpected conditions by proactively testing failure scenarios."),
          QuizQuestion(
              question:
                  "What is the purpose of 'Cloud Access Security Brokers' (CASBs)?",
              options: [
                "To negotiate better pricing with cloud providers",
                "To act as security policy enforcement points between cloud users and cloud services",
                "To physically secure the entry points to data centers",
                "To broker the sale of unused cloud resources between organizations"
              ],
              correctIndex: 1,
              explanation:
                  "Cloud Access Security Brokers (CASBs) are security policy enforcement points placed between cloud service consumers and providers. They provide visibility into cloud application usage, data security, compliance, and threat protection. CASBs help organizations extend their security policies beyond their infrastructure into the cloud and maintain consistent security across multiple cloud services."),
          QuizQuestion(
              question:
                  "What does the term 'cloud spend optimization' refer to?",
              options: [
                "The process of maximizing cloud service expenditures",
                "Practices for managing and reducing unnecessary cloud costs",
                "A pricing model where cloud resources get cheaper the more you use",
                "The practice of predicting future cloud expenses"
              ],
              correctIndex: 1,
              explanation:
                  "Cloud spend optimization refers to practices and tools for managing and reducing unnecessary cloud costs. It includes identifying idle resources, right-sizing instances, leveraging reserved instances or savings plans, implementing auto-scaling, managing storage tiers, and establishing governance practices to ensure cloud resources are used efficiently."),
          QuizQuestion(
              question: "What is cloud 'tagging' used for?",
              options: [
                "Physically labeling server hardware",
                "Marking cloud data for automatic deletion",
                "Assigning metadata to cloud resources for organization and management",
                "Identifying malicious content in cloud storage"
              ],
              correctIndex: 2,
              explanation:
                  "Cloud tagging is the practice of applying metadata in the form of key-value pairs to cloud resources. Tags help with resource organization, access control, cost allocation, automation, and governance. Effective tagging strategies allow organizations to categorize resources by purpose, owner, environment, cost center, security requirements, and other important attributes."),
        ];
      case QuizLevel.advanced:
        return [
          // QuizQuestion(
          //     question: "Which of the following is NOT a cloud service model?",
          //     options: ["IaaS", "PaaS", "SaaS", "DaaS (Desktop as a Service)"],
          //     correctIndex: 3,
          //     explanation:
          //         "The three main cloud service models are IaaS (Infrastructure as a Service), PaaS (Platform as a Service), and SaaS (Software as a Service). While DaaS exists, it's not one of the primary cloud service models."),
          // QuizQuestion(
          //     question: "What is the main advantage of cloud computing?",
          //     options: [
          //       "Increased security",
          //       "Cost efficiency and scalability",
          //       "Always faster than on-premises solutions",
          //       "Complete control over hardware"
          //     ],
          //     correctIndex: 1,
          //     explanation:
          //         "A primary advantage of cloud computing is cost efficiency and the ability to scale resources up or down as needed, paying only for what you use."),
          // QuizQuestion(
          //     question: "Which is NOT a major cloud service provider?",
          //     options: [
          //       "Amazon Web Services (AWS)",
          //       "Microsoft Azure",
          //       "Google Cloud Platform",
          //       "Oracle Database"
          //     ],
          //     correctIndex: 3,
          //     explanation:
          //         "AWS, Azure, and Google Cloud are major cloud service providers. Oracle has cloud offerings but Oracle Database itself is not a cloud service provider."),
          // QuizQuestion(
          //     question: "What is auto-scaling in cloud computing?",
          //     options: [
          //       "Automatically updating software",
          //       "Automatically adjusting resources based on demand",
          //       "Automatic data migration between clouds",
          //       "Automatically charging the client's credit card"
          //     ],
          //     correctIndex: 1,
          //     explanation:
          //         "Auto-scaling refers to the automatic adjustment of computational resources (like VMs or containers) based on the current demand or workload."),
          QuizQuestion(
              question: "What does serverless computing mean?",
              options: [
                "Computing without any servers involved",
                "A cloud computing model where the cloud provider manages the infrastructure",
                "Computing using only client devices",
                "Computing without internet connection"
              ],
              correctIndex: 1,
              explanation:
                  "Serverless computing doesn't mean there are no servers. It means the cloud provider handles the server management, so developers can focus on code without worrying about infrastructure."),

          QuizQuestion(
              question:
                  "Which of the following is NOT a major cloud service model?",
              options: [
                "Infrastructure as a Service (IaaS)",
                "Platform as a Service (PaaS)",
                "Software as a Service (SaaS)",
                "Hardware as a Service (HaaS)"
              ],
              correctIndex: 3,
              explanation:
                  "Hardware as a Service (HaaS) is not a standard cloud service model. The three major cloud service models are IaaS, PaaS, and SaaS. While hardware virtualization exists in cloud computing, it's typically part of IaaS offerings."),

          QuizQuestion(
              question: "What is an advantage of using cloud computing?",
              options: [
                "Decreased accessibility",
                "Higher upfront costs",
                "Scalability on demand",
                "Reduced compliance options"
              ],
              correctIndex: 2,
              explanation:
                  "Scalability on demand is a key advantage of cloud computing, allowing resources to be increased or decreased quickly based on business needs without significant capital investment."),

          QuizQuestion(
              question:
                  "Which deployment model keeps all cloud resources on a company's on-premises network?",
              options: [
                "Public cloud",
                "Private cloud",
                "Hybrid cloud",
                "Community cloud"
              ],
              correctIndex: 1,
              explanation:
                  "A private cloud deployment model keeps all cloud resources on a company's on-premises network or in a dedicated environment, providing greater control and security but requiring more management."),

          QuizQuestion(
              question: "What does elasticity refer to in cloud computing?",
              options: [
                "The physical flexibility of cloud servers",
                "The ability to stretch storage without data loss",
                "The ability to quickly scale resources up or down as needed",
                "The elastic pricing model with no fixed costs"
              ],
              correctIndex: 2,
              explanation:
                  "In cloud computing, elasticity refers to the ability to quickly provision and deprovision resources (scale up or down) to meet demand, paying only for what you use when you need it."),

          QuizQuestion(
              question:
                  "Which of the following is a characteristic of Infrastructure as a Service (IaaS)?",
              options: [
                "Provides complete applications to end users",
                "Offers development tools and hosting environments",
                "Provides virtualized computing resources over the internet",
                "Manages only data storage solutions"
              ],
              correctIndex: 2,
              explanation:
                  "Infrastructure as a Service (IaaS) provides virtualized computing resources over the internet, including servers, storage, networks, and operating systems that users can provision and manage themselves."),

          QuizQuestion(
              question:
                  "What is the primary purpose of a Content Delivery Network (CDN) in cloud computing?",
              options: [
                "To secure cloud applications from attacks",
                "To deliver content to users with high availability and performance",
                "To provide database services across multiple regions",
                "To manage user authentication and access control"
              ],
              correctIndex: 1,
              explanation:
                  "A Content Delivery Network (CDN) distributes content from an 'origin' server to 'edge' servers around the world, delivering content to users with high availability and performance by serving it from locations closer to users."),

          QuizQuestion(
              question:
                  "Which of the following is an example of Software as a Service (SaaS)?",
              options: [
                "Amazon EC2",
                "Microsoft Azure Virtual Machines",
                "Google App Engine",
                "Salesforce CRM"
              ],
              correctIndex: 3,
              explanation:
                  "Salesforce CRM is an example of Software as a Service (SaaS), providing a complete application that users can access and use without worrying about the underlying infrastructure, platform, or software updates."),

          QuizQuestion(
              question: "What is a key security concern in cloud computing?",
              options: [
                "Data sovereignty",
                "Hardware maintenance",
                "Server room cooling",
                "Cable management"
              ],
              correctIndex: 0,
              explanation:
                  "Data sovereignty is a key security concern in cloud computing, referring to the fact that data stored in the cloud is subject to the laws and governance structures of the country where the data is located."),

          QuizQuestion(
              question: "What is a cloud availability zone?",
              options: [
                "A geographical region where cloud services are available",
                "An isolated location within a region with independent power, cooling, and networking",
                "A specific type of cloud storage optimized for high availability",
                "A feature that guarantees 100% uptime for cloud services"
              ],
              correctIndex: 1,
              explanation:
                  "A cloud availability zone is an isolated location within a cloud region that has independent power, cooling, and networking to provide higher availability and fault tolerance."),

          QuizQuestion(
              question: "Which of the following best describes cloud bursting?",
              options: [
                "When a cloud server crashes due to overload",
                "A technique for distributing workloads across multiple cloud providers",
                "The process of deploying applications in a cloud environment",
                "A deployment model where applications run primarily in private cloud until demand spikes, then burst into public cloud"
              ],
              correctIndex: 3,
              explanation:
                  "Cloud bursting is a deployment model where applications run primarily in a private cloud until demand increases beyond the private cloud's capacity, at which point the excess workload 'bursts' into a public cloud."),

          QuizQuestion(
              question:
                  "What is the 'shared responsibility model' in cloud computing?",
              options: [
                "A pricing model where multiple customers share the cost of cloud resources",
                "A framework defining security responsibilities between the cloud provider and customer",
                "A system where cloud resources are shared equally among all users",
                "A collaborative development model for cloud applications"
              ],
              correctIndex: 1,
              explanation:
                  "The shared responsibility model is a security framework that defines which security responsibilities belong to the cloud provider and which belong to the customer, varying by service model (IaaS, PaaS, SaaS)."),

          QuizQuestion(
              question: "What is multi-tenancy in cloud computing?",
              options: [
                "Using multiple cloud providers simultaneously",
                "Running multiple operating systems on a single virtual machine",
                "A software architecture where a single instance serves multiple customers",
                "Deploying applications across multiple geographical regions"
              ],
              correctIndex: 2,
              explanation:
                  "Multi-tenancy in cloud computing refers to a software architecture where a single instance of software runs on a server and serves multiple tenants (customers), with logical separation between each tenant's data and configuration."),

          QuizQuestion(
              question:
                  "Which cloud service model provides the most control to users?",
              options: [
                "Software as a Service (SaaS)",
                "Platform as a Service (PaaS)",
                "Infrastructure as a Service (IaaS)",
                "Function as a Service (FaaS)"
              ],
              correctIndex: 2,
              explanation:
                  "Infrastructure as a Service (IaaS) provides the most control to users, allowing them to manage operating systems, storage, applications, and some networking components while the provider manages the physical infrastructure."),

          QuizQuestion(
              question: "What is serverless computing in the cloud?",
              options: [
                "Computing without any servers involved",
                "A model where developers build and run applications without managing servers",
                "A type of computing that only uses client-side processing",
                "Cloud computing without virtual machines"
              ],
              correctIndex: 1,
              explanation:
                  "Serverless computing is a cloud model where developers build and run applications without managing servers. The cloud provider handles the infrastructure provisioning, scaling, and maintenance, allowing developers to focus solely on code."),

          QuizQuestion(
              question:
                  "Which of the following is a characteristic of cloud-native applications?",
              options: [
                "They can only run in public cloud environments",
                "They are designed as tightly coupled monoliths",
                "They are composed of microservices and designed for resilience",
                "They require specialized hardware not available in standard cloud offerings"
              ],
              correctIndex: 2,
              explanation:
                  "Cloud-native applications are typically composed of microservices, packaged in containers, dynamically orchestrated, and designed for resilience, elasticity, and rapid deployment through DevOps processes."),

          QuizQuestion(
              question:
                  "What is a key benefit of using containers in cloud computing?",
              options: [
                "They provide a complete virtualized operating system",
                "They ensure consistent application behavior across different environments",
                "They eliminate the need for application code",
                "They require more resources than virtual machines"
              ],
              correctIndex: 1,
              explanation:
                  "A key benefit of containers is that they package application code with dependencies and configurations, ensuring consistent behavior across development, testing, and production environments regardless of the underlying infrastructure."),

          QuizQuestion(
              question:
                  "What does an Auto Scaling Group do in cloud computing?",
              options: [
                "Automatically updates software across all instances",
                "Adjusts the number of instances based on demand",
                "Scales database storage without manual intervention",
                "Enhances graphics processing capabilities"
              ],
              correctIndex: 1,
              explanation:
                  "An Auto Scaling Group automatically adjusts the number of compute instances (such as virtual machines) running in a cloud environment based on defined conditions like CPU utilization or incoming traffic, ensuring optimal performance and cost efficiency."),

          QuizQuestion(
              question:
                  "What is edge computing in relation to cloud computing?",
              options: [
                "Computing performed exclusively by edge devices like smartphones",
                "A security technique for protecting the perimeter of cloud networks",
                "Processing data near the source of generation instead of in a centralized cloud",
                "Using the newest, cutting-edge cloud technologies"
              ],
              correctIndex: 2,
              explanation:
                  "Edge computing is a distributed computing paradigm that brings computation and data storage closer to the sources of data (the 'edge' of the network) rather than relying on a central cloud datacenter, reducing latency and bandwidth use."),

          QuizQuestion(
              question: "What is a cloud service level agreement (SLA)?",
              options: [
                "A software license for cloud applications",
                "A contract that defines the expected service level and penalties if those levels aren't met",
                "A technical specification document for cloud hardware",
                "A training program for cloud administrators"
              ],
              correctIndex: 1,
              explanation:
                  "A cloud service level agreement (SLA) is a contract between a cloud service provider and a customer that defines the expected level of service, including uptime guarantees, performance metrics, and remedies or penalties if these expectations aren't met."),
        ];
    }
  }
}

// Quiz selection page
class QuizSelectionPage extends StatelessWidget {
  const QuizSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice Quiz'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Select a Topic',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          // Generate a card for each topic
          for (final topic in QuizTopic.values) _buildTopicCard(context, topic),
        ],
      ),
    );
  }

  Widget _buildTopicCard(BuildContext context, QuizTopic topic) {
    // Map topics to appropriate icons
    IconData getIconForTopic(QuizTopic topic) {
      switch (topic) {
        case QuizTopic.programming:
          return Icons.code;
        case QuizTopic.networking:
          return Icons.router;
        case QuizTopic.database:
          return Icons.storage;
        case QuizTopic.operatingSystem:
          return Icons.computer;
        case QuizTopic.dsa:
          return Icons.format_list_numbered;
        case QuizTopic.webDevelopment:
          return Icons.web;
        case QuizTopic.cloudComputing:
          return Icons.cloud;
      }
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () => _navigateToLevelSelection(context, topic),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue.withOpacity(0.2),
                child: Icon(
                  getIconForTopic(topic),
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  topic.displayName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToLevelSelection(BuildContext context, QuizTopic topic) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizLevelSelectionPage(topic: topic),
      ),
    );
  }
}

// Quiz level selection page
class QuizLevelSelectionPage extends StatelessWidget {
  final QuizTopic topic;

  const QuizLevelSelectionPage({
    Key? key,
    required this.topic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${topic.displayName} Quiz'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Select Difficulty Level',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          // Cards for each difficulty level
          _buildLevelCard(
            context,
            QuizLevel.beginner,
            'For those new to the subject',
            Colors.green,
          ),
          _buildLevelCard(
            context,
            QuizLevel.intermediate,
            'For those with basic knowledge',
            Colors.orange,
          ),
          _buildLevelCard(
            context,
            QuizLevel.advanced,
            'For experienced learners',
            Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildLevelCard(
    BuildContext context,
    QuizLevel level,
    String description,
    Color color,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () => _startQuiz(context, level),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: color.withOpacity(0.2),
                    child: Icon(
                      level == QuizLevel.beginner
                          ? Icons.star_border
                          : level == QuizLevel.intermediate
                              ? Icons.star_half
                              : Icons.star,
                      color: color,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    level.displayName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  void _startQuiz(BuildContext context, QuizLevel level) {
    // Get questions for the selected topic and level
    final questions = QuizManager.getQuestions(topic, level);

    // Navigate to quiz page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizPage(
          topic: topic,
          level: level,
          questions: questions,
        ),
      ),
    );
  }
}

// Quiz page to display questions
class QuizPage extends StatefulWidget {
  final QuizTopic topic;
  final QuizLevel level;
  final List<QuizQuestion> questions;

  const QuizPage({
    Key? key,
    required this.topic,
    required this.level,
    required this.questions,
  }) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  int? _selectedOptionIndex;
  bool _hasAnswered = false;
  List<int?> _userAnswers = [];

  @override
  void initState() {
    super.initState();
    // Initialize user answers list
    _userAnswers = List.filled(widget.questions.length, null);
  }

  void _selectOption(int index) {
    if (_hasAnswered) return;

    setState(() {
      _selectedOptionIndex = index;
      _hasAnswered = true;
      _userAnswers[_currentQuestionIndex] = index;

      // Update score if answer is correct
      if (index == widget.questions[_currentQuestionIndex].correctIndex) {
        _score++;
      }
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < widget.questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _hasAnswered = false;
        _selectedOptionIndex = _userAnswers[_currentQuestionIndex];
      });
    } else {
      // Quiz completed
      _showResults();
    }
  }

  void _previousQuestion() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
        _selectedOptionIndex = _userAnswers[_currentQuestionIndex];
        _hasAnswered = _selectedOptionIndex != null;
      });
    }
  }

  void _showResults() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => QuizResultsPage(
          topic: widget.topic,
          level: widget.level,
          score: _score,
          totalQuestions: widget.questions.length,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.topic.displayName} Quiz'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                'Question ${_currentQuestionIndex + 1}/${widget.questions.length}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: (_currentQuestionIndex + 1) / widget.questions.length,
            backgroundColor: Colors.grey[200],
            color: Colors.blue,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    question.question,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ...List.generate(
                    question.options.length,
                    (index) => _buildOptionCard(index, question),
                  ),
                  if (_hasAnswered)
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Card(
                        color: Colors.blue[50],
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.lightbulb,
                                    color: Colors.amber[700],
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'Explanation',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(question.explanation),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed:
                      _currentQuestionIndex > 0 ? _previousQuestion : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black,
                  ),
                  child: const Text('Previous'),
                ),
                ElevatedButton(
                  onPressed: _hasAnswered ? _nextQuestion : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    _currentQuestionIndex < widget.questions.length - 1
                        ? 'Next'
                        : 'Finish',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionCard(int index, QuizQuestion question) {
    final bool isSelected = _selectedOptionIndex == index;
    final bool isCorrect = index == question.correctIndex;

    Color borderColor = Colors.grey;
    Color backgroundColor = Colors.white;
    IconData? trailingIcon;

    if (_hasAnswered) {
      if (isCorrect) {
        borderColor = Colors.green;
        backgroundColor = Colors.green[50]!;
        trailingIcon = Icons.check_circle;
      } else if (isSelected) {
        borderColor = Colors.red;
        backgroundColor = Colors.red[50]!;
        trailingIcon = Icons.cancel;
      }
    } else if (isSelected) {
      borderColor = Colors.blue;
      backgroundColor = Colors.blue[50]!;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: borderColor,
          width: isSelected ? 2 : 1,
        ),
      ),
      color: backgroundColor,
      elevation: isSelected ? 2 : 1,
      child: InkWell(
        onTap: _hasAnswered ? null : () => _selectOption(index),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Text(
                '${String.fromCharCode(65 + index)}.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.blue : Colors.black,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(question.options[index]),
              ),
              if (trailingIcon != null)
                Icon(
                  trailingIcon,
                  color: isCorrect ? Colors.green : Colors.red,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// Quiz results page
class QuizResultsPage extends StatelessWidget {
  final QuizTopic topic;
  final QuizLevel level;
  final int score;
  final int totalQuestions;

  const QuizResultsPage({
    Key? key,
    required this.topic,
    required this.level,
    required this.score,
    required this.totalQuestions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final percentage = (score / totalQuestions) * 100;
    final resultMessage = _getResultMessage(percentage);
    final resultColor = _getResultColor(percentage);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$topic ${level.displayName} Quiz',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: CircularProgressIndicator(
                    value: score / totalQuestions,
                    strokeWidth: 10,
                    backgroundColor: Colors.grey[300],
                    color: resultColor,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      '$score',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: resultColor,
                      ),
                    ),
                    Text(
                      'out of $totalQuestions',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              '${percentage.toStringAsFixed(0)}%',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: resultColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              resultMessage,
              style: TextStyle(
                fontSize: 18,
                color: resultColor,
              ),
            ),
            const SizedBox(height: 48),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Return to Quiz Level Selection
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Try Another Level'),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => QuizSelectionPage()));

                    //Return to topic selection
                    Navigator.of(context).popUntil(
                      (route) =>
                          route.isFirst || route.settings.name == '/topics',
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Select Another Topic'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getResultMessage(double percentage) {
    if (percentage >= 90) {
      return 'Excellent!';
    } else if (percentage >= 70) {
      return 'Good job!';
    } else if (percentage >= 50) {
      return 'Not bad!';
    } else {
      return 'Keep practicing!';
    }
  }

  Color _getResultColor(double percentage) {
    if (percentage >= 90) {
      return Colors.green;
    } else if (percentage >= 70) {
      return Colors.blue;
    } else if (percentage >= 50) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}
