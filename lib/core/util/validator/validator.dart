class Validator {
  /// Validates Username

  static String? validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Username is required';
    }
    if (value.trim().length < 3) {
      return 'Username must be at least 3 characters';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password is required';
    }

    final password = value.trim();

    // 1️⃣ Minimum length
    if (password.length < 6) {
      return 'Password must be at least 8 characters';
    }

    // 2️⃣ At least one letter
    if (!RegExp(r'[A-Za-z]').hasMatch(password)) {
      return 'Password must include at least one letter';
    }

    // ✅ All checks passed
    return null;
  }

  /// Validates email format

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    final email = value.trim();

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(email)) {
      return 'Enter a valid email address';
    }

    return null;
  }
// decimal 
static String? validateDecimal(String? value) {
  if (value == null || value.isEmpty) return null; // optional field
  final number = double.tryParse(value);
  if (number == null) {
    return 'Enter valid number';
  }
  return null;
}

  /// Validates Full Name

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }
    if (!RegExp(r'^[A-Za-z ]+$').hasMatch(value.trim())) {
      return 'Name can only contain letters and spaces';
    }
    return null;
  }

  /// validate house name
  static String? validateHouseName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'House name is required';
    }
    return null;
  }

  /// Validates Indian Mobile Number

  static String? validateMobile(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Mobile number is required';
    }
    if (!RegExp(r'^[6-9]\d{9}$').hasMatch(value.trim())) {
      return 'Enter a valid 10-digit Indian mobile number';
    }
    return null;
  }

  /// Validates Pincode
  static String? validatePincode(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Pincode is required';
    }
    if (!RegExp(r'^\d{6}$').hasMatch(value.trim())) {
      return 'Enter a valid 6-digit pincode';
    }
    return null;
  }

  /// Validates Date
  static String? validateDate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Date is required';
    }
    return null;
  }

  /// Validates Dropdown Selection
  static String? validateSelection<T>(T? value) {
    if (value == null) {
      return 'Please select a value';
    }
    return null;
  }

  /// Validates House Number
  static String? houseNumberValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "House number is required";
    }

  

    return null;
  }

  static String? cardNumberValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Card number is required";
    }

    if (value.length != 12) {
      return "Card number must be 12 digits";
    }

    return null;
  }

  // static String? validateIncome(String? value)   {
  //   if (value == null || value.trim().isEmpty) {
  //     return 'Income is required';
  //   }
  //   final income = int.tryParse(value.trim());
  //   if (income == null ) {
  //     return 'Enter a valid income amount';
  //   }
  //   return null;
  // }

  static String? validateIncome(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Income is required';
  }

  final trimmed = value.trim();

  // Allow decimal numbers like 56, 56.00, 56.0000
  final income = double.tryParse(trimmed);

  if (income == null) {
    return 'Enter a valid income amount';
  }

  if (income < 0) {
    return 'Income cannot be negative';
  }

  return null;
}

}
