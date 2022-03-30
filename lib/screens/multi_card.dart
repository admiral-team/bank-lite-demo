import 'package:bank_lite/components/map/map.dart';
import 'package:bank_lite/generated/assets.gen.dart';
import 'package:bank_lite/screens/estimate_app.dart';
import 'package:bank_lite/screens/status_screen.dart';
import 'package:flutter/material.dart';

import '../components/Cells/leading-cell.dart';
import 'in_progress.dart';

enum _MultiCardActionType { map, estimate, addRequest, transactions }

class MultiCardScreen extends StatefulWidget {
  const MultiCardScreen({Key? key}) : super(key: key);

  @override
  State<MultiCardScreen> createState() => _MultiCardScreenState();
}

class _ListCellModel {
  final String title;
  final _MultiCardActionType type;

  _ListCellModel({required this.title, required this.type});
}

class _MultiCardScreenState extends State<MultiCardScreen> {
  final List<_ListCellModel> _items = [
    _ListCellModel(title: "Банкоматы на карте", type: _MultiCardActionType.map),
    _ListCellModel(
        title: "Оценить приложение", type: _MultiCardActionType.estimate),
    _ListCellModel(
        title: "Отправить заявку", type: _MultiCardActionType.addRequest),
    _ListCellModel(
        title: "Перевести деньги", type: _MultiCardActionType.transactions),
  ];

  SvgGenImage get _bell => Assets.lib.assets.images.alert;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Мультикарта"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF3A83F1)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: const Color(0xFF1C2026),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.zero,
            icon: _bell.svg(color: const Color(0xFF5594F1)),
            onPressed: null,
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFF1C2026),
        padding: const EdgeInsets.only(top: 20.0),
        alignment: Alignment.center,
        child: Expanded(
          child: ListView.separated(
            shrinkWrap: false,
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            itemCount: _items.length,
            itemBuilder: (ctx, index) {
              return _buildView(ctx, index);
            },
            separatorBuilder: (ctx, index) {
              return const SizedBox(height: 8);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildView(BuildContext ctx, int index) {
    _ListCellModel _model = _items[index];
    switch (_model.type) {
      case _MultiCardActionType.map:
        return LeadingCellWidget(
          title: _model.title,
          onPressed: () {
            _pushScreen(MapWidget.instance);
          },
        );
      case _MultiCardActionType.estimate:
        return LeadingCellWidget(
          title: _model.title,
          onPressed: () {
            _pushScreen(const EstimateApp());
          },
        );
      case _MultiCardActionType.addRequest:
        return LeadingCellWidget(
          title: _model.title,
          onPressed: () {
            _pushScreen(const StatusScreen());
          },
        );
      case _MultiCardActionType.transactions:
        return LeadingCellWidget(
          title: _model.title,
          onPressed: () {
            _pushScreen(const InProgress());
          },
        );
    }
  }

  void _pushScreen(Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }
}
