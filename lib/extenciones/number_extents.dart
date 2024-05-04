extension NumExtension on num {
  String toMOney() {
    if (this is int) return "\$ $this";

    if (this is double) {
      double y = toDouble() - toInt();
      if (y > 0) {
        return "\$ ${toStringAsFixed(2)}";
      } else {
        return "\$ ${toInt()}";
      }
    } else {
      return "";
    }
  }

  String parsevalor([int fix = 2]) {
    if (this is int) {
      return toString();
    } else if (this is double) {
      return toStringAsFixed(fix);
    }
    return "";
  }
}
