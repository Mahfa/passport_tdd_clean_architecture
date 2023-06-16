import 'dart:io';
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:passport/domain/model/passport_info.dart';

void main() {
  test('the data from json example should be correctly deserialized', () async {
    final file = File('test_resources/passport_info_test_json.json');
    final pi = PassportInfo.fromJson(jsonDecode(await file.readAsString()));

    expect(pi.results?[0].gender, "male");

    expect(pi.results?[0].name?.title, "Mr");
    expect(pi.results?[0].name?.first, "Batur");
    expect(pi.results?[0].name?.last, "Aclan");

    expect(pi.results?[0].location?.street?.number, 289);
    expect(pi.results?[0].location?.street?.name, "Talak Göktepe Cd");

    expect(pi.results?[0].location?.city, "Kilis");
    expect(pi.results?[0].location?.state, "Samsun");
    expect(pi.results?[0].location?.country, "Turkey");
    expect(pi.results?[0].location?.postcode, 30264);

    expect(pi.results?[0].location?.coordinates?.latitudeStr, "72.0603");
    expect(pi.results?[0].location?.coordinates?.longitudeStr, "-84.3284");
    expect(pi.results?[0].location?.coordinates?.latitude, 72.0603);
    expect(pi.results?[0].location?.coordinates?.longitude, -84.3284);

    expect(pi.results?[0].location?.timezone?.offset, "+2:00");
    expect(pi.results?[0].location?.timezone?.description, "Kaliningrad, South Africa");

    expect(pi.results?[0].email, "batur.aclan@example.com");

    expect(pi.results?[0].login?.uuid, "10804fa3-473f-4b65-a779-ad404d6f21e6");
    expect(pi.results?[0].login?.username, "heavymeercat705");
    expect(pi.results?[0].login?.password, "justice");
    expect(pi.results?[0].login?.salt, "sCm9Ryv5");
    expect(pi.results?[0].login?.md5, "aa7d7f0249eb4bb275c53cb4a3783de2");
    expect(pi.results?[0].login?.sha1, "ef63b362d9d721e9c909fa85e6cb4e11415c4261");
    expect(pi.results?[0].login?.sha256, "f0b7aee0dd2f7f6ce3495046a53baf7d2209581bd1f3677524b621b05ed30f01");

    expect(pi.results?[0].dob?.date, "1993-09-11T08:09:46.125Z");
    expect(pi.results?[0].dob?.age, 29);

    expect(pi.results?[0].registered?.date, "2008-01-19T18:07:27.457Z");
    expect(pi.results?[0].registered?.age, 15);

    expect(pi.results?[0].phone, "(383)-911-9389");
    expect(pi.results?[0].cell, "(085)-724-2106");

    expect(pi.results?[0].id?.name, "");
    expect(pi.results?[0].id?.value, null);

    expect(pi.results?[0].picture?.large, "https://randomuser.me/api/portraits/men/5.jpg");
    expect(pi.results?[0].picture?.medium, "https://randomuser.me/api/portraits/med/men/5.jpg");
    expect(pi.results?[0].picture?.thumbnail, "https://randomuser.me/api/portraits/thumb/men/5.jpg");

    expect(pi.results?[0].nat, "TR");

    expect(pi.info?.seed, "88cd90bcf119c1b9");
    expect(pi.info?.results, 1);
    expect(pi.info?.page, 1);
    expect(pi.info?.version, "1.4");
  });
}
