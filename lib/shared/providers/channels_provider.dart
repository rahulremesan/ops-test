import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:styria_flutter_web/constants/api_constants.dart';

final channelsProvider = ChangeNotifierProvider((ref) => ChannelsProvider());

final selectedChannelProvider = StateProvider<String>((ref) => 'Home');

final selectedChannelValueProvider = StateProvider<String>((ref) => '');

class Channel {
  final Icon icon;
  final String channel;
  final bool isFollowing;
  final int membersCount;
  final String description;
  final String type;
  final int? id;
  final String? addedBy;

  Channel({
    required this.icon,
    required this.channel,
    required this.isFollowing,
    required this.membersCount,
    required this.description,
    required this.type,
    this.id,
    this.addedBy,
  });

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      icon: const Icon(Icons.campaign_outlined),
      channel: json['name'] as String,
      isFollowing: json['is_subscribed'] as bool? ?? false,
      membersCount: json['sub_count'] as int,
      description: json['description'] as String,
      type: json['type'] as String,
      id: json['id'] as int?,
      addedBy: json['added_by'] as String?,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': channel,
      'description': description,
      'type': type,
      'added_by': 57,
      'is_subscribed': isFollowing,
    };
  }
}

class ChannelsProvider with ChangeNotifier {
  List<Channel> channels = [];
  List<Channel> followingChannels = [];
  List<Channel> organisationChannels = [];
  List<Channel> myChannels = [];

  bool isLoading = false;
  String? errorMessage;

  final int userId;

  List<String> get channelNames =>
      channels.map((channel) => channel.channel).toList();

  ChannelsProvider({this.userId = 57}) {
    fetchChannels();
  }

  Future<void> fetchChannels() async {
    _setLoadingState(true);

    try {
      final url = ApiConstants.fetchChannel(userId);
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status_code'] == 200) {
          final List<dynamic> channelData = data['response_data'];
          channels = channelData
              .map((channelJson) => Channel.fromJson(channelJson))
              .toList();

          _updateFilteredLists();
        } else {
          errorMessage = data['error_message'] ?? 'Failed to load channels.';
        }
      } else {
        errorMessage = 'Error: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage = 'An error occurred: $e';
    } finally {
      _setLoadingState(false);
    }
  }

  Future<void> createChannel(Channel newChannel) async {
    _setLoadingState(true);

    try {
      final url = ApiConstants.createChannel();
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          'name': newChannel.channel,
          'description': newChannel.description,
          'type': newChannel.type,
          'added_by': 57,
          'is_subscribed': newChannel.isFollowing,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status_code'] == 200) {
          final createdChannel = Channel.fromJson(data['response_data']);
          channels.add(createdChannel);
          _updateFilteredLists();
        } else {
          errorMessage = data['error_message'] ?? 'Failed to create channel.';
        }
      } else {
        errorMessage = 'Error: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage = 'An error occurred: $e';
    } finally {
      _setLoadingState(false);
    }
  }

  Future<Map<String, dynamic>?> _subscribeToChannel(
      int channelId, bool subscribe) async {
    final url = ApiConstants.channelSubscribe();
    const userId = 57;

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          'channel_id': channelId,
          'subscribe': subscribe,
          'user_id': userId,
        }),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<void> toggleFollow(Channel channel) async {
    final index = channels.indexOf(channel);
    if (index != -1) {
      final response =
          await _subscribeToChannel(channel.id!, !channel.isFollowing);

      if (response != null && response['status_code'] == 200) {
        channels[index] = Channel(
          icon: channel.icon,
          channel: channel.channel,
          isFollowing: !channel.isFollowing,
          membersCount: channel.membersCount,
          description: channel.description,
          type: channel.type,
          id: channel.id,
          addedBy: channel.addedBy,
        );
        _updateFilteredLists();
        notifyListeners();
      } else {
        const Text("Failed to subscribe/unsubscribe");
      }
    }
  }

  Future<void> updateChannel(Channel updatedChannel) async {
    _setLoadingState(true);

    try {
      final url = ApiConstants.updateChannel(updatedChannel);
      final response = await http.put(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          'id': updatedChannel.id,
          'name': updatedChannel.channel,
          'description': updatedChannel.description,
          'type': updatedChannel.type,
          'updated_by': userId,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status_code'] == 200) {
          final updatedData = Channel.fromJson(data['response_data']);
          final index =
              channels.indexWhere((channel) => channel.id == updatedData.id);
          if (index != -1) {
            channels[index] = updatedData;
            _updateFilteredLists();
            notifyListeners();
          }
        } else {
          errorMessage = data['error_message'] ?? 'Failed to update channel.';
        }
      } else {
        errorMessage = 'Error: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage = 'An error occurred: $e';
    } finally {
      _setLoadingState(false);
    }
  }

  Future<void> deleteChannel(int channelId) async {
    _setLoadingState(true);

    try {
      final url = ApiConstants.deleteChannel(channelId);
      final response = await http.delete(
        Uri.parse('$url&user_id=$userId'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status_code'] == 200) {
          channels.removeWhere((channel) => channel.id == channelId);
          _updateFilteredLists();
        } else {
          errorMessage = data['error_message'] ?? 'Failed to delete channel';
        }
      } else {
        errorMessage = 'Error: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage = 'An error occurred: $e';
    } finally {
      _setLoadingState(false);
    }
  }

  void _updateFilteredLists() {
    followingChannels = channels.where((c) => c.isFollowing).toList();
    organisationChannels =
        channels.where((c) => c.type.toLowerCase() == 'organisation').toList();
    myChannels = channels.where((c) => c.addedBy == userId.toString()).toList();
  }

  void _setLoadingState(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
