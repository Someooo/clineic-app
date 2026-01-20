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
