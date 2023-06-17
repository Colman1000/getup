extension Filters<T> on Iterable<T> {
  Iterable<T> filterBy<F>(F Function(T elem) filter) {
    final seen = <F>{};
    final ret = <T>[];
    forEach((element) {
      if (!seen.contains(filter(element))) {
        ret.add(element);
        seen.add(filter(element));
      }
    });
    return ret;
  }
}
