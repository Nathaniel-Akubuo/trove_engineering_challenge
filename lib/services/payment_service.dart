import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:http/http.dart' as http;

class PaymentService {
  final _payStackPlugin = PaystackPlugin();
  final String _secretTestKey =
      'sk_test_1d93d25320c18d35bb426e23c0a4b73795b3b09a';
  final String _publicTestKey =
      'pk_test_452eedf6a4de151cc0769716338c4427e8761df6';

  get secretTestKey => _secretTestKey;

  get publicTestKey => _publicTestKey;

  Future<bool> chargeCard(
      {required BuildContext context,
      required int amount,
      required String email}) async {
    Charge charge = Charge()
      ..currency = 'USD'
      ..amount = amount
      ..reference = _getReference()
      ..accessCode = await createAccessCode(amount, email)
      ..email = email; //customer email
    CheckoutResponse response = await _payStackPlugin.checkout(
      context,
      charge: charge,
      method: CheckoutMethod.card,
    );
    if (response.status == true) {
      var verify = await verifyOnServer(response.reference);
      if (verify) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  void initializePlugin() {
    _payStackPlugin.initialize(publicKey: publicTestKey);
  }

  Future<String> createAccessCode(amount, email) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $secretTestKey'
    };
    Map body = {"amount": amount, "email": email, "reference": _getReference()};
    String payload = jsonEncode(body);
    http.Response response = await http.post(
        Uri.parse('https://api.paystack.co/transaction/initialize'),
        headers: headers,
        body: payload);
    final Map data = jsonDecode(response.body);
    String accessCode = data['data']['access_code'];
    return accessCode;
  }

  Future<bool> verifyOnServer(reference) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $secretTestKey'
      };
      http.Response response = await http.get(
          Uri.parse('https://api.paystack.co/transaction/verify/$reference'),
          headers: headers);
      final Map data = jsonDecode(response.body);
      if (data['data']['status'] == 'success') {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  String _getReference() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }
}
