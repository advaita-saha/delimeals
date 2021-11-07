import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(
    String title,
    String subTitle,
    bool currentValue,
    var updateValue,
  ) {
    return SwitchListTile(
      value: currentValue,
      title: Text(title),
      subtitle: Text(subTitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  'Gluten-Free',
                  'Only include gluten-free meals',
                  _glutenFree,
                  (value) {
                    setState(() {
                      _glutenFree = value;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Lactose-Free',
                  'Only include lactose-free meals',
                  _lactoseFree,
                  (value) {
                    setState(() {
                      _lactoseFree = value;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meals',
                  _vegetarian,
                  (value) {
                    setState(() {
                      _vegetarian = value;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals',
                  _vegan,
                  (value) {
                    setState(() {
                      _vegan = value;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
