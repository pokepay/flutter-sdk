import '../pokepay_sdk.dart';
import '../responses.dart';
import 'dart:convert';

extension MessageAPI on PokepayAPI {
  Future<Message> getMessage({
    required String id,
  }) async {
    return await invokeMethod<Message>(
      (j) => Message.fromJson(j),
      'getMessage',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'id': id,
      },
    );
  }

  Future<MessageUnreadCount> getMessageUnreadCount() async {
    return await invokeMethod<MessageUnreadCount>(
      (j) => MessageUnreadCount.fromJson(j),
      'getMessageUnreadCount',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
      },
    );
  }

  Future<PaginatedMessages> listMessages({
    String? before,
    String? after,
    int? perPage,
  }) async {
    return await invokeMethod<PaginatedMessages>(
      (j) => PaginatedMessages.fromJson(j),
      'listMessages',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'before': before,
        'after': after,
        'perPage': perPage,
      },
    );
  }

  Future<MessageAttachment> receiveMessageAttachment({
    required String id,
  }) async {
    return await invokeMethod<MessageAttachment>(
      (j) => MessageAttachment.fromJson(j),
      'receiveMessageAttachment',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'id': id,
      },
    );
  }

  Future<Message> sendMessage({
    required String toUserId,
    double? amount,
    required String subject,
    required String body,
    required User sender,
    String? fromAccountId,
  }) async {
    return await invokeMethod<Message>(
      (j) => Message.fromJson(j),
      'sendMessage',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'toUserId': toUserId,
        'amount': amount,
        'subject': subject,
        'body': body,
        'sender': jsonEncode({
          "id": sender.id,
          "name": sender.name,
          "is_merchant": sender.isMerchant,
        }),
        'fromAccountId': fromAccountId,
      },
    );
  }
}
