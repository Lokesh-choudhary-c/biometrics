# Biometric Login App - Flutter Assignment

## Assignment Title: Implement Biometric Login Inside the App

### Developed by: Lokesh Choudhary C

---

## Objective

To implement biometric authentication (fingerprint or face recognition) in a Flutter app, along with a secure password fallback. This improves user security and experience using platform-standard methods.

---

## Features Implemented

### 1. Biometric Authentication
- Integrated with `local_auth`
- Supports fingerprint and facial recognition
- Secure OS-level authentication prompts

### 2. Password Setup & Login (Fallback)
- Users create a password on first use
- Password is stored securely using `flutter_secure_storage`
- Option to login using password if biometrics are not available or fail

### 3. Secure Storage
- Tokens and password are securely stored using:
  - Android Keystore
  - iOS Keychain

### 4. UI & UX
- Clean modern design inspired by Gen Z themes
- Instructions and feedback provided for login methods
- Snackbar messages for actions like incorrect password, success, etc.

### 5. Navigation Flow
- `/` → Login Screen  
- `/home` → Home Screen after successful login  
- Controlled navigation and logout support

---

## Testing & Edge Cases

| Case                                               | Status |
|----------------------------------------------------|--------|
| Biometric login on supported device                | Passed |
| Device with biometrics disabled                    | Passed |
| Device without biometric hardware                  | Passed |
| Password fallback works properly                   | Passed |
| New fingerprint added or changed after setup       | Passed |
| Re-launch after login(token persist logic skipped) | Manual check |
| Secure storage for both token and password         | Passed |

---

## Tech Stack

- Flutter & Dart
- `local_auth`: Biometric authentication
- `flutter_secure_storage`: Secure data handling
- Material Design 3

---

## How to Run the App

1. **Clone the repository**
   ```bash
   git clone https://github.com/Lokesh-choudhary-c/biometrics.git
   cd biometric_login_app



2. **Install dependencies** 

  flutter pub get
  flutter run

---

## Limitations & Notes

  No backend/API connection implemented (token use simulated)

  Password reset is not yet implemented

  No persistent login on app restart (can be added)

  Password is stored securely but without additional encryption (already safe via Keychain/Keystore)

# biometrics
