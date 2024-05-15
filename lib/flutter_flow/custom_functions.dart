import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

double glowUpMultiplication(
  double proportion,
  double referenceWidgets,
) {
  // Calculate the multiplication of screen width and proportion
  return (proportion ?? 0.0) * (referenceWidgets ?? 0.0);
}

int? glowUpGiftMultiply(
  int glowUpGiftNum,
  int glowUpGiftOther,
) {
  return (glowUpGiftNum ?? 0) * (glowUpGiftOther ?? 0);
}

int glowUpTimeDifference(
  DateTime glowUpSendTime1,
  DateTime glowUpSendTime2,
) {
  // compute the time difference.
  final difference = glowUpSendTime1.difference(glowUpSendTime2);
  return difference.inSeconds.abs();
}

int glowUpGetTheAudioTime(String glowUpChatAudio) {
  // Obtain the duration of glowUpChatAudio
  final bytes = base64.decode(glowUpChatAudio);
  final audioLength =
      bytes.lengthInBytes / (16000 * 2 * 1); // assuming 16kHz, 16-bit, mono
  return audioLength.toInt();
}
