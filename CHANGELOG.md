## 2.0.14
* Fix `createAccountCPMToken` API to handle multiple key values in metadata

## 2.0.13
* Fix `deleteBankPay` API

## 2.0.12
* Added optional `requestId` to `bankPayTopUp` API

## 2.0.11
**Sync with Native SDK versions**
* Added `deleteBankPay` API for BankPay

## 2.0.9
* Added `kana` to request params and `paytreeCustomerNumber ` to response from CreateBankPay API

## 2.0.8
* Added `can_use_c2c_transfer` to `GetPrivateMoney` and `SearchPrivateMoney` API responses
* Added `GetAccountCampaignPointAmounts` API

## 2.0.7
* Fixed `getBankPay`, `createBankPay` response from API

## 2.0.6
* Added `identifyIndividual` API for My Number
* Added `createBankPay`, `getBankPay`, `bankpayTopup` APIs for BankPay

## 2.0.5
* Added `additionalPrivateMoneys` field on `Bill` response

## 2.0.4
**Sync with Native SDK versions**
* Added custom fallback for scanning token
* Added `RequestId` parameter for create transactions with `Bill`, `Cashtray`, `Check`, and `CPM`
* Added `pointDept` parameter for `Account` response

## 1.0.6
* Upgrade to flutter 3.0
* Null safety
* Make the transaction can choose to use points or not.
* Support custom domain.

## 1.0.4
* Modified API

## 1.0.3
* Add Coupon feature.

## 1.0.1
* Add Readme let user more know how to use SDK.

## 1.0.0
* First version