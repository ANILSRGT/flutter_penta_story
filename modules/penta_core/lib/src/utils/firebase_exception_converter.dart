import 'package:flutter/material.dart';

class FirebaseExceptionConverter {
  const FirebaseExceptionConverter._();

  static String getMessage(String code, {Locale? locale}) {
    if (locale == null) return _getMessageEn(code);

    return switch (locale.languageCode) {
      'tr' => _getMessageTr(code),
      _ => _getMessageEn(code),
    };
  }

  static String _getMessageEn(String code) {
    return switch (code) {
      'email-already-in-use' =>
        'Email already in use, please use another email address.',
      'invalid-email' ||
      'auth/invalid-email' =>
        'The email address is not valid.',
      'operation-not-allowed' => 'Email/password accounts are not enabled.',
      'weak-password' => 'The password is not strong enough.',
      'too-many-requests' => 'Too many requests, please try again later.',
      'user-token-expired' => 'User token expired, please login again.',
      'network-request-failed' => 'Network request failed, please try again.',
      'user-disabled' => 'User has been disabled.',
      'user-not-found' || 'auth/user-not-found' => 'User not found.',
      'wrong-password' => 'Email or password is incorrect.',
      'INVALID_LOGIN_CREDENTIALS' => 'Email or password is incorrect.',
      _ => 'An error occurred, please try again later.',
    };
  }

  static String _getMessageTr(String code) {
    return switch (code) {
      'email-already-in-use' =>
        'Email zaten kullanımda, lütfen başka bir email adresi kullanın.',
      'invalid-email' || 'auth/invalid-email' => 'Email adresi geçersiz.',
      'operation-not-allowed' => 'Email/şifre hesapları etkin değil.',
      'weak-password' => 'Şifre yeterince güçlü değil.',
      'too-many-requests' =>
        'Çok fazla istek, lütfen daha sonra tekrar deneyin.',
      'user-token-expired' =>
        'Kullanıcı jetonu süresi doldu, lütfen tekrar giriş yapın.',
      'network-request-failed' =>
        'Ağ isteği başarısız oldu, lütfen tekrar deneyin.',
      'user-disabled' => 'Kullanıcı devre dışı bırakıldı.',
      'user-not-found' || 'auth/user-not-found' => 'Kullanıcı bulunamadı.',
      'wrong-password' => 'Email veya şifre yanlış.',
      'INVALID_LOGIN_CREDENTIALS' => 'Email veya şifre yanlış.',
      _ => 'Bir hata oluştu, lütfen daha sonra tekrar deneyin.',
    };
  }
}
