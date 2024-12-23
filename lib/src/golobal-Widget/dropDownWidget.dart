import 'package:flutter/material.dart';

class AnimatedDropdown extends StatefulWidget {
  final List<String> items;
  final String? selectedItem;
  final Function(String?) onChanged;

  const AnimatedDropdown({
    required this.items,
    this.selectedItem,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  _AnimatedDropdownState createState() => _AnimatedDropdownState();
}

class _AnimatedDropdownState extends State<AnimatedDropdown>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightAnimation;
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _heightAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  void _toggleDropdown() {
    if (_overlayEntry == null) {
      _showDropdown();
      _controller.forward();
    } else {
      _controller.reverse().then((_) {
        _removeDropdown();
      });
    }
  }

  void _showDropdown() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        width: 200,
        left: offset.dx + (size.width - 200) / 2,
        top: offset.dy + size.height,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height),
          child: Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(8),
            child: SizeTransition(
              sizeFactor: _heightAnimation,
              axisAlignment: -1.0,
              child: SizedBox(
                height: 300,
                child: Scrollbar(
                  thumbVisibility: true,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: widget.items.length,
                    itemBuilder: (context, index) {
                      final item = widget.items[index];
                      return ListTile(
                        title: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        onTap: () {
                          widget.onChanged(item);
                          _toggleDropdown();
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleDropdown,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.selectedItem ?? widget.items.first,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(width: 8),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
