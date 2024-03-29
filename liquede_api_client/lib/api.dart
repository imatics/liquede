library swagger.api;

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';
part 'api/flutterwave_api.dart';


part 'api/admin_api.dart';
part 'api/bills_api.dart';
part 'api/loan_api.dart';
part 'api/savings_api.dart';
part 'api/user_api.dart';
part 'api/wallet_api.dart';
part 'model/airtime_purchase_input.dart';
part 'model/airtime_purchase_view.dart';
part 'model/airtime_purchase_view_standard_response.dart';
part 'model/available_pricing_option_response.dart';
part 'model/baxi_provider_response.dart';
part 'model/baxi_providers_response.dart';
part 'model/baxi_providers_response_standard_response.dart';
part 'model/cable_subscription_model.dart';
part 'model/card.dart';
part 'model/card_view.dart';
part 'model/card_view_i_enumerable_standard_response.dart';
part 'model/code.dart';
part 'model/current_bouquet_raw_response.dart';
part 'model/data_bundle_purchase_input.dart';
part 'model/data_provider_response.dart';
part 'model/data_provider_response_standard_response.dart';
part 'model/debit_wallet_model.dart';
part 'model/fund_wallet_model.dart';
part 'model/int32_standard_response.dart';
part 'model/item_response.dart';
part 'model/link.dart';
part 'model/liquede_seal_input.dart';
part 'model/liquiede_goal_input.dart';
part 'model/loan_model.dart';
part 'model/loan_view.dart';
part 'model/loan_view_i_enumerable_standard_response.dart';
part 'model/loan_view_paged_collection.dart';
part 'model/loan_view_paged_collection_standard_response.dart';
part 'model/loan_view_standard_response.dart';
part 'model/login_model.dart';
part 'model/media_model.dart';
part 'model/multichoice_account_response.dart';
part 'model/multichoice_account_response_standard_response.dart';
part 'model/multichoice_user_response.dart';
part 'model/ngn_transfer_model.dart';
part 'model/password_reset.dart';
part 'model/password_reset_model.dart';
part 'model/payment_log.dart';
part 'model/payment_view.dart';
part 'model/payment_view_standard_response.dart';
part 'model/provider_bouquet_response.dart';
part 'model/provider_bouquet_response_list_standard_response.dart';
part 'model/provider_bundle_response.dart';
part 'model/provider_bundle_response_list_standard_response.dart';
part 'model/provider_response.dart';
part 'model/purchase_electricity_model.dart';
part 'model/raw_output_response.dart';
part 'model/register.dart';
part 'model/saving_plan_type.dart';
part 'model/saving_plan_type_i_enumerable_standard_response.dart';
part 'model/saving_plans.dart';
part 'model/savings_view.dart';
part 'model/savings_view_standard_response.dart';
part 'model/savings_withdrawal_model.dart';
part 'model/status.dart';
part 'model/string_standard_response.dart';
part 'model/subscription_model.dart';
part 'model/transaction.dart';
part 'model/transaction_view.dart';
part 'model/transaction_view_paged_collection.dart';
part 'model/transaction_view_paged_collection_standard_response.dart';
part 'model/update_user_model.dart';
part 'model/user.dart';
part 'model/user_metrics_view.dart';
part 'model/user_view.dart';
part 'model/user_view_i_enumerable_standard_response.dart';
part 'model/user_view_paged_collection.dart';
part 'model/user_view_paged_collection_standard_response.dart';
part 'model/user_view_standard_response.dart';
part 'model/wallet.dart';
part 'model/wallet_model.dart';
part 'model/wallet_pin_model.dart';
part 'model/wallet_transfer_model.dart';
part 'model/wallet_view.dart';
part 'model/wallet_view_standard_response.dart';
part 'api/base_service_response_model.dart';
part 'model/bank_info.dart';
part 'model/flutterwave_acct_verification_response.dart';
part 'model/verify_account.dart';
part 'model/beneficiary_model.dart';

ApiClient defaultApiClient = new ApiClient();
ApiClient flutterwaveClient = new ApiClient(basePath: "https://api.flutterwave.com/v3");
