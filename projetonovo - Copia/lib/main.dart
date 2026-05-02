import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const EcoMapApp());
}

class EcoMapApp extends StatelessWidget {
  const EcoMapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoMapa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2D6A4F),
          brightness: Brightness.light,
        ),
        fontFamily: 'Roboto',
      ),
      home: const MainScreen(),
    );
  }
}

// ── Models ──────────────────────────────────────────────────────────────────

enum WasteCategory {
  plastic,
  glass,
  paper,
  metal,
  electronic,
  organic,
  oil,
  battery,
}

extension WasteCategoryExt on WasteCategory {
  String get label {
    const map = {
      WasteCategory.plastic: 'Plástico',
      WasteCategory.glass: 'Vidro',
      WasteCategory.paper: 'Papel',
      WasteCategory.metal: 'Metal',
      WasteCategory.electronic: 'Eletrônico',
      WasteCategory.organic: 'Orgânico',
      WasteCategory.oil: 'Óleo',
      WasteCategory.battery: 'Pilhas',
    };
    return map[this]!;
  }

  IconData get icon {
    const map = {
      WasteCategory.plastic: Icons.local_drink,
      WasteCategory.glass: Icons.wine_bar,
      WasteCategory.paper: Icons.article,
      WasteCategory.metal: Icons.hardware,
      WasteCategory.electronic: Icons.devices,
      WasteCategory.organic: Icons.eco,
      WasteCategory.oil: Icons.opacity,
      WasteCategory.battery: Icons.battery_full,
    };
    return map[this]!;
  }

  Color get color {
    const map = {
      WasteCategory.plastic: Color(0xFF1565C0),
      WasteCategory.glass: Color(0xFF00838F),
      WasteCategory.paper: Color(0xFF558B2F),
      WasteCategory.metal: Color(0xFF6D4C41),
      WasteCategory.electronic: Color(0xFF6A1B9A),
      WasteCategory.organic: Color(0xFF2E7D32),
      WasteCategory.oil: Color(0xFFE65100),
      WasteCategory.battery: Color(0xFFC62828),
    };
    return map[this]!;
  }
}

class CollectionPoint {
  final String id;
  final String name;
  final String address;
  final String neighborhood;
  final double lat;
  final double lng;
  final List<WasteCategory> categories;
  final String hours;
  final String phone;
  final double rating;
  final int totalRatings;
  bool isFavorite;

  CollectionPoint({
    required this.id,
    required this.name,
    required this.address,
    required this.neighborhood,
    required this.lat,
    required this.lng,
    required this.categories,
    required this.hours,
    required this.phone,
    required this.rating,
    required this.totalRatings,
    this.isFavorite = false,
  });
}

class EcoTip {
  final String title;
  final String body;
  final IconData icon;
  final Color color;

  const EcoTip({
    required this.title,
    required this.body,
    required this.icon,
    required this.color,
  });
}

// ── Data ────────────────────────────────────────────────────────────────────

final List<CollectionPoint> samplePoints = [
  CollectionPoint(
    id: '1',
    name: 'EcoPonto Central',
    address: 'Av. Paulista, 1000 - Centro',
    neighborhood: 'Bela Vista',
    lat: -23.5632,
    lng: -46.6543,
    categories: [WasteCategory.plastic, WasteCategory.paper, WasteCategory.metal, WasteCategory.glass],
    hours: 'Seg-Sex: 8h–18h | Sáb: 8h–13h',
    phone: '(11) 3000-1234',
    rating: 4.7,
    totalRatings: 312,
    isFavorite: true,
  ),
  CollectionPoint(
    id: '2',
    name: 'Recicla Pinheiros',
    address: 'R. dos Pinheiros, 450',
    neighborhood: 'Pinheiros',
    lat: -23.5671,
    lng: -46.6899,
    categories: [WasteCategory.electronic, WasteCategory.battery, WasteCategory.plastic],
    hours: 'Seg-Sex: 9h–17h',
    phone: '(11) 3100-5678',
    rating: 4.4,
    totalRatings: 198,
  ),
  CollectionPoint(
    id: '3',
    name: 'Verde Vida Vila Madalena',
    address: 'R. Harmonia, 200',
    neighborhood: 'Vila Madalena',
    lat: -23.5546,
    lng: -46.6914,
    categories: [WasteCategory.organic, WasteCategory.paper, WasteCategory.glass, WasteCategory.oil],
    hours: 'Todos os dias: 7h–20h',
    phone: '(11) 3200-9012',
    rating: 4.9,
    totalRatings: 521,
    isFavorite: true,
  ),
  CollectionPoint(
    id: '4',
    name: 'PontoLimpo Itaim',
    address: 'Al. Itu, 789 - Itaim Bibi',
    neighborhood: 'Itaim Bibi',
    lat: -23.5812,
    lng: -46.6701,
    categories: [WasteCategory.metal, WasteCategory.battery, WasteCategory.electronic],
    hours: 'Seg-Sex: 8h–18h',
    phone: '(11) 3300-3456',
    rating: 4.2,
    totalRatings: 87,
  ),
  CollectionPoint(
    id: '5',
    name: 'EcoStation Lapa',
    address: 'R. Lapa, 300 - Lapa',
    neighborhood: 'Lapa',
    lat: -23.5199,
    lng: -46.7059,
    categories: [WasteCategory.plastic, WasteCategory.glass, WasteCategory.organic, WasteCategory.oil],
    hours: 'Seg-Sáb: 8h–17h',
    phone: '(11) 3400-7890',
    rating: 4.6,
    totalRatings: 143,
  ),
  CollectionPoint(
    id: '6',
    name: 'ReciclaTech Brooklin',
    address: 'Av. Eng. Luís Carlos Berrini, 550',
    neighborhood: 'Brooklin',
    lat: -23.6000,
    lng: -46.6930,
    categories: [WasteCategory.electronic, WasteCategory.battery, WasteCategory.metal, WasteCategory.plastic],
    hours: 'Seg-Sex: 9h–18h | Sáb: 9h–14h',
    phone: '(11) 3500-2345',
    rating: 4.8,
    totalRatings: 267,
  ),
];

const List<EcoTip> ecoTips = [
  EcoTip(
    title: 'Separe antes de descartar',
    body: 'Lave e separe o lixo reciclável do orgânico. Materiais limpos têm muito mais chance de serem reaproveitados.',
    icon: Icons.recycling,
    color: Color(0xFF2D6A4F),
  ),
  EcoTip(
    title: 'Óleo de cozinha',
    body: 'Nunca despeje óleo usado na pia. Acumule em garrafinhas e leve a um ponto de coleta — 1L contamina 1 milhão de litros de água.',
    icon: Icons.opacity,
    color: Color(0xFFE65100),
  ),
  EcoTip(
    title: 'Eletrônicos têm destino certo',
    body: 'Celulares, carregadores e computadores contêm metais pesados. Descarte somente em ecopontos especializados.',
    icon: Icons.devices,
    color: Color(0xFF6A1B9A),
  ),
  EcoTip(
    title: 'Pilhas e baterias',
    body: 'Pilhas alcalinas e baterias de lítio precisam de descarte especial. Supermercados e farmácias costumam ter caixas coletoras.',
    icon: Icons.battery_alert,
    color: Color(0xFFC62828),
  ),
];

// ── Main Screen ──────────────────────────────────────────────────────────────

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    MapPage(),
    TipsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (i) => setState(() => _currentIndex = i),
        indicatorColor: const Color(0xFF2D6A4F).withOpacity(0.15),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Início'),
          NavigationDestination(icon: Icon(Icons.map_outlined), selectedIcon: Icon(Icons.map), label: 'Mapa'),
          NavigationDestination(icon: Icon(Icons.eco_outlined), selectedIcon: Icon(Icons.eco), label: 'Dicas'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}

// ── Home Page ────────────────────────────────────────────────────────────────

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WasteCategory? _selectedFilter;

  List<CollectionPoint> get filtered {
    if (_selectedFilter == null) return samplePoints;
    return samplePoints.where((p) => p.categories.contains(_selectedFilter)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8F4),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: const Color(0xFF2D6A4F),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('EcoMapa', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF1B4332), Color(0xFF40916C)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                  Positioned(
                    right: -30,
                    top: -20,
                    child: Opacity(
                      opacity: 0.12,
                      child: Icon(Icons.park, size: 220, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 80, 20, 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Olá, João! 🌱', style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 16)),
                        const SizedBox(height: 4),
                        Text('${samplePoints.length} pontos de coleta próximos', style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 13)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Stats strip
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12, offset: const Offset(0, 4))],
              ),
              child: Row(
                children: [
                  _StatItem(icon: Icons.recycling, label: 'Reciclados', value: '12 kg', color: const Color(0xFF2D6A4F)),
                  _divider(),
                  _StatItem(icon: Icons.star, label: 'Pontos eco', value: '340', color: const Color(0xFFF4A261)),
                  _divider(),
                  _StatItem(icon: Icons.favorite, label: 'Favoritos', value: '${samplePoints.where((p) => p.isFavorite).length}', color: const Color(0xFFE63946)),
                ],
              ),
            ),
          ),

          // Filter chips
          SliverToBoxAdapter(
            child: SizedBox(
              height: 44,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _FilterChip(label: 'Todos', selected: _selectedFilter == null, onTap: () => setState(() => _selectedFilter = null)),
                  ...WasteCategory.values.map((c) => _FilterChip(
                    label: c.label,
                    icon: c.icon,
                    color: c.color,
                    selected: _selectedFilter == c,
                    onTap: () => setState(() => _selectedFilter = _selectedFilter == c ? null : c),
                  )),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 12)),

          // Section title
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 4, 16, 8),
              child: Text('Pontos de Coleta', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF1B4332))),
            ),
          ),

          // List
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, i) {
                final point = filtered[i];
                return _CollectionCard(
                  point: point,
                  onFavToggle: () => setState(() => point.isFavorite = !point.isFavorite),
                );
              },
              childCount: filtered.length,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }

  Widget _divider() => Container(width: 1, height: 36, color: Colors.grey.shade200);
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  const _StatItem({required this.icon, required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) => Expanded(
    child: Column(children: [
      Icon(icon, color: color, size: 22),
      const SizedBox(height: 4),
      Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: color)),
      Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
    ]),
  );
}

class _FilterChip extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color? color;
  final bool selected;
  final VoidCallback onTap;
  const _FilterChip({required this.label, this.icon, this.color, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final bg = selected ? (color ?? const Color(0xFF2D6A4F)) : Colors.white;
    final fg = selected ? Colors.white : (color ?? Colors.grey.shade700);
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: selected ? Colors.transparent : Colors.grey.shade300),
          boxShadow: selected ? [BoxShadow(color: (color ?? const Color(0xFF2D6A4F)).withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 2))] : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[Icon(icon, size: 14, color: fg), const SizedBox(width: 4)],
            Text(label, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: fg)),
          ],
        ),
      ),
    );
  }
}

class _CollectionCard extends StatelessWidget {
  final CollectionPoint point;
  final VoidCallback onFavToggle;
  const _CollectionCard({required this.point, required this.onFavToggle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage(point: point, onFavToggle: onFavToggle))),
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 10, offset: const Offset(0, 3))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header band
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [const Color(0xFF2D6A4F), const Color(0xFF40916C)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Row(
                children: [
                  Expanded(child: Text(point.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16))),
                  GestureDetector(
                    onTap: onFavToggle,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: Icon(
                        point.isFavorite ? Icons.favorite : Icons.favorite_border,
                        key: ValueKey(point.isFavorite),
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    const Icon(Icons.location_on, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Expanded(child: Text('${point.address} • ${point.neighborhood}', style: const TextStyle(fontSize: 12, color: Colors.grey))),
                  ]),
                  const SizedBox(height: 4),
                  Row(children: [
                    const Icon(Icons.access_time, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(point.hours, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  ]),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 6,
                    runSpacing: 4,
                    children: point.categories.map((c) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(color: c.color.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        Icon(c.icon, size: 11, color: c.color),
                        const SizedBox(width: 3),
                        Text(c.label, style: TextStyle(fontSize: 11, color: c.color, fontWeight: FontWeight.w600)),
                      ]),
                    )).toList(),
                  ),
                  const SizedBox(height: 10),
                  Row(children: [
                    const Icon(Icons.star, color: Color(0xFFF4A261), size: 16),
                    const SizedBox(width: 4),
                    Text('${point.rating}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    const SizedBox(width: 4),
                    Text('(${point.totalRatings} avaliações)', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                    const Spacer(),
                    Text('Ver detalhes ›', style: TextStyle(fontSize: 12, color: const Color(0xFF2D6A4F), fontWeight: FontWeight.w600)),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Detail Page ──────────────────────────────────────────────────────────────

class DetailPage extends StatefulWidget {
  final CollectionPoint point;
  final VoidCallback onFavToggle;
  const DetailPage({super.key, required this.point, required this.onFavToggle});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _userRating = 0;

  @override
  Widget build(BuildContext context) {
    final p = widget.point;
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8F4),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D6A4F),
        foregroundColor: Colors.white,
        title: Text(p.name),
        actions: [
          IconButton(
            icon: Icon(p.isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: () { widget.onFavToggle(); setState(() {}); },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Map placeholder
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                colors: [Color(0xFF74C69D), Color(0xFF2D6A4F)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              children: [
                Positioned.fill(child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CustomPaint(painter: _FakeMapPainter()),
                )),
                Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const Icon(Icons.location_on, color: Color(0xFFE63946), size: 40),
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.9), borderRadius: BorderRadius.circular(8)),
                    child: Text(p.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xFF1B4332))),
                  ),
                ])),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _InfoCard(children: [
            _InfoRow(Icons.location_on, p.address),
            _InfoRow(Icons.map, p.neighborhood),
            _InfoRow(Icons.access_time, p.hours),
            _InfoRow(Icons.phone, p.phone),
          ]),
          const SizedBox(height: 12),
          const Text('Materiais aceitos', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1B4332))),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: p.categories.map((c) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(color: c.color.withOpacity(0.12), borderRadius: BorderRadius.circular(12), border: Border.all(color: c.color.withOpacity(0.3))),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(c.icon, size: 16, color: c.color),
                const SizedBox(width: 6),
                Text(c.label, style: TextStyle(color: c.color, fontWeight: FontWeight.w600)),
              ]),
            )).toList(),
          ),
          const SizedBox(height: 16),
          const Text('Avalie este ponto', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1B4332))),
          const SizedBox(height: 8),
          Row(
            children: List.generate(5, (i) => GestureDetector(
              onTap: () => setState(() => _userRating = i + 1),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Icon(
                  i < _userRating ? Icons.star : Icons.star_border,
                  color: const Color(0xFFF4A261),
                  size: 36,
                ),
              ),
            )),
          ),
          if (_userRating > 0) ...[
            const SizedBox(height: 8),
            Text('Você avaliou: $_userRating/5 ⭐  Obrigado!', style: const TextStyle(color: Color(0xFF2D6A4F), fontWeight: FontWeight.w600)),
          ],
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Rota iniciada no mapa!'), backgroundColor: Color(0xFF2D6A4F))),
            icon: const Icon(Icons.directions),
            label: const Text('Como chegar'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2D6A4F),
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final List<Widget> children;
  const _InfoCard({required this.children});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))]),
    child: Column(children: children),
  );
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const _InfoRow(this.icon, this.text);

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(children: [
      Icon(icon, size: 16, color: const Color(0xFF2D6A4F)),
      const SizedBox(width: 10),
      Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
    ]),
  );
}

class _FakeMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withOpacity(0.1)..strokeWidth = 1..style = PaintingStyle.stroke;
    for (double y = 0; y < size.height; y += 30) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
    for (double x = 0; x < size.width; x += 50) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(_) => false;
}

// ── Map Page ─────────────────────────────────────────────────────────────────

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  WasteCategory? _filter;
  CollectionPoint? _selected;

  List<CollectionPoint> get visible => _filter == null ? samplePoints : samplePoints.where((p) => p.categories.contains(_filter)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D6A4F),
        title: const Text('Mapa de Coleta', style: TextStyle(color: Colors.white)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: SizedBox(
            height: 44,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              children: [
                _FilterChip(label: 'Todos', selected: _filter == null, onTap: () => setState(() => _filter = null)),
                ...WasteCategory.values.map((c) => _FilterChip(
                  label: c.label, icon: c.icon, color: c.color,
                  selected: _filter == c,
                  onTap: () => setState(() => _filter = _filter == c ? null : c),
                )),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: const Color(0xFFD4EDDA),
              child: Stack(
                children: [
                  CustomPaint(size: Size.infinite, painter: _MapGridPainter()),
                  ...visible.map((p) => _MapPin(point: p, selected: _selected?.id == p.id, onTap: () => setState(() => _selected = _selected?.id == p.id ? null : p))),
                  if (_selected != null)
                    Positioned(
                      bottom: 16, left: 16, right: 16,
                      child: _MiniCard(point: _selected!, onClose: () => setState(() => _selected = null)),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final roadPaint = Paint()..color = Colors.white.withOpacity(0.7)..strokeWidth = 14..style = PaintingStyle.stroke..strokeCap = StrokeCap.round;
    final minorPaint = Paint()..color = Colors.white.withOpacity(0.4)..strokeWidth = 6..style = PaintingStyle.stroke;
    final hs = [0.2, 0.45, 0.65, 0.85];
    final vs = [0.15, 0.35, 0.55, 0.75, 0.9];
    for (var h in hs) { canvas.drawLine(Offset(0, size.height * h), Offset(size.width, size.height * h), roadPaint); }
    for (var v in vs) { canvas.drawLine(Offset(size.width * v, 0), Offset(size.width * v, size.height), roadPaint); }
    canvas.drawLine(Offset(0, size.height * 0.3), Offset(size.width, size.height * 0.3), minorPaint);
    canvas.drawLine(Offset(size.width * 0.5, 0), Offset(size.width * 0.5, size.height), minorPaint);
  }

  @override
  bool shouldRepaint(_) => false;
}

class _MapPin extends StatelessWidget {
  final CollectionPoint point;
  final bool selected;
  final VoidCallback onTap;

  static final List<Offset> _positions = [
    const Offset(0.22, 0.35),
    const Offset(0.60, 0.25),
    const Offset(0.45, 0.55),
    const Offset(0.72, 0.62),
    const Offset(0.15, 0.70),
    const Offset(0.80, 0.40),
  ];

  const _MapPin({required this.point, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final idx = int.parse(point.id) - 1;
    final pos = _positions[idx % _positions.length];
    return LayoutBuilder(
      builder: (context, constraints) {
        final x = constraints.maxWidth * pos.dx;
        final y = constraints.maxHeight * pos.dy;
        return Positioned(
          left: x - 20,
          top: y - 40,
          child: GestureDetector(
            onTap: onTap,
            child: AnimatedScale(
              scale: selected ? 1.3 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: Column(children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: selected ? const Color(0xFF2D6A4F) : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6, offset: const Offset(0, 2))],
                  ),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Icon(Icons.recycling, size: 14, color: selected ? Colors.white : const Color(0xFF2D6A4F)),
                    const SizedBox(width: 2),
                    Text('${point.categories.length}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: selected ? Colors.white : const Color(0xFF2D6A4F))),
                  ]),
                ),
                Icon(Icons.location_on, color: selected ? const Color(0xFF2D6A4F) : const Color(0xFFE63946), size: 20),
              ]),
            ),
          ),
        );
      },
    );
  }
}

class _MiniCard extends StatelessWidget {
  final CollectionPoint point;
  final VoidCallback onClose;
  const _MiniCard({required this.point, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 14, offset: const Offset(0, 4))],
      ),
      child: Row(
        children: [
          Container(width: 44, height: 44, decoration: BoxDecoration(color: const Color(0xFF2D6A4F).withOpacity(0.1), borderRadius: BorderRadius.circular(10)), child: const Icon(Icons.recycling, color: Color(0xFF2D6A4F))),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(point.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              Text(point.neighborhood, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 4),
              Wrap(spacing: 4, children: point.categories.take(3).map((c) => Icon(c.icon, size: 14, color: c.color)).toList()),
            ]),
          ),
          IconButton(icon: const Icon(Icons.close, size: 18), onPressed: onClose),
        ],
      ),
    );
  }
}

// ── Tips Page ────────────────────────────────────────────────────────────────

class TipsPage extends StatelessWidget {
  const TipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8F4),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D6A4F),
        title: const Text('Dicas Ecológicas', style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF1B4332), Color(0xFF40916C)], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Icon(Icons.eco, color: Colors.white, size: 32),
              const SizedBox(height: 10),
              const Text('Cada gesto conta!', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Text('Pequenas atitudes do dia a dia fazem uma enorme diferença para o planeta.', style: TextStyle(color: Colors.white.withOpacity(0.85), fontSize: 14)),
            ]),
          ),
          const SizedBox(height: 16),
          ...ecoTips.map((tip) => _TipCard(tip: tip)),
          const SizedBox(height: 8),
          const Text('Guia de Cores da Coleta Seletiva', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1B4332))),
          const SizedBox(height: 10),
          _ColorGuide(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _TipCard extends StatefulWidget {
  final EcoTip tip;
  const _TipCard({required this.tip});

  @override
  State<_TipCard> createState() => _TipCardState();
}

class _TipCardState extends State<_TipCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _expanded = !_expanded),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: widget.tip.color.withOpacity(0.12), borderRadius: BorderRadius.circular(10)),
                    child: Icon(widget.tip.icon, color: widget.tip.color, size: 22),
                  ),
                  const SizedBox(width: 12),
                  Expanded(child: Text(widget.tip.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15))),
                  Icon(_expanded ? Icons.expand_less : Icons.expand_more, color: Colors.grey),
                ],
              ),
            ),
            if (_expanded)
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                child: Text(widget.tip.body, style: const TextStyle(fontSize: 14, color: Colors.black87, height: 1.5)),
              ),
          ],
        ),
      ),
    );
  }
}

class _ColorGuide extends StatelessWidget {
  static const colors = [
    (_Color(Color(0xFF1565C0), 'Azul', 'Papel e Papelão')),
    (_Color(Color(0xFFE53935), 'Vermelho', 'Plástico')),
    (_Color(Color(0xFF43A047), 'Verde', 'Vidro')),
    (_Color(Color(0xFFF9A825), 'Amarelo', 'Metal')),
    (_Color(Color(0xFF6D4C41), 'Marrom', 'Orgânico')),
    (_Color(Color(0xFF546E7A), 'Cinza', 'Rejeito')),
  ];

  const _ColorGuide();

  @override
  Widget build(BuildContext context) => Wrap(
    spacing: 8,
    runSpacing: 8,
    children: colors.map((c) => Container(
      width: (MediaQuery.of(context).size.width - 56) / 3,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(color: c.color.withOpacity(0.12), borderRadius: BorderRadius.circular(12), border: Border.all(color: c.color.withOpacity(0.3))),
      child: Column(children: [
        Container(width: 28, height: 28, decoration: BoxDecoration(color: c.color, shape: BoxShape.circle)),
        const SizedBox(height: 6),
        Text(c.name, style: TextStyle(fontWeight: FontWeight.bold, color: c.color, fontSize: 12)),
        Text(c.material, style: const TextStyle(fontSize: 10, color: Colors.grey), textAlign: TextAlign.center),
      ]),
    )).toList(),
  );
}

class _Color {
  final Color color;
  final String name;
  final String material;
  const _Color(this.color, this.name, this.material);
}

// ── Profile Page ─────────────────────────────────────────────────────────────

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8F4),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            backgroundColor: const Color(0xFF2D6A4F),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0xFF1B4332), Color(0xFF40916C)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const SizedBox(height: 40),
                  CircleAvatar(
                    radius: 44,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    child: const Text('JB', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                  const SizedBox(height: 10),
                  const Text('João Batista', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  const Text('Eco Warrior 🌿', style: TextStyle(color: Colors.white70, fontSize: 13)),
                ]),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    _BadgeCard(icon: Icons.recycling, label: 'Reciclagens', value: '34', color: const Color(0xFF2D6A4F)),
                    const SizedBox(width: 10),
                    _BadgeCard(icon: Icons.star, label: 'Pontos', value: '340', color: const Color(0xFFF4A261)),
                    const SizedBox(width: 10),
                    _BadgeCard(icon: Icons.emoji_events, label: 'Badges', value: '5', color: const Color(0xFF6A1B9A)),
                  ]),
                  const SizedBox(height: 20),
                  const Text('Conquistas', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1B4332))),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      _Badge(emoji: '♻️', label: 'Reciclador'),
                      _Badge(emoji: '🌱', label: 'Plantador'),
                      _Badge(emoji: '💧', label: 'Água limpa'),
                      _Badge(emoji: '⚡', label: 'Econômico'),
                      _Badge(emoji: '🏆', label: 'Top 10'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text('Impacto Ambiental', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1B4332))),
                  const SizedBox(height: 10),
                  _ImpactBar(label: 'CO₂ evitado', value: 0.72, unit: '8.6 kg'),
                  const SizedBox(height: 8),
                  _ImpactBar(label: 'Água economizada', value: 0.55, unit: '340 L'),
                  const SizedBox(height: 8),
                  _ImpactBar(label: 'Energia poupada', value: 0.40, unit: '12 kWh'),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BadgeCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  const _BadgeCard({required this.icon, required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) => Expanded(
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))]),
      child: Column(children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 4),
        Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: color)),
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
      ]),
    ),
  );
}

class _Badge extends StatelessWidget {
  final String emoji;
  final String label;
  const _Badge({required this.emoji, required this.label});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFF2D6A4F).withOpacity(0.3)), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 6, offset: const Offset(0, 2))]),
    child: Row(mainAxisSize: MainAxisSize.min, children: [
      Text(emoji, style: const TextStyle(fontSize: 18)),
      const SizedBox(width: 6),
      Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: Color(0xFF1B4332))),
    ]),
  );
}

class _ImpactBar extends StatelessWidget {
  final String label;
  final double value;
  final String unit;
  const _ImpactBar({required this.label, required this.value, required this.unit});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF1B4332))),
          const Spacer(),
          Text(unit, style: const TextStyle(fontSize: 13, color: Color(0xFF2D6A4F), fontWeight: FontWeight.bold)),
        ]),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: value,
            minHeight: 8,
            backgroundColor: const Color(0xFFE8F5E9),
            valueColor: const AlwaysStoppedAnimation(Color(0xFF2D6A4F)),
          ),
        ),
      ],
    ),
  );
}
