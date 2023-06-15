import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simor/config/core.dart';
import 'package:simor/models/kendala2_model.dart';
import 'package:simor/models/lokasi_model.dart';

class DosenRepository {
  final http.Client client;
  final SharedPreferences sharedPreferences;
  final String _userTokenKey = 'user_token';

  DosenRepository({required this.client, required this.sharedPreferences});

  Future<Either<String, List<Kendala2Model>>> getKendala() async {
    try {
      final token = await getUserToken();

      final response = await client.get(
        Uri.parse('$baseUrl/dosen-pembimbing/home_kendala'),
        headers: {
          'Authorization': 'Bearer $token',
          'accpent': 'application/json',
        },
      );

      final data = jsonDecode(response.body);

      if (data['data'] != null) {
        return Right(List<Kendala2Model>.from(
          data['data'].map((x) => Kendala2Model.fromJson(x)),
        ).toList());
      }

      return const Left('Gagal Mengambil Data');
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<LokasiModel>>> getLokasi() async {
    try {
      final token = await getUserToken();

      final response = await client.get(
        Uri.parse('$baseUrl/dosen-pembimbing/home_lokasi_ppl'),
        headers: {
          'Authorization': 'Bearer $token',
          'accpent': 'application/json',
        },
      );

      final data = jsonDecode(response.body);

      if (data['data'] != null) {
        return Right(List<LokasiModel>.from(
          data['data'].map((x) => LokasiModel.fromJson(x)),
        ).toList());
      }

      return const Left('Gagal Mengambil Data');
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<void> terimaKendala(String id) async {
    try {
      final token = await getUserToken();

      final response = await client.put(
        Uri.parse('$baseUrl/dosen-pembimbing/update_kendala/$id'),
        headers: {
          'Authorization': 'Bearer $token',
          'accpent': 'application/json',
        },
      );

      debugPrint(response.body);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<String> getUserToken() async {
    return sharedPreferences.getString(_userTokenKey) ?? '';
  }
}
