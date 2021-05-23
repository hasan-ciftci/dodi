enum SelectedOption { A, B, C, EMPTY }

extension SelectedOptionText on SelectedOption {
  String get optionTitle {
    switch (this) {
      case SelectedOption.A:
        return "A";
        break;
      case SelectedOption.B:
        return "B";
        break;
      case SelectedOption.C:
        return "C";
        break;
      default:
        return "";
    }
  }
}
