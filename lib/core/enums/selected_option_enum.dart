enum SelectedOption { A, B, C, D, E, EMPTY }

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
      case SelectedOption.D:
        return "D";
        break;
      case SelectedOption.E:
        return "E";
        break;
      default:
        return "";
    }
  }
}
