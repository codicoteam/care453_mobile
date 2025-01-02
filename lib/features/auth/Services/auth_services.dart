import 'package:care453/core/utils/api_response/ap_response.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

class AuthServices {
  static final Logger _logger = Logger();

  static Future<APIResponse<String>> login(
      {required String emailAddress, required String password}) async {
    try {
      final loginResponse =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      if (loginResponse.user != null) {
        // Handle successful login (optional, remove if not needed)
        _logger.i('Login successful: ${loginResponse.user!.email}');

        return APIResponse(
          success: true,
          message: 'Login successful',
          data: loginResponse.user!.uid,
        );
      }

      return APIResponse(
        success: false,
        message: 'Login failed',
        data: null,
      );
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase authentication errors
      String errorMessage;
      switch (e.code) {
        case 'invalid-email':
          errorMessage = 'Invalid email address format.';
          break;
        case 'user-disabled':
          errorMessage = 'User account is disabled';
          break;
        case 'user-not-found':
          errorMessage = 'No user found for that email';
          break;
        case 'wrong-password':
          errorMessage = 'Incorrect password';
          break;
        default:
          errorMessage = e.message ?? 'An unknown error occurred';
      }

      return APIResponse(
        success: false,
        message: errorMessage,
        data: null,
      );
    } catch (e) {
      return APIResponse(
        success: false,
        message: e.toString(),
        data: null,
      );
    }
  }

  static Future<APIResponse<UserCredential>> signInWithGoogle() async {
    try {
      // Begin interactive sign-in process
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();

      if (googleSignInAccount != null) {
        // Obtain auth details from request
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        // Create a new credential for the user
        final credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        // Attempt to sign in with the credential
        final UserCredential existingUser =
            await FirebaseAuth.instance.signInWithCredential(credential);

        if (existingUser.user != null) {
          return APIResponse(
            success: true,
            message: 'Google Sign-In successful',
            data: existingUser,
          );
        }

        // If no existing user, proceed with registration
        final UserCredential newUser =
            await FirebaseAuth.instance.signInWithCredential(credential);
        return APIResponse(
          success: true,
          message: 'New user registered via Google',
          data: newUser,
        );
      } else {
        // User canceled sign-in process
        return APIResponse(
          success: false,
          message: 'Google Sign-In canceled',
          data: null,
        );
      }
    } catch (e) {
      // Handle any errors that occur during the sign-in process
      _logger.e("Error signing in with Google: $e");
      return APIResponse(
        success: false,
        message: 'Google Sign-In failed: ${e.toString()}',
        data: null,
      );
    }
  }


static Future<APIResponse<String>> signOut() async {
  try {
    await FirebaseAuth.instance.signOut();
    return APIResponse(
      success: true,
      message: 'Sign-out successful',
      data: null,
    );
  } catch (e) {
    return APIResponse(
      success: false,
      message: 'Sign-out failed: ${e.toString()}',
      data: null,
    );
  }
}




static Future<APIResponse<String>> sendPasswordResetEmail({required String email}) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    return APIResponse(
      success: true,
      message: 'Password reset email sent successfully',
      data: null,
    );
  } on FirebaseAuthException catch (e) {
    // Handle specific Firebase authentication errors
    return APIResponse(
      success: false,
      message: e.message ?? 'An unknown error occurred',
      data: null,
    );
  } catch (e) {
    // Handle any other errors
    return APIResponse(
      success: false,
      message: 'Failed to send password reset email: ${e.toString()}',
      data: null,
    );
  }
}


// Sign up with email and password
static Future<APIResponse<String>> signUpWithVerification({
  required String emailAddress,
  required String password,
  required String userName,
}) async {
  try {
    // Step 1: Create user with email and password
    final UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );

    // Step 2: Send verification email
    await userCredential.user!.sendEmailVerification();

    // Step 3: Update the user's profile
    await userCredential.user!.updateDisplayName(userName);

    // Step 4: Retrieve user token for further processing
    final String? userToken = await userCredential.user!.getIdToken();

    // Optionally handle custom claims or FCM token here
    // Example:

    return APIResponse(
      success: true,
      message: 'User registered successfully. Verification email sent.',
      data: null,
    );
  } on FirebaseAuthException catch (e) {
    // Handle specific Firebase authentication errors
    String errorMessage;
    switch (e.code) {
      case 'email-already-in-use':
        errorMessage = 'Email address is already in use';
        break;
      case 'weak-password':
        errorMessage = 'Password is too weak';
        break;
      default:
        errorMessage = 'Unknown error occurred. Please contact support.';
    }
    return APIResponse(
      success: false,
      message: errorMessage,
      data: null,
    );
  } catch (e) {
    // Handle other unforeseen errors
    return APIResponse(
      success: false,
      message: 'An unexpected error occurred: ${e.toString()}',
      data: null,
    );
  }
}
  // Assuming this method exists elsewhere in your cod
}
