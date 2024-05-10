// Yunita Anggeraini 2317153
// Reski Dwi Ramadhani Irawan 2317154
import 'package:flutter/material.dart';

class Food {
  final String name;
  final String description;
  final String imageUrl;
  final double price;

  Food({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Food> _foods = [
    Food(
      name: 'Nasi Goreng',
      description: 'Nasi goreng spesial dengan bumbu rahasia.',
      imageUrl: 'assets/images/nasi_goreng.png',
      price: 15000,
    ),
    Food(
      name: 'Mie Ayam',
      description: 'Mie ayam lezat dengan topping ayam spesial.',
      imageUrl: 'assets/images/mie_ayam.png',
      price: 12000,
    ),
    Food(
      name: 'Bakso',
      description: 'Bakso dengan daging sapi segar.',
      imageUrl: 'assets/images/bakso.png',
      price: 12000,
    ),
    Food(
      name: 'Nasi goreng',
      description: 'Nasi yang cocok untuk sarapan di pagi hari.',
      imageUrl: 'assets/images/nasi_goreng.png',
      price: 12000,
    ),
    Food(
      name: 'Nasi kuning',
      description: 'Nasi yang cocok untuk sarapan di pagi hari.',
      imageUrl: 'assets/images/nasi_kuning.png',
      price: 10000,
    ),
    Food(
      name: 'Rendang',
      description: 'Makanan lezat dengan rempah melimpah.',
      imageUrl: 'assets/images/rendang.png',
      price: 12000,
    ),
  ];

  Map<Food, int> _cart = {};
  double _totalPrice = 0.0;

  void _calculateTotal() {
    double total = 0.0;
    _cart.forEach((food, quantity) {
      total += food.price * quantity;
    });
    setState(() {
      _totalPrice = total;
    });
  }

  @override
  void initState() {
    super.initState();
    _calculateTotal();
  }

  void _addToCart(Food food) {
    setState(() {
      if (_cart.containsKey(food)) {
        _cart[food] = _cart[food]! + 1;
      } else {
        _cart[food] = 1;
      }
      _calculateTotal();
    });
  }

  void _removeFromCart(Food food) {
    setState(() {
      if (_cart.containsKey(food)) {
        if (_cart[food] == 1) {
          _cart.remove(food);
        } else {
          _cart[food] = _cart[food]! - 1;
        }
        _calculateTotal();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 75, 164, 79),
        title: Text('Food Menu'),
        ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: _foods.length,
              itemBuilder: (context, index) {
                Food food = _foods[index];
                return GestureDetector(
                  onTap: () {
                    _addToCart(food);
                  },
                  child: Card(
                    elevation: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Image.network(
                            food.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                food.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Rp ${food.price.toString()}',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Cart - Total: Rp ${_totalPrice.toStringAsFixed(0)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _cart.length,
              itemBuilder: (context, index) {
                Food food = _cart.keys.toList()[index];
                int quantity = _cart.values.toList()[index];
                return ListTile(
                  title: Text('${food.name} x $quantity'),
                  subtitle: Text('Rp ${(food.price * quantity).toString()}'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: () {
                      _removeFromCart(food);
                    },
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 75, 164, 79),
            ),
            child: Text('Bayar'),
          ),
        ],
      ),
    );
  }
}
