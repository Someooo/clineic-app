part of 'forums_cubit.dart';

abstract class ForumsState {
  const ForumsState();
}

class ForumsInitial extends ForumsState {
  const ForumsInitial();
}

class ForumsLoading extends ForumsState {
  const ForumsLoading();
}

class ForumsLoaded extends ForumsState {
  final List<ForumEntity> forums;

  const ForumsLoaded({required this.forums});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ForumsLoaded && 
           other.forums == forums;
  }

  @override
  int get hashCode => forums.hashCode;
}

class ForumsError extends ForumsState {
  final String message;

  const ForumsError({required this.message});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ForumsError && 
           other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class ForumsAnswerPosted extends ForumsState {
  final String message;

  const ForumsAnswerPosted({required this.message});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ForumsAnswerPosted && 
           other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class ForumsAnswersLoaded extends ForumsState {
  final List<ForumAnswerModel> answers;

  const ForumsAnswersLoaded({required this.answers});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ForumsAnswersLoaded && 
           other.answers == answers;
  }

  @override
  int get hashCode => answers.hashCode;
}
