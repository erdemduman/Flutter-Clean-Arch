/// An abstract class to be extended by the Bloc parameter classes.
abstract class BlocParameter {
  const BlocParameter();
}

/// The class to use if there is no need to pass any parameter to any Bloc.
class BlocNoParameter extends BlocParameter {
  const BlocNoParameter();
}
