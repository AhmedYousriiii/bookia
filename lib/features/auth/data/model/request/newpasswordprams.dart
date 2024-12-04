class Newpasswordprams {
  int? verifyCode;
  int? newPassword;
  int? newPasswordConfirmation;

  Newpasswordprams({
    this.verifyCode,
    this.newPassword,
    this.newPasswordConfirmation,
  });

  factory Newpasswordprams.fromJson(Map<String, dynamic> json) {
    return Newpasswordprams(
      verifyCode: json['verify_code'] as int?,
      newPassword: json['new_password'] as int?,
      newPasswordConfirmation: json['new_password_confirmation'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'verify_code': verifyCode,
        'new_password': newPassword,
        'new_password_confirmation': newPasswordConfirmation,
      };
}
