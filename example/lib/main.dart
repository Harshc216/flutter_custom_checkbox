import 'package:flutter/material.dart';
import 'package:flutter_custom_checbox_library/flutter_custom_checbox_library.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Checkbox Hub',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.light,
          primary: const Color(0xFF4F46E5),
          secondary: const Color(0xFFD946EF),
          surface: const Color(0xFFF8FAFC),
        ),
        cardTheme: const CardThemeData(
          color: Colors.white,
          elevation: 2,
          margin: EdgeInsets.symmetric(vertical: 8),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.dark,
          primary: const Color(0xFF818CF8),
          secondary: const Color(0xFFF472B6),
          surface: const Color(0xFF0F172A),
        ),
        cardTheme: const CardThemeData(
          color: Color(0xFF1E293B),
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8),
        ),
      ),
      home: ShowcaseHome(
        themeMode: _themeMode,
        onToggleTheme: _toggleTheme,
      ),
    );
  }
}

class ShowcaseHome extends StatefulWidget {
  final ThemeMode themeMode;
  final VoidCallback onToggleTheme;

  const ShowcaseHome({
    super.key,
    required this.themeMode,
    required this.onToggleTheme,
  });

  @override
  State<ShowcaseHome> createState() => _ShowcaseHomeState();
}

class _ShowcaseHomeState extends State<ShowcaseHome> {
  // Playground state
  bool _playVal = true;
  CheckboxSize _playSize = CheckboxSize.medium;
  CheckboxShape _playShape = CheckboxShape.rounded;
  CheckboxAnimation _playAnim = CheckboxAnimation.bounce;
  int _playBgIndex = 1; // 0: Solid Slate/Grey, 1: Gradient Coral, 2: Glassmorphic Background Image

  // Individual styles
  bool _circleVal = true;
  bool _roundedVal = true;
  bool _squareVal = false;
  bool _outlinedVal = true;
  bool _filledVal = false;
  bool _customVal = true;

  // Specialized states
  bool _valAnimated = false;
  bool _valToggle = true;
  bool? _valTriState;
  bool _valGlass = true;
  bool _valGradient = true;
  bool _valIcon = true;
  bool _valEmoji = true;
  bool _valNeumorphism = false;
  bool _valImage = true;

  // App settings state
  bool _settingsSync = true;
  bool _settingsNotify = false;
  bool _settingsBio = true;

  // Todo State
  final TextEditingController _todoController = TextEditingController();
  final List<CheckboxItem<int>> _todoItems = [
    const CheckboxItem(title: 'Design premium Flutter checkbox assets', data: 1, value: true),
    const CheckboxItem(title: 'Integrate glassmorphic blur filters', data: 2, value: false),
    const CheckboxItem(title: 'Review codebase lint analysis rules', data: 3, value: false),
  ];
  int _todoIdCounter = 4;

  // Collections values
  late List<CheckboxItem<String>> _groupItems;
  late List<CheckboxItem<String>> _gridItems;
  late List<CheckboxItem<String>> _wrapItems;

  // Form keys & values
  final _formKey = GlobalKey<FormState>();
  bool _formTerms = false;
  bool _formPrivacy = false;
  bool _formPromo = true;

  @override
  void initState() {
    super.initState();
    _initCollections();
  }

  void _initCollections() {
    _groupItems = [
      const CheckboxItem(title: 'Standard Shipping', subtitle: '3-5 business days (\$0.00)', data: 'standard', value: true),
      const CheckboxItem(title: 'Express Courier', subtitle: '1-2 business days (\$5.99)', data: 'express', value: false),
      const CheckboxItem(title: 'Priority Overnight', subtitle: 'Next morning (\$15.00)', data: 'priority', value: false),
    ];

    _gridItems = [
      const CheckboxItem(title: 'Sports', emoji: '⚽', data: 'sports', value: true),
      const CheckboxItem(title: 'Music', emoji: '🎵', data: 'music', value: false),
      const CheckboxItem(title: 'Coding', emoji: '💻', data: 'coding', value: true),
      const CheckboxItem(title: 'Movies', emoji: '🍿', data: 'movies', value: false),
      const CheckboxItem(title: 'Gaming', emoji: '🎮', data: 'gaming', value: false),
      const CheckboxItem(title: 'Reading', emoji: '📚', data: 'reading', value: true),
    ];

    _wrapItems = [
      const CheckboxItem(title: 'Flutter Dev', icon: Icons.code, data: 'flutter', value: true),
      const CheckboxItem(title: 'Web Dev', icon: Icons.web, data: 'web', value: false),
      const CheckboxItem(title: 'Mobile Apps', icon: Icons.phone_android, data: 'mobile', value: true),
      const CheckboxItem(title: 'Design UI', icon: Icons.palette, data: 'ui', value: false),
    ];
  }

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = widget.themeMode == ThemeMode.dark;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 70,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isDark
                    ? [const Color(0xFF0F172A), const Color(0xFF1E1B4B)]
                    : [const Color(0xFF6366F1), const Color(0xFF4F46E5)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.check_box_outlined,
                  color: Colors.white,
                  size: 26,
                ),
              ),
              const SizedBox(width: 12),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Custom Checkbox',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(
                isDark ? Icons.wb_sunny : Icons.nightlight_round,
                color: Colors.white,
              ),
              onPressed: widget.onToggleTheme,
              tooltip: 'Toggle Color Theme',
            ),
            const SizedBox(width: 8),
          ],
          bottom: const TabBar(
            indicatorWeight: 3.5,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
            unselectedLabelColor: Colors.white60,
            tabs: [
              Tab(text: 'PLAYGROUND'),
              Tab(text: 'SPECIALIZED'),
              Tab(text: 'SCENARIOS'),
              Tab(text: 'FORM'),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
          ),
          child: TabBarView(
            children: [
              _buildPlaygroundTab(theme),
              _buildSpecializedTab(theme),
              _buildScenariosTab(theme),
              _buildFormTab(theme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaygroundTab(ThemeData theme) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      children: [
        // Live Preview Box
        _buildPlaygroundLivePreview(theme),
        const SizedBox(height: 16),

        // Controls
        _buildPlaygroundSettings(theme),
        const SizedBox(height: 20),

        // Standard Collections
        _buildSectionHeader('Base Shapes & Borders'),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                _buildCheckboxShowcaseRow(
                  title: 'CircleCheckbox',
                  subtitle: 'Perfect circular boundaries',
                  widget: CircleCheckbox(
                    value: _circleVal,
                    onChanged: (val) => setState(() => _circleVal = val),
                    size: CheckboxSize.medium,
                  ),
                ),
                const Divider(),
                _buildCheckboxShowcaseRow(
                  title: 'RoundedCheckbox',
                  subtitle: 'Elegant soft radius corners',
                  widget: RoundedCheckbox(
                    value: _roundedVal,
                    onChanged: (val) => setState(() => _roundedVal = val),
                    size: CheckboxSize.medium,
                  ),
                ),
                const Divider(),
                _buildCheckboxShowcaseRow(
                  title: 'SquareCheckbox',
                  subtitle: 'Classic sharp boundaries',
                  widget: SquareCheckbox(
                    value: _squareVal,
                    onChanged: (val) => setState(() => _squareVal = val),
                    size: CheckboxSize.medium,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        _buildSectionHeader('Borders & Fills'),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                _buildCheckboxShowcaseRow(
                  title: 'OutlinedCheckbox',
                  subtitle: 'Border-only style when unselected',
                  widget: OutlinedCheckbox(
                    value: _outlinedVal,
                    onChanged: (val) => setState(() => _outlinedVal = val),
                    size: CheckboxSize.medium,
                  ),
                ),
                const Divider(),
                _buildCheckboxShowcaseRow(
                  title: 'FilledCheckbox',
                  subtitle: 'Complete color block filling',
                  widget: FilledCheckbox(
                    value: _filledVal,
                    onChanged: (val) => setState(() => _filledVal = val),
                    fillColor: theme.colorScheme.secondary,
                    checkColor: Colors.white,
                    size: CheckboxSize.medium,
                  ),
                ),
                const Divider(),
                _buildCheckboxShowcaseRow(
                  title: 'CustomCheckbox (Configured)',
                  subtitle: 'Theme-tailored checkmarks',
                  widget: CustomCheckbox(
                    value: _customVal,
                    onChanged: (val) => setState(() => _customVal = val),
                    size: CheckboxSize.medium,
                    theme: CustomCheckboxThemeData(
                      checkedColor: Colors.teal,
                      uncheckedColor: Colors.transparent,
                      borderColor: Colors.teal,
                      borderWidth: 2,
                      iconSize: 18,
                      animationDuration: const Duration(milliseconds: 250),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildPlaygroundLivePreview(ThemeData theme) {
    BoxDecoration previewBoxDecoration;
    Widget backgroundInfoText;

    if (_playBgIndex == 0) {
      previewBoxDecoration = BoxDecoration(
        color: theme.brightness == Brightness.dark ? const Color(0xFF1E293B) : const Color(0xFFE2E8F0),
        borderRadius: BorderRadius.circular(16),
      );
      backgroundInfoText = const Text('Solid Canvas Backdrop', style: TextStyle(fontSize: 11, color: Colors.grey));
    } else if (_playBgIndex == 1) {
      previewBoxDecoration = BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFEC4899), Color(0xFFF43F5E), Color(0xFFF59E0B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      );
      backgroundInfoText = const Text('Warm Sunset Gradient Backdrop', style: TextStyle(fontSize: 11, color: Colors.white70));
    } else {
      previewBoxDecoration = BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF3B82F6), Color(0xFF8B5CF6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      );
      backgroundInfoText = const Text('Cool Indigo Gradient Backdrop', style: TextStyle(fontSize: 11, color: Colors.white70));
    }

    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background switcher surface
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 200,
            width: double.infinity,
            decoration: previewBoxDecoration,
            child: const SizedBox(),
          ),

          // Glowing checker
          Positioned(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: theme.brightness == Brightness.dark ? Colors.black26 : Colors.white24,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white24),
                  ),
                  child: AnimatedCheckbox(
                    value: _playVal,
                    onChanged: (val) => setState(() => _playVal = val),
                    size: _playSize,
                    shape: _playShape,
                    animation: _playAnim,
                    theme: CustomCheckboxThemeData(
                      checkedColor: theme.colorScheme.primary,
                      borderColor: Colors.white,
                      borderWidth: 2.5,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  _playVal ? 'Active State' : 'Idle State',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                    letterSpacing: 0.5,
                    shadows: [Shadow(color: Colors.black45, blurRadius: 4, offset: Offset(0, 2))],
                  ),
                ),
                const SizedBox(height: 2),
                backgroundInfoText,
              ],
            ),
          ),

          // Floating switcher controls
          Positioned(
            right: 8,
            top: 8,
            child: Row(
              children: [
                _buildBgDotButton(0, Colors.grey[700]!, 'Solid'),
                _buildBgDotButton(1, const Color(0xFFF43F5E), 'Gradient 1'),
                _buildBgDotButton(2, const Color(0xFF8B5CF6), 'Gradient 2'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBgDotButton(int index, Color color, String tooltip) {
    final active = _playBgIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _playBgIndex = index),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: active ? Colors.white : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: CircleAvatar(
          radius: 8,
          backgroundColor: color,
        ),
      ),
    );
  }

  Widget _buildPlaygroundSettings(ThemeData theme) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.settings_suggest, size: 20),
                SizedBox(width: 8),
                Text(
                  'Configuration Panel',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
              ],
            ),
            const Divider(height: 24),

            // Sizes Selectors
            const Text('Size Multiplier', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.grey)),
            const SizedBox(height: 6),
            Wrap(
              spacing: 8,
              children: CheckboxSize.values.map((size) {
                final selected = _playSize == size;
                return ChoiceChip(
                  label: Text(size.name.toUpperCase(), style: const TextStyle(fontSize: 11)),
                  selected: selected,
                  selectedColor: theme.colorScheme.primary.withValues(alpha: 0.2),
                  labelStyle: TextStyle(
                    color: selected ? theme.colorScheme.primary : theme.textTheme.bodyMedium?.color,
                    fontWeight: FontWeight.w600,
                  ),
                  onSelected: (_) => setState(() => _playSize = size),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),

            // Shape Selectors
            const Text('Shape & Radius', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.grey)),
            const SizedBox(height: 6),
            Wrap(
              spacing: 8,
              children: CheckboxShape.values.map((shape) {
                final selected = _playShape == shape;
                return ChoiceChip(
                  label: Text(shape.name.toUpperCase(), style: const TextStyle(fontSize: 11)),
                  selected: selected,
                  selectedColor: theme.colorScheme.primary.withValues(alpha: 0.2),
                  labelStyle: TextStyle(
                    color: selected ? theme.colorScheme.primary : theme.textTheme.bodyMedium?.color,
                    fontWeight: FontWeight.w600,
                  ),
                  onSelected: (_) => setState(() => _playShape = shape),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),

            // Animation Selectors
            const Text('Transition Animation', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.grey)),
            const SizedBox(height: 6),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: CheckboxAnimation.values.map((anim) {
                final selected = _playAnim == anim;
                return ChoiceChip(
                  label: Text(anim.name.toUpperCase(), style: const TextStyle(fontSize: 11)),
                  selected: selected,
                  selectedColor: theme.colorScheme.primary.withValues(alpha: 0.2),
                  labelStyle: TextStyle(
                    color: selected ? theme.colorScheme.primary : theme.textTheme.bodyMedium?.color,
                    fontWeight: FontWeight.w600,
                  ),
                  onSelected: (_) => setState(() => _playAnim = anim),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecializedTab(ThemeData theme) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      children: [
        _buildSectionHeader('Interactive Controls'),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // AnimatedCheckbox
                _buildCheckboxShowcaseRow(
                  title: 'AnimatedCheckbox',
                  subtitle: 'Dynamic micro-animations',
                  widget: AnimatedCheckbox(
                    value: _valAnimated,
                    animation: CheckboxAnimation.bounce,
                    onChanged: (val) => setState(() => _valAnimated = val),
                    size: CheckboxSize.medium,
                  ),
                ),
                const Divider(),

                // ToggleCheckbox
                _buildCheckboxShowcaseRow(
                  title: 'ToggleCheckbox',
                  subtitle: 'Switch-based selection alternative',
                  widget: ToggleCheckbox(
                    value: _valToggle,
                    onChanged: (val) => setState(() => _valToggle = val),
                  ),
                ),
                const Divider(),

                // TriStateCheckbox
                _buildCheckboxShowcaseRow(
                  title: 'TriStateCheckbox',
                  subtitle: 'True, False & Indeterminate null states',
                  widget: Row(
                    children: [
                      Text(
                        _valTriState == true
                            ? 'Checked'
                            : _valTriState == false
                                ? 'Unchecked'
                                : 'Indeterminate',
                        style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 12),
                      TriStateCheckbox(
                        value: _valTriState,
                        onChanged: (val) => setState(() => _valTriState = val),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        _buildSectionHeader('Aesthetics & Graphic Overlays'),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // GlassCheckbox
                _buildCheckboxShowcaseRow(
                  title: 'GlassCheckbox',
                  subtitle: 'Frosted surface on gradient',
                  widget: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF6366F1), Color(0xFFEC4899)],
                      ),
                    ),
                    child: GlassCheckbox(
                      value: _valGlass,
                      onChanged: (val) => setState(() => _valGlass = val),
                      opacity: 0.25,
                      blur: 8,
                    ),
                  ),
                ),
                const Divider(),

                // GradientCheckbox
                _buildCheckboxShowcaseRow(
                  title: 'GradientCheckbox',
                  subtitle: 'Neon orange/purple gradient fill',
                  widget: GradientCheckbox(
                    value: _valGradient,
                    onChanged: (val) => setState(() => _valGradient = val),
                    gradient: const LinearGradient(colors: [Colors.orange, Colors.pink]),
                  ),
                ),
                const Divider(),

                // IconCheckbox
                _buildCheckboxShowcaseRow(
                  title: 'IconCheckbox',
                  subtitle: 'Displays customized heart glyphs',
                  widget: IconCheckbox(
                    value: _valIcon,
                    onChanged: (val) => setState(() => _valIcon = val),
                    icon: Icons.favorite,
                    theme: const CustomCheckboxThemeData(
                      checkedColor: Colors.pinkAccent,
                      borderColor: Colors.pinkAccent,
                    ),
                  ),
                ),
                const Divider(),

                // EmojiCheckbox
                _buildCheckboxShowcaseRow(
                  title: 'EmojiCheckbox',
                  subtitle: 'Emoji check representation',
                  widget: EmojiCheckbox(
                    value: _valEmoji,
                    onChanged: (val) => setState(() => _valEmoji = val),
                    emoji: '🚀',
                    theme: const CustomCheckboxThemeData(checkedColor: Colors.transparent),
                  ),
                ),
                const Divider(),

                // ImageCheckbox
                _buildCheckboxShowcaseRow(
                  title: 'ImageCheckbox',
                  subtitle: 'Custom star graphic child widget',
                  widget: ImageCheckbox(
                    value: _valImage,
                    onChanged: (val) => setState(() => _valImage = val),
                    size: CheckboxSize.large,
                    theme: const CustomCheckboxThemeData(
                      checkedColor: Colors.amber,
                      borderColor: Colors.amber,
                    ),
                    child: const Icon(Icons.star, color: Colors.white, size: 20),
                  ),
                ),
                const Divider(),

                // NeumorphismCheckbox
                _buildCheckboxShowcaseRow(
                  title: 'NeumorphismCheckbox',
                  subtitle: 'Inner/outer shadow soft UI',
                  widget: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: theme.brightness == Brightness.dark ? const Color(0xFF1E293B) : const Color(0xFFE2E8F0),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: NeumorphismCheckbox(
                      value: _valNeumorphism,
                      onChanged: (val) => setState(() => _valNeumorphism = val),
                      backgroundColor: theme.brightness == Brightness.dark ? const Color(0xFF1E293B) : const Color(0xFFE2E8F0),
                      lightShadow: theme.brightness == Brightness.dark ? const Color(0xFF334155) : Colors.white,
                      darkShadow: theme.brightness == Brightness.dark ? const Color(0xFF0F172A) : const Color(0xFFCBD5E1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildScenariosTab(ThemeData theme) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      children: [
        // Daily Task Planner (Interactive Todo List)
        _buildSectionHeader('Interactive Tasks Planner'),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _todoController,
                        decoration: const InputDecoration(
                          hintText: 'Enter new daily task...',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        ),
                        onSubmitted: (val) => _addTodoItem(),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add_circle, color: theme.colorScheme.primary, size: 28),
                      onPressed: _addTodoItem,
                    ),
                  ],
                ),
                const Divider(),
                if (_todoItems.isEmpty)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text('All tasks completed! Enjoy your day.', style: TextStyle(color: Colors.grey, fontSize: 13)),
                  )
                else
                  Column(
                    children: List.generate(_todoItems.length, (idx) {
                      final item = _todoItems[idx];
                      return Dismissible(
                        key: ValueKey(item.data),
                        onDismissed: (_) {
                          setState(() {
                            _todoItems.removeAt(idx);
                          });
                        },
                        background: Container(
                          color: Colors.red[800],
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 16),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        child: CheckboxTile<int>(
                          item: CheckboxItem(
                            title: item.title,
                            data: item.data,
                            value: item.value,
                            subtitle: item.value ? 'Completed' : 'Pending Action',
                          ),
                          checkboxBuilder: (value, onChanged) {
                            return CircleCheckbox(
                              value: value,
                              onChanged: onChanged,
                              theme: CustomCheckboxThemeData(
                                checkedColor: Colors.green,
                                borderColor: Colors.green.withValues(alpha: 0.6),
                              ),
                            );
                          },
                          onChanged: (val) {
                            setState(() {
                              _todoItems[idx] = _todoItems[idx].copyWith(value: val);
                            });
                          },
                        ),
                      );
                    }),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Live settings Hub
        _buildSectionHeader('Live Settings Hub'),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                CheckboxTile<String>(
                  item: CheckboxItem(
                    title: 'Real-time Database Sync',
                    subtitle: _settingsSync ? 'Sync active (Live feedback)' : 'Sync deactivated',
                    data: 'sync',
                    value: _settingsSync,
                    icon: Icons.sync,
                  ),
                  checkboxBuilder: (value, onChanged) => ToggleCheckbox(value: value, onChanged: onChanged),
                  onChanged: (val) => setState(() => _settingsSync = val),
                ),
                const Divider(),
                CheckboxTile<String>(
                  item: CheckboxItem(
                    title: 'Push Notifications',
                    subtitle: _settingsNotify ? 'Alerts will be pushed immediately' : 'Alerts deactivated',
                    data: 'notify',
                    value: _settingsNotify,
                    icon: Icons.notifications_active,
                  ),
                  checkboxBuilder: (value, onChanged) => ToggleCheckbox(value: value, onChanged: onChanged),
                  onChanged: (val) => setState(() => _settingsNotify = val),
                ),
                const Divider(),
                CheckboxTile<String>(
                  item: CheckboxItem(
                    title: 'Enable Biometrics login',
                    subtitle: _settingsBio ? 'Fingerprint recognition configured' : 'Biometrics inactive',
                    data: 'bio',
                    value: _settingsBio,
                    icon: Icons.fingerprint,
                  ),
                  checkboxBuilder: (value, onChanged) => ToggleCheckbox(value: value, onChanged: onChanged),
                  onChanged: (val) => setState(() => _settingsBio = val),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Groups and layouts
        _buildSectionHeader('Single Selection list (Radio behavior)'),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: CheckboxGroup<String>(
              items: _groupItems,
              multiSelection: false,
              onChanged: (selected) {
                // Instantly update checking values
                setState(() {
                  for (int i = 0; i < _groupItems.length; i++) {
                    final isChecked = selected.any((item) => item.data == _groupItems[i].data);
                    _groupItems[i] = _groupItems[i].copyWith(value: isChecked);
                  }
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 16),

        _buildSectionHeader('CheckboxGrid (Layout)'),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: CheckboxGrid<String>(
              items: _gridItems,
              crossAxisCount: 2,
              childAspectRatio: 3.2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              onChanged: (selected) {
                setState(() {
                  for (int i = 0; i < _gridItems.length; i++) {
                    final isChecked = selected.any((item) => item.data == _gridItems[i].data);
                    _gridItems[i] = _gridItems[i].copyWith(value: isChecked);
                  }
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 16),

        _buildSectionHeader('CheckboxWrap (Flow layout)'),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: CheckboxWrap<String>(
              items: _wrapItems,
              spacing: 8,
              runSpacing: 8,
              onChanged: (selected) {
                setState(() {
                  for (int i = 0; i < _wrapItems.length; i++) {
                    final isChecked = selected.any((item) => item.data == _wrapItems[i].data);
                    _wrapItems[i] = _wrapItems[i].copyWith(value: isChecked);
                  }
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  void _addTodoItem() {
    if (_todoController.text.trim().isEmpty) return;
    setState(() {
      _todoItems.insert(
        0,
        CheckboxItem(
          title: _todoController.text.trim(),
          data: _todoIdCounter++,
          value: false,
        ),
      );
      _todoController.clear();
    });
  }

  Widget _buildFormTab(ThemeData theme) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildSectionHeader('Modern Validation Form'),
        Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Create Account',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Fill details and accept required policies to submit.',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const Divider(height: 24),

                  // Fields
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      prefixIcon: const Icon(Icons.person_outline),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    validator: (v) => v == null || v.trim().isEmpty ? 'Full name is required' : null,
                  ),
                  const SizedBox(height: 16),

                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      prefixIcon: const Icon(Icons.mail_outline),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    validator: (v) => v == null || !v.contains('@') ? 'Enter a valid email address' : null,
                  ),
                  const SizedBox(height: 16),

                  // Required FormField 1
                  CheckboxFormField(
                    title: 'Terms of Service',
                    subtitle: 'I read and agree to terms of usage policies.',
                    initialValue: _formTerms,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (val) => setState(() => _formTerms = val),
                    validator: (v) => v != true ? 'You must accept the terms of service' : null,
                    checkboxBuilder: (value, onChanged) {
                      return CircleCheckbox(
                        value: value,
                        onChanged: onChanged,
                        theme: CustomCheckboxThemeData(
                          checkedColor: theme.colorScheme.primary,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 8),

                  // Required FormField 2
                  CheckboxFormField(
                    title: 'Privacy Agreements',
                    subtitle: 'I consent to standard data handling policies.',
                    initialValue: _formPrivacy,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (val) => setState(() => _formPrivacy = val),
                    validator: (v) => v != true ? 'You must accept the privacy agreements' : null,
                    checkboxBuilder: (value, onChanged) {
                      return CircleCheckbox(
                        value: value,
                        onChanged: onChanged,
                        theme: CustomCheckboxThemeData(
                          checkedColor: theme.colorScheme.primary,
                        ),
                      );
                    },
                  ),
                  const Divider(height: 24),

                  // Optional Promo subscription
                  CheckboxFormField(
                    title: 'Subscribe to newsletter',
                    subtitle: 'Deliver promotional codes & updates.',
                    initialValue: _formPromo,
                    onChanged: (val) => setState(() => _formPromo = val),
                    checkboxBuilder: (value, onChanged) {
                      return RoundedCheckbox(
                        value: value,
                        onChanged: onChanged,
                        theme: CustomCheckboxThemeData(
                          checkedColor: theme.colorScheme.secondary,
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 24),

                  // Submit
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Row(
                                children: [
                                  const Icon(Icons.check_circle, color: Colors.white),
                                  const SizedBox(width: 8),
                                  Text(
                                    _formPromo ? 'Account created! Welcome letter sent.' : 'Account created successfully!',
                                  ),
                                ],
                              ),
                              backgroundColor: Colors.green[700],
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Row(
                                children: [
                                  Icon(Icons.error_outline, color: Colors.white),
                                  SizedBox(width: 8),
                                  Text('Please agree to terms & privacy policies.'),
                                ],
                              ),
                              backgroundColor: Colors.red[700],
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text('Register Account', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8, left: 4),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.4,
        ),
      ),
    );
  }

  Widget _buildCheckboxShowcaseRow({
    required String title,
    required String subtitle,
    required Widget widget,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          widget,
        ],
      ),
    );
  }
}
