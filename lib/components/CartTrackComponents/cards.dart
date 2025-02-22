import 'package:flutter/material.dart';

class Cards extends StatefulWidget {
  final String title;
  final String? description;
  final String? iconPath;
  final VoidCallback onTap;
  final double? height;
  final bool showMenuIcon;
  final VoidCallback? onMenuTap;
  final VoidCallback? onEditTap;

  const Cards({
    super.key,
    required this.title,
    this.description,
    this.iconPath,
    required this.onTap,
    this.height = 137,
    this.showMenuIcon = false,
    this.onMenuTap,
    this.onEditTap,
  });

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  bool _showEditButton = false;

  void _toggleEditButton() {
    if (widget.onEditTap != null) {
      setState(() {
        _showEditButton = !_showEditButton;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final cardWidth = screenWidth * 0.9;
    final responsiveHeight = screenHeight * 0.15;

    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: SizedBox(
          width: cardWidth,
          height: widget.height ?? responsiveHeight,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Extensión azul de edición
              Positioned(
                right: 0,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                  width: _showEditButton
                      ? cardWidth * 0.2
                      : 0, // Ancho responsivo del botón de edición
                  height: widget.height,
                  decoration: const BoxDecoration(
                    color: Color(0xFF0500C6),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: widget.onEditTap,
                    child: Center(
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 150),
                        opacity: _showEditButton ? 1 : 0,
                        child: Image.asset(
                          'images/icons/edit_icon.png',
                          width: cardWidth * 0.06, // Icono responsivo
                          height: cardWidth * 0.06,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Área principal táctil
              Positioned(
                left: _showEditButton ? -(cardWidth * 0.15) : 0,
                child: GestureDetector(
                  onTap: widget.onTap,
                  behavior: HitTestBehavior.opaque,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    width: cardWidth,
                    height: widget.height,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF35588D).withAlpha(38),
                          offset: const Offset(0, 4),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: cardWidth * 0.07,
                        vertical: screenHeight * 0.02,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              if (widget.iconPath != null)
                                Image.asset(
                                  widget.iconPath!,
                                  width: screenWidth * 0.06,
                                  height: screenWidth * 0.06,
                                ),
                              SizedBox(width: screenWidth * 0.04),
                              Expanded(
                                child: Text(
                                  widget.title,
                                  style: TextStyle(
                                    color: Color(0xFF0500C6),
                                    fontSize: screenWidth * 0.045,
                                    fontFamily: 'Mundial',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (widget.description != null) ...[
                            SizedBox(height: screenHeight * 0.015),
                            Text(
                              widget.description ?? '',
                              style: TextStyle(
                                color: Color(0xFF6B7280),
                                fontSize: screenWidth * 0.035,
                                fontFamily: 'Mundial',
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Botón de menú (3 puntos)
              if (widget.showMenuIcon)
                Positioned(
                  top: widget.height! < 120 ? 8 : 17,
                  right: _showEditButton ? cardWidth * 0.2 : cardWidth * 0.05,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    child: GestureDetector(
                      onTap: _toggleEditButton,
                      behavior: HitTestBehavior.translucent,
                      child: Image.asset(
                        'images/icons/points_card.png',
                        width: cardWidth * 0.035,
                        height: cardWidth * 0.055,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
