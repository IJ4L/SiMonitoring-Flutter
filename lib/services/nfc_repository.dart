import 'package:nfc_manager/nfc_manager.dart';

class NfcRepository {
  Future<String> startNFCSession() async {
    late String nimMahasiswa;
    await NfcManager.instance.stopSession();
    await NfcManager.instance.startSession(
      onDiscovered: (NfcTag tag) async {
        var ndef = Ndef.from(tag);
        if (ndef != null) {
          for (var rec in ndef.cachedMessage!.records) {
            String payload = String.fromCharCodes(rec.payload);
            nimMahasiswa = payload.substring(3);
          }
        }
      },
    );
    return nimMahasiswa;
  }
}
