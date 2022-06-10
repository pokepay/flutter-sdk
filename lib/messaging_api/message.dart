import 'package:meta/meta.dart';
import '../pokepay_sdk.dart';
import '../pokepay_flutter_sdk_platform_interface.dart';
import '../responses.dart';

extension MessageAPI on PokepayAPI {
  Future<Message> getMessage({
    required String id,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<Message>(
      (j) => Message.fromJson(j),
      'getMessage',
      {
        'env': env.index,
        'accessToken': accessToken,
        'id': id,
      },
    );
  }

  Future<MessageUnreadCount> getMessageUnreadCount() async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<MessageUnreadCount>(
      (j) => MessageUnreadCount.fromJson(j),
      'getMessageUnreadCount',
      {
        'env': env.index,
        'accessToken': accessToken,
      },
    );
  }

  Future<PaginatedMessages> listMessages({
    String? before,
    String? after,
    int? perPage,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<PaginatedMessages>(
      (j) => PaginatedMessages.fromJson(j),
      'listMessages',
      {
        'env': env.index,
        'accessToken': accessToken,
        'before': before,
        'after': after,
        'perPage': perPage,
      },
    );
  }

  Future<MessageAttachment> receiveMessageAttachment({
    required String id,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<MessageAttachment>(
      (j) => MessageAttachment.fromJson(j),
      'receiveMessageAttachment',
      {
        'env': env.index,
        'accessToken': accessToken,
        'id': id,
      },
    );
  }

  Future<Message> sendMessage({
    required String toUserId,
    double? amount,
    required String subject,
    required String body,
    String? fromAccountId,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<Message>(
      (j) => Message.fromJson(j),
      'sendMessage',
      {
        'env': env.index,
        'accessToken': accessToken,
        'toUserId': toUserId,
        'amount': amount,
        'subject': subject,
        'body': body,
        'fromAccountId': fromAccountId,
      },
    );
  }
}
