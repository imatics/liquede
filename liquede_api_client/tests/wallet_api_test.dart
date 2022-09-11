import 'package:swagger/api.dart';
import 'package:test/test.dart';


/// tests for WalletApi
void main() {
  var instance = new WalletApi();

  group('tests for WalletApi', () {
    //Future<WalletViewStandardResponse> createTransactionPin({ WalletPinModel body }) async
    test('test createTransactionPin', () async {
      // TODO
    });

    //Future<WalletViewStandardResponse> createUserWallet({ WalletModel body }) async
    test('test createUserWallet', () async {
      // TODO
    });

    //Future<WalletViewStandardResponse> debitWallet({ DebitWalletModel body }) async
    test('test debitWallet', () async {
      // TODO
    });

    //Future<StringStandardResponse> fundWallet({ FundWalletModel body }) async
    test('test fundWallet', () async {
      // TODO
    });

    //Future<Int32StandardResponse> getTransactionPin(int userId) async
    test('test getTransactionPin', () async {
      // TODO
    });

    //Future<CardViewIEnumerableStandardResponse> listCards() async
    test('test listCards', () async {
      // TODO
    });

    //Future<TransactionViewPagedCollectionStandardResponse> listCardsByUserId(int userId, { int offset, int limit }) async
    test('test listCardsByUserId', () async {
      // TODO
    });

    //Future<TransactionViewPagedCollectionStandardResponse> listTransactions(int userId, { int offset, int limit, String search }) async
    test('test listTransactions', () async {
      // TODO
    });

    //Future<TransactionViewPagedCollectionStandardResponse> statementOfAccount(int userId, DateTime startDate, DateTime endDate, { int offset, int limit }) async
    test('test statementOfAccount', () async {
      // TODO
    });

    //Future<WalletViewStandardResponse> transferToNigerianBank({ NGNTransferModel body }) async
    test('test transferToNigerianBank', () async {
      // TODO
    });

    //Future<WalletViewStandardResponse> transferToWallet({ WalletTransferModel body }) async
    test('test transferToWallet', () async {
      // TODO
    });

    //Future<PaymentViewStandardResponse> validatePayment(String transactionReference, int transactionId) async
    test('test validatePayment', () async {
      // TODO
    });

    //Future<TransactionViewPagedCollectionStandardResponse> walletBalance({ int userId }) async
    test('test walletBalance', () async {
      // TODO
    });

  });
}
