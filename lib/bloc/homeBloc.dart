import 'package:myflutterapp/models/prayer.dart';
import 'package:myflutterapp/network/repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final _repository = Repository();
  final _timeFetcher = PublishSubject<Prayer>();

  Observable<Prayer> get allTimes => _timeFetcher.stream;

  fetchTimes() async {
    Prayer itemModel = await _repository.fetchTimes();
    _timeFetcher.sink.add(itemModel);
  }

  dispose() {
    _timeFetcher.close();
  }
}

final bloc = HomeBloc();