class QuizQuestion{
const QuizQuestion(this.question,this.answers);
  final String question;
  final List<String> answers;

  List<String> shuffleAns(){
    final List<String>shuffleList=List.of(answers);
    shuffleList.shuffle();
    return shuffleList;
  }
}