# swagger
No description provided (generated by Swagger Codegen https://github.com/swagger-api/swagger-codegen)

This Dart package is automatically generated by the [Swagger Codegen](https://github.com/swagger-api/swagger-codegen) project:

- API version: v1
- Build package: io.swagger.codegen.v3.generators.dart.DartClientCodegen

## Requirements

Dart 1.20.0 or later OR Flutter 0.0.20 or later

## Installation & Usage

### Github
If this Dart package is published to Github, please include the following in pubspec.yaml
```
name: swagger
version: 1.0.0
description: Swagger API client
dependencies:
  swagger:
    git: https://github.com/GIT_USER_ID/GIT_REPO_ID.git
      version: 'any'
```

### Local
To use the package in your local drive, please include the following in pubspec.yaml
```
dependencies:
  swagger:
    path: /path/to/swagger
```

## Tests

TODO

## Getting Started

Please follow the [installation procedure](#installation--usage) and then run the following:

```dart
import 'package:swagger/api.dart';
// TODO Configure API key authorization: Bearer
//swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new AdminApi();
var body = new LoginModel(); // LoginModel | 

try {
    var result = api_instance.authenticate(body);
    print(result);
} catch (e) {
    print("Exception when calling AdminApi->authenticate: $e\n");
}
```

## Documentation for API Endpoints

All URIs are relative to */*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*AdminApi* | [**authenticate**](docs//AdminApi.md#authenticate) | **POST** /api/Admin/token | 
*AdminApi* | [**create**](docs//AdminApi.md#create) | **POST** /api/Admin/create | 
*AdminApi* | [**deleteUser**](docs//AdminApi.md#deleteuser) | **GET** /api/Admin/delete/{email} | 
*AdminApi* | [**getUserById**](docs//AdminApi.md#getuserbyid) | **GET** /api/Admin/user/get/{id} | 
*AdminApi* | [**listAdmins**](docs//AdminApi.md#listadmins) | **GET** /api/Admin/list | 
*AdminApi* | [**listLoans**](docs//AdminApi.md#listloans) | **GET** /api/Admin/loans/list | 
*BillsApi* | [**changeCableTvSubscription**](docs//BillsApi.md#changecabletvsubscription) | **POST** /api/Bills/airtime/change-cable-tv-subscription | 
*BillsApi* | [**getAirtimeProviders**](docs//BillsApi.md#getairtimeproviders) | **GET** /api/Bills/airtime/providers | 
*BillsApi* | [**getDataProviders**](docs//BillsApi.md#getdataproviders) | **GET** /api/Bills/airtime/data-providers | 
*BillsApi* | [**getElectricityBillers**](docs//BillsApi.md#getelectricitybillers) | **GET** /api/Bills/airtime/electricity-billers | 
*BillsApi* | [**getProviderAddons**](docs//BillsApi.md#getprovideraddons) | **POST** /api/Bills/multichoice/provider-addons/{ServiceType}/{ProductCode} | 
*BillsApi* | [**getProviderBouquets**](docs//BillsApi.md#getproviderbouquets) | **POST** /api/Bills/multichoice/provider-bouquets/{serviceType} | 
*BillsApi* | [**getProviderBundles**](docs//BillsApi.md#getproviderbundles) | **POST** /api/Bills/airtime/data-bundles/{ServiceType}/{AccountNumber} | 
*BillsApi* | [**purchaseAirtime**](docs//BillsApi.md#purchaseairtime) | **POST** /api/Bills/airtime/purchase | 
*BillsApi* | [**purchaseDataBundle**](docs//BillsApi.md#purchasedatabundle) | **POST** /api/Bills/airtime/data-bundle | 
*BillsApi* | [**purchasePostPaidElectricity**](docs//BillsApi.md#purchasepostpaidelectricity) | **POST** /api/Bills/airtime/purchase-postpaid-electricity | 
*BillsApi* | [**purchasePrePaidElectricity**](docs//BillsApi.md#purchaseprepaidelectricity) | **POST** /api/Bills/airtime/purchase-prepaid-electricity | 
*BillsApi* | [**renewSubscription**](docs//BillsApi.md#renewsubscription) | **POST** /api/Bills/multichoice/renew-subscription | 
*BillsApi* | [**validateMultiChoiceAccount**](docs//BillsApi.md#validatemultichoiceaccount) | **POST** /api/Bills/multichoice/multichoice-account/{ServiceType}/{AccountNumber} | 
*LoanApi* | [**createLoanRequest**](docs//LoanApi.md#createloanrequest) | **POST** /api/Loan/apply | 
*LoanApi* | [**getLoanRequest**](docs//LoanApi.md#getloanrequest) | **GET** /api/Loan/{id} | 
*LoanApi* | [**listMyLoans**](docs//LoanApi.md#listmyloans) | **GET** /api/Loan/my | 
*SavingsApi* | [**createLiqiedeGoalSavingPlan**](docs//SavingsApi.md#createliqiedegoalsavingplan) | **POST** /api/Savings/plans/liqiede-goal | 
*SavingsApi* | [**createLiqiedeSealSavingPlan**](docs//SavingsApi.md#createliqiedesealsavingplan) | **POST** /api/Savings/plans/liqiede-seal | 
*SavingsApi* | [**getSavingPlanTypes**](docs//SavingsApi.md#getsavingplantypes) | **GET** /api/Savings/plans/types | 
*SavingsApi* | [**getWithdrawalPenaltyPercentage**](docs//SavingsApi.md#getwithdrawalpenaltypercentage) | **GET** /api/Savings/withdrawalpenaltypercentage | 
*SavingsApi* | [**retryPlanPayment**](docs//SavingsApi.md#retryplanpayment) | **POST** /api/Savings/plans/retry-payment/{PlanId}/{PaymentMethod} | 
*SavingsApi* | [**withdrawPrematurely**](docs//SavingsApi.md#withdrawprematurely) | **POST** /api/Savings/plans/withdraw-prematurely | 
*UserApi* | [**completeReset**](docs//UserApi.md#completereset) | **POST** /api/User/reset/complete | 
*UserApi* | [**delete**](docs//UserApi.md#delete) | **GET** /api/User/delete/{email} | 
*UserApi* | [**getUser**](docs//UserApi.md#getuser) | **GET** /api/User/getbyid | 
*UserApi* | [**initiateReset**](docs//UserApi.md#initiatereset) | **GET** /api/User/reset/initiate/{email} | 
*UserApi* | [**listUsers**](docs//UserApi.md#listusers) | **GET** /api/User/list | 
*UserApi* | [**login**](docs//UserApi.md#login) | **POST** /api/User/token | 
*UserApi* | [**register**](docs//UserApi.md#register) | **POST** /api/User/register | 
*UserApi* | [**searchUsers**](docs//UserApi.md#searchusers) | **GET** /api/User/search/{search} | 
*UserApi* | [**updatePassword**](docs//UserApi.md#updatepassword) | **POST** /api/User/password/update | 
*UserApi* | [**updateUser**](docs//UserApi.md#updateuser) | **PUT** /api/User/update | 
*UserApi* | [**verify**](docs//UserApi.md#verify) | **GET** /api/User/verifyUser/{token}/{email} | 
*WalletApi* | [**createTransactionPin**](docs//WalletApi.md#createtransactionpin) | **POST** /api/Wallet/create/pin | 
*WalletApi* | [**createUserWallet**](docs//WalletApi.md#createuserwallet) | **POST** /api/Wallet/create | 
*WalletApi* | [**debitWallet**](docs//WalletApi.md#debitwallet) | **POST** /api/Wallet/debit | 
*WalletApi* | [**fundWallet**](docs//WalletApi.md#fundwallet) | **POST** /api/Wallet/fund | 
*WalletApi* | [**getTransactionPin**](docs//WalletApi.md#gettransactionpin) | **GET** /api/Wallet/pin/{userId} | 
*WalletApi* | [**listCards**](docs//WalletApi.md#listcards) | **GET** /api/Wallet/cards/list | 
*WalletApi* | [**listCardsByUserId**](docs//WalletApi.md#listcardsbyuserid) | **GET** /api/Wallet/card/{userId}/list | 
*WalletApi* | [**listTransactions**](docs//WalletApi.md#listtransactions) | **GET** /api/Wallet/transaction/{userId}/list | 
*WalletApi* | [**statementOfAccount**](docs//WalletApi.md#statementofaccount) | **GET** /api/Wallet/statementOfAccount/{userId}/{startDate}/{endDate} | 
*WalletApi* | [**transferToNigerianBank**](docs//WalletApi.md#transfertonigerianbank) | **POST** /api/Wallet/transfer/nigerianbank | 
*WalletApi* | [**transferToWallet**](docs//WalletApi.md#transfertowallet) | **POST** /api/Wallet/transfer | 
*WalletApi* | [**validatePayment**](docs//WalletApi.md#validatepayment) | **GET** /api/Wallet/payment/validate/{transactionReference}/{transactionId} | 
*WalletApi* | [**walletBalance**](docs//WalletApi.md#walletbalance) | **GET** /api/Wallet/balance | 

## Documentation For Models

 - [AirtimePurchaseInput](docs//AirtimePurchaseInput.md)
 - [AirtimePurchaseView](docs//AirtimePurchaseView.md)
 - [AirtimePurchaseViewStandardResponse](docs//AirtimePurchaseViewStandardResponse.md)
 - [AvailablePricingOptionResponse](docs//AvailablePricingOptionResponse.md)
 - [BaxiProviderResponse](docs//BaxiProviderResponse.md)
 - [BaxiProvidersResponse](docs//BaxiProvidersResponse.md)
 - [BaxiProvidersResponseStandardResponse](docs//BaxiProvidersResponseStandardResponse.md)
 - [CableSubscriptionModel](docs//CableSubscriptionModel.md)
 - [Card](docs//Card.md)
 - [CardView](docs//CardView.md)
 - [CardViewIEnumerableStandardResponse](docs//CardViewIEnumerableStandardResponse.md)
 - [Code](docs//Code.md)
 - [CurrentBouquetRawResponse](docs//CurrentBouquetRawResponse.md)
 - [DataBundlePurchaseInput](docs//DataBundlePurchaseInput.md)
 - [DataProviderResponse](docs//DataProviderResponse.md)
 - [DataProviderResponseStandardResponse](docs//DataProviderResponseStandardResponse.md)
 - [DebitWalletModel](docs//DebitWalletModel.md)
 - [FundWalletModel](docs//FundWalletModel.md)
 - [Int32StandardResponse](docs//Int32StandardResponse.md)
 - [ItemResponse](docs//ItemResponse.md)
 - [Link](docs//Link.md)
 - [LiquedeSealInput](docs//LiquedeSealInput.md)
 - [LiquiedeGoalInput](docs//LiquiedeGoalInput.md)
 - [LoanModel](docs//LoanModel.md)
 - [LoanView](docs//LoanView.md)
 - [LoanViewIEnumerableStandardResponse](docs//LoanViewIEnumerableStandardResponse.md)
 - [LoanViewPagedCollection](docs//LoanViewPagedCollection.md)
 - [LoanViewPagedCollectionStandardResponse](docs//LoanViewPagedCollectionStandardResponse.md)
 - [LoanViewStandardResponse](docs//LoanViewStandardResponse.md)
 - [LoginModel](docs//LoginModel.md)
 - [MediaModel](docs//MediaModel.md)
 - [MultichoiceAccountResponse](docs//MultichoiceAccountResponse.md)
 - [MultichoiceAccountResponseStandardResponse](docs//MultichoiceAccountResponseStandardResponse.md)
 - [MultichoiceUserResponse](docs//MultichoiceUserResponse.md)
 - [NGNTransferModel](docs//NGNTransferModel.md)
 - [PasswordReset](docs//PasswordReset.md)
 - [PasswordResetModel](docs//PasswordResetModel.md)
 - [PaymentLog](docs//PaymentLog.md)
 - [PaymentView](docs//PaymentView.md)
 - [PaymentViewStandardResponse](docs//PaymentViewStandardResponse.md)
 - [ProviderBouquetResponse](docs//ProviderBouquetResponse.md)
 - [ProviderBouquetResponseListStandardResponse](docs//ProviderBouquetResponseListStandardResponse.md)
 - [ProviderBundleResponse](docs//ProviderBundleResponse.md)
 - [ProviderBundleResponseListStandardResponse](docs//ProviderBundleResponseListStandardResponse.md)
 - [ProviderResponse](docs//ProviderResponse.md)
 - [PurchaseElectricityModel](docs//PurchaseElectricityModel.md)
 - [RawOutputResponse](docs//RawOutputResponse.md)
 - [Register](docs//Register.md)
 - [SavingPlanType](docs//SavingPlanType.md)
 - [SavingPlanTypeIEnumerableStandardResponse](docs//SavingPlanTypeIEnumerableStandardResponse.md)
 - [SavingPlans](docs//SavingPlans.md)
 - [SavingsView](docs//SavingsView.md)
 - [SavingsViewStandardResponse](docs//SavingsViewStandardResponse.md)
 - [SavingsWithdrawalModel](docs//SavingsWithdrawalModel.md)
 - [Status](docs//Status.md)
 - [StringStandardResponse](docs//StringStandardResponse.md)
 - [SubscriptionModel](docs//SubscriptionModel.md)
 - [Transaction](docs//Transaction.md)
 - [TransactionView](docs//TransactionView.md)
 - [TransactionViewPagedCollection](docs//TransactionViewPagedCollection.md)
 - [TransactionViewPagedCollectionStandardResponse](docs//TransactionViewPagedCollectionStandardResponse.md)
 - [UpdateUserModel](docs//UpdateUserModel.md)
 - [User](docs//User.md)
 - [UserMetricsView](docs//UserMetricsView.md)
 - [UserView](docs//UserView.md)
 - [UserViewIEnumerableStandardResponse](docs//UserViewIEnumerableStandardResponse.md)
 - [UserViewPagedCollection](docs//UserViewPagedCollection.md)
 - [UserViewPagedCollectionStandardResponse](docs//UserViewPagedCollectionStandardResponse.md)
 - [UserViewStandardResponse](docs//UserViewStandardResponse.md)
 - [Wallet](docs//Wallet.md)
 - [WalletModel](docs//WalletModel.md)
 - [WalletPinModel](docs//WalletPinModel.md)
 - [WalletTransferModel](docs//WalletTransferModel.md)
 - [WalletView](docs//WalletView.md)
 - [WalletViewStandardResponse](docs//WalletViewStandardResponse.md)

## Documentation For Authorization


## Bearer

- **Type**: API key
- **API key parameter name**: Authorization
- **Location**: HTTP header


## Author


