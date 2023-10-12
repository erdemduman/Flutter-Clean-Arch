/// An abstract class to be extended by the use case parameter classes.
abstract class UseCaseParameter {}

/// The class to use if there is no need to pass any parameter to any use case.
class UseCaseNoParameter extends UseCaseParameter {}
