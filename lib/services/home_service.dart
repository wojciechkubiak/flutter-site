import 'dart:async';

import '../config/config_service.dart';
import '../exceptions/exceptions.dart';
import '../models/models.dart';
import 'dart:convert';

abstract class DataHomeService extends ConfigService {}

class HomeService extends DataHomeService {}
