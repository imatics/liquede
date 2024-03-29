part of swagger.api;

class QueryParam {
  String name;
  String value;

  QueryParam(this.name, this.value);
}

class ApiClient {

  String basePath;
  var client = new Client();

  Map<String, String> _defaultHeaderMap = {};
  Map<String, Authentication> _authentications = {};

  final _RegList = new RegExp(r'^List<(.*)>$');
  final _RegMap = new RegExp(r'^Map<String,(.*)>$');

  ApiClient({this.basePath: "https://liquiderescue.herokuapp.com"}) {
    // Setup authentications (key: authentication name, value: authentication).
    _authentications['Bearer'] = new OAuth(accessToken: "");
  }

  void addDefaultHeader(String key, String value) {
     _defaultHeaderMap[key] = value;
  }

  // dynamic _deserialize(dynamic value, String? targetType) {
  //   try {
  //     switch (targetType) {
  //       case 'String':
  //         return '$value';
  //       case 'int':
  //         return value is int ? value : int.parse('$value');
  //       case 'bool':
  //         return value is bool ? value : '$value'.toLowerCase() == 'true';
  //       case 'double':
  //         return value is double ? value : double.parse('$value');
  //       case 'AirtimePurchaseInput':
  //         return new AirtimePurchaseInput.fromJson(value);
  //       case 'AirtimePurchaseView':
  //         return new AirtimePurchaseView.fromJson(value);
  //       case 'AirtimePurchaseViewStandardResponse':
  //         return new AirtimePurchaseViewStandardResponse.fromJson(value);
  //       case 'AvailablePricingOptionResponse':
  //         return new AvailablePricingOptionResponse.fromJson(value);
  //       case 'BaxiProviderResponse':
  //         return new BaxiProviderResponse.fromJson(value);
  //       case 'BaxiProvidersResponse':
  //         return new BaxiProvidersResponse.fromJson(value);
  //       case 'BaxiProvidersResponseStandardResponse':
  //         return new BaxiProvidersResponseStandardResponse.fromJson(value);
  //       case 'CableSubscriptionModel':
  //         return new CableSubscriptionModel.fromJson(value);
  //       case 'Card':
  //         return new Card.fromJson(value);
  //       case 'CardView':
  //         return new CardView.fromJson(value);
  //       case 'CardViewIEnumerableStandardResponse':
  //         return new CardViewIEnumerableStandardResponse.fromJson(value);
  //       case 'Code':
  //         return new Code.fromJson(value);
  //       case 'CurrentBouquetRawResponse':
  //         return new CurrentBouquetRawResponse.fromJson(value);
  //       case 'DataBundlePurchaseInput':
  //         return new DataBundlePurchaseInput.fromJson(value);
  //       case 'DataProviderResponse':
  //         return new DataProviderResponse.fromJson(value);
  //       case 'DataProviderResponseStandardResponse':
  //         return new DataProviderResponseStandardResponse.fromJson(value);
  //       case 'DebitWalletModel':
  //         return new DebitWalletModel.fromJson(value);
  //       case 'FundWalletModel':
  //         return new FundWalletModel.fromJson(value);
  //       case 'Int32StandardResponse':
  //         return new Int32StandardResponse.fromJson(value);
  //       case 'ItemResponse':
  //         return new ItemResponse.fromJson(value);
  //       case 'Link':
  //         return new Link.fromJson(value);
  //       case 'LiquedeSealInput':
  //         return new LiquedeSealInput.fromJson(value);
  //       case 'LiquiedeGoalInput':
  //         return new LiquiedeGoalInput.fromJson(value);
  //       case 'LoanModel':
  //         return new LoanModel.fromJson(value);
  //       case 'LoanView':
  //         return new LoanView.fromJson(value);
  //       case 'LoanViewIEnumerableStandardResponse':
  //         return new LoanViewIEnumerableStandardResponse.fromJson(value);
  //       case 'LoanViewPagedCollection':
  //         return new LoanViewPagedCollection.fromJson(value);
  //       case 'LoanViewPagedCollectionStandardResponse':
  //         return new LoanViewPagedCollectionStandardResponse.fromJson(value);
  //       case 'LoanViewStandardResponse':
  //         return new LoanViewStandardResponse.fromJson(value);
  //       case 'LoginModel':
  //         return new LoginModel.fromJson(value);
  //       case 'MediaModel':
  //         return new MediaModel.fromJson(value);
  //       case 'MultichoiceAccountResponse':
  //         return new MultichoiceAccountResponse.fromJson(value);
  //       case 'MultichoiceAccountResponseStandardResponse':
  //         return new MultichoiceAccountResponseStandardResponse.fromJson(value);
  //       case 'MultichoiceUserResponse':
  //         return new MultichoiceUserResponse.fromJson(value);
  //       case 'NGNTransferModel':
  //         return new NGNTransferModel.fromJson(value);
  //       case 'PasswordReset':
  //         return new PasswordReset.fromJson(value);
  //       case 'PasswordResetModel':
  //         return new PasswordResetModel.fromJson(value);
  //       case 'PaymentLog':
  //         return new PaymentLog.fromJson(value);
  //       case 'PaymentView':
  //         return new PaymentView.fromJson(value);
  //       case 'PaymentViewStandardResponse':
  //         return new PaymentViewStandardResponse.fromJson(value);
  //       case 'ProviderBouquetResponse':
  //         return new ProviderBouquetResponse.fromJson(value);
  //       case 'ProviderBouquetResponseListStandardResponse':
  //         return new ProviderBouquetResponseListStandardResponse.fromJson(value);
  //       case 'ProviderBundleResponse':
  //         return new ProviderBundleResponse.fromJson(value);
  //       case 'ProviderBundleResponseListStandardResponse':
  //         return new ProviderBundleResponseListStandardResponse.fromJson(value);
  //       case 'ProviderResponse':
  //         return new ProviderResponse.fromJson(value);
  //       case 'PurchaseElectricityModel':
  //         return new PurchaseElectricityModel.fromJson(value);
  //       case 'RawOutputResponse':
  //         return new RawOutputResponse.fromJson(value);
  //       case 'Register':
  //         return new Register.fromJson(value);
  //       case 'SavingPlanType':
  //         return new SavingPlanType.fromJson(value);
  //       case 'SavingPlanTypeIEnumerableStandardResponse':
  //         return new SavingPlanTypeIEnumerableStandardResponse.fromJson(value);
  //       case 'SavingPlans':
  //         return new SavingPlans.fromJson(value);
  //       case 'SavingsView':
  //         return new SavingsView.fromJson(value);
  //       case 'SavingsViewStandardResponse':
  //         return new SavingsViewStandardResponse.fromJson(value);
  //       case 'SavingsWithdrawalModel':
  //         return new SavingsWithdrawalModel.fromJson(value);
  //       case 'Status':
  //         return new Status.fromJson(value);
  //       case 'StringStandardResponse':
  //         return new StringStandardResponse.fromJson(value);
  //       case 'SubscriptionModel':
  //         return new SubscriptionModel.fromJson(value);
  //       case 'Transaction':
  //         return new Transaction.fromJson(value);
  //       case 'TransactionView':
  //         return new TransactionView.fromJson(value);
  //       case 'TransactionViewPagedCollection':
  //         return new TransactionViewPagedCollection.fromJson(value);
  //       case 'TransactionViewPagedCollectionStandardResponse':
  //         return new TransactionViewPagedCollectionStandardResponse.fromJson(value);
  //       case 'UpdateUserModel':
  //         return new UpdateUserModel.fromJson(value);
  //       case 'User':
  //         return new User.fromJson(value);
  //       case 'UserMetricsView':
  //         return new UserMetricsView.fromJson(value);
  //       case 'UserView':
  //         return new UserView.fromJson(value);
  //       case 'UserViewIEnumerableStandardResponse':
  //         return new UserViewIEnumerableStandardResponse.fromJson(value);
  //       case 'UserViewPagedCollection':
  //         return new UserViewPagedCollection.fromJson(value);
  //       case 'UserViewPagedCollectionStandardResponse':
  //         return new UserViewPagedCollectionStandardResponse.fromJson(value);
  //       case 'UserViewStandardResponse':
  //         return new UserViewStandardResponse.fromJson(value);
  //       case 'Wallet':
  //         return new Wallet.fromJson(value);
  //       case 'WalletModel':
  //         return new WalletModel.fromJson(value);
  //       case 'WalletPinModel':
  //         return new WalletPinModel.fromJson(value);
  //       case 'WalletTransferModel':
  //         return new WalletTransferModel.fromJson(value);
  //       case 'WalletView':
  //         return new WalletView.fromJson(value);
  //       case 'WalletViewStandardResponse':
  //         return new WalletViewStandardResponse.fromJson(value);
  //       default:
  //         {
  //           Match? match = _RegList.firstMatch(targetType??"");
  //           if (value is List && match != null) {
  //             var newTargetType = match[1];
  //             return value.map((v) => _deserialize(v, newTargetType)).toList();
  //           } else if (value is Map && match != null) {
  //             var newTargetType = match[1];
  //             return new Map.fromIterables(value.keys,
  //                 value.values.map((v) => _deserialize(v, newTargetType)));
  //           }
  //         }
  //     }
  //   } catch (e, stack) {
  //     print(e);
  //     print(stack);
  //     throw new ApiException.withInner(500, 'Exception during deserialization.', e, stack);
  //   }
  //   throw new ApiException(500, 'Could not find a suitable class for deserialization');
  // }

  // dynamic deserialize(String jsonVal, String targetType) {
  //   // Remove all spaces.  Necessary for reg expressions as well.
  //   targetType = targetType.replaceAll(' ', '');
  //
  //   if (targetType == 'String') return jsonVal;
  //
  //   var decodedJson = json.decode(jsonVal);
  //   return BaseResponse.fromJson(decodedJson, targetType);
  // }

  String serialize(Object? obj) {
    String serialized = '';
    if (obj == null) {
      serialized = '';
    } else {
      serialized = json.encode(obj);
      print(serialized);
    }
    return serialized;
  }

  // We don't use a Map<String, String> for queryParams.
  // If collectionFormat is 'multi' a key might appear multiple times.
  Future<Response> invokeAPI(String path,
                             String method,
                             List<QueryParam> queryParams,
                             Object? body,
                             Map<String, String> headerParams,
                             Map<String, String> formParams,
                             String contentType,
                             List<String> authNames) async {

    _updateParamsForAuth(authNames, queryParams, headerParams);

    var ps = queryParams.where((p) => p.value != null).map((p) => '${Uri.encodeComponent(p.name)}=${Uri.encodeComponent(p.value)}');
    String queryString = ps.isNotEmpty ?
                         '?' + ps.join('&') :
                         '';

    Uri url = Uri.parse(basePath + path + queryString);
    print("$method ==> $url");
    print(body);
    print("\n\n");
    headerParams.addAll(_defaultHeaderMap);
    headerParams['Content-Type'] = contentType;

    if(body is MultipartRequest) {
      var request = new MultipartRequest(method, url);
      request.fields.addAll(body.fields);
      request.files.addAll(body.files);
      request.headers.addAll(body.headers);
      request.headers.addAll(headerParams);
      var response = await client.send(request);
      return Response.fromStream(response);
    } else {
      var msgBody = contentType == "application/x-www-form-urlencoded" ? formParams : serialize(body);
      var response;
      switch(method) {
        case "POST":
          response = await client.post(url, headers: headerParams, body: msgBody);
          break;
        case "PUT":
          response = await client.put(url, headers: headerParams, body: msgBody);
          break;
        case "DELETE":
          response = await client.delete(url, headers: headerParams);
          break;
        case "PATCH":
          response = await client.patch(url, headers: headerParams, body: msgBody);
          break;
        default:
          response =  await client.get(url, headers: headerParams);
      }
      print(response?.body);
      return response;
    }
  }

  /// Update query and header parameters based on authentication settings.
  /// @param authNames The authentications to apply
  void _updateParamsForAuth(List<String> authNames, List<QueryParam> queryParams, Map<String, String> headerParams) {
    authNames.forEach((authName) {
      Authentication? auth = _authentications[authName];
      if (auth == null) throw new ArgumentError("Authentication undefined: " + authName);
      auth.applyToParams(queryParams, headerParams);
    });
  }

  void setAccessToken(String accessToken) {
    _authentications.forEach((key, auth) {
      if (auth is OAuth) {
        auth.setAccessToken(accessToken);
      }
    });
  }
}
