//good one
/*import 'package:flutter/material.dart';
import 'dashboard_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  Color get _profileBlue => const Color(0xFF1E4BB8);
  Color get _navy       => const Color(0xFF0C2F6B);
  Color get _chipFill   => const Color(0xFFF1F6FF);
  Color get _bg         => const Color(0xFFF5F7FA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Setting',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),

            // 🔹 Blue Profile Info Card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _profileBlue,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage('assets/gir_avatar.jpg'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Hello Swati',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'swati@cstech.in',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        Text(
                          '9971125588',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Parent Account: NA',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                        Text(
                          'Current Subscription: Calley Personal',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // 🔹 PROFILE SETTINGS drawer
            _DrawerSection(
              headerColor: _navy,
              title: 'PROFILE SETTINGS',
              children: [
                _PillRow(
                  leadingIcon: Icons.language,
                  text: 'App Language',
                  trailing: _Chevron(),
                  fillColor: _chipFill,
                ),
                const SizedBox(height: 14),
                _PillRow(
                  leadingIcon: Icons.lock_outline,
                  text: 'Change Password',
                  trailing: _Chevron(),
                  fillColor: _chipFill,
                ),
              ],
            ),

            const SizedBox(height: 40),

            // 🔹 CALLING LISTS drawer (floating style)
            _DrawerSection(
              headerColor: _navy,
              title: 'CALLING LISTS',
              isFloating: true, // 👈 enable floating style
              children: [
                _PillRow(
                  leadingIcon: null,
                  text: 'Select Calling List',
                  fillColor: _chipFill,
                  trailing: _RefreshButton(),
                ),
                const SizedBox(height: 14),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DashboardScreen()),
                    );
                  },
                  child: _PillRow(
                    leadingIcon: null,
                    text: 'Test List',
                    fillColor: _chipFill,
                    trailing: _Chevron(),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// === helper widgets ===
class _DrawerSection extends StatelessWidget {
  final String title;
  final Color headerColor;
  final List<Widget> children;
  final bool isFloating; // 👈 added

  const _DrawerSection({
    required this.title,
    required this.headerColor,
    required this.children,
    this.isFloating = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // 🔹 White body
          Container(
            margin: EdgeInsets.only(top: isFloating ? 44 : 26),
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: isFloating
                  ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : null,
            ),
            child: Column(children: children),
          ),

          // 🔹 Header
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: 44,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: headerColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                  bottomLeft: Radius.circular(isFloating ? 0 : 18),
                  bottomRight: Radius.circular(isFloating ? 0 : 18),
                ),
              ),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.6,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PillRow extends StatelessWidget {
  final IconData? leadingIcon;
  final String text;
  final Widget trailing;
  final Color fillColor;

  const _PillRow({
    this.leadingIcon,
    required this.text,
    required this.trailing,
    required this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          if (leadingIcon != null) ...[
            Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(leadingIcon, color: Colors.black54, size: 22),
            ),
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}

class _Chevron extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 38,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: Color(0xFFE5E9F2)),
      ),
      child: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.black87),
    );
  }
}

class _RefreshButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.refresh, size: 16, color: Colors.white),
      label: const Text(
        'Refresh',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Color(0xFF1E4BB8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}*/

//-----------

//final setting_screen.dart
import 'package:flutter/material.dart';
import 'dashboard_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  Color get _profileBlue => const Color(0xFF1E4BB8);
  Color get _navy => const Color(0xFF0C2F6B);
  Color get _chipFill => const Color(0xFFF1F6FF);
  Color get _bg => const Color(0xFFF5F7FA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Setting',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),

            // 🔹 Blue Profile Info Card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _profileBlue,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage('assets/gir_avatar.jpg'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Hello Swati',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'swati@cstech.in',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        Text(
                          '9971125588',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Parent Account: NA',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                        Text(
                          'Current Subscription: Calley Personal',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // 🔹 PROFILE SETTINGS (normal style)
            _DrawerSection(
              headerColor: _navy,
              title: 'PROFILE SETTINGS',
              children: [
                _PillRow(
                  leadingIcon: Icons.language,
                  text: 'App Language',
                  trailing: _Chevron(),
                  fillColor: _chipFill,
                ),
                const SizedBox(height: 14),
                _PillRow(
                  leadingIcon: Icons.lock_outline,
                  text: 'Change Password',
                  trailing: _Chevron(),
                  fillColor: _chipFill,
                ),
              ],
            ),

            const SizedBox(height: 40),

            // 🔹 CALLING LISTS (floating rounded style)
            _DrawerSection(
              headerColor: _navy,
              title: 'CALLING LISTS',
              isFloating: true,
              children: [
                _PillRow(
                  leadingIcon: null,
                  text: 'Select Calling List',
                  fillColor: _chipFill,
                  trailing: _RefreshButton(),
                ),
                const SizedBox(height: 14),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashboardScreen()),
                    );
                  },
                  child: _PillRow(
                    leadingIcon: null,
                    text: 'Test List',
                    fillColor: _chipFill,
                    trailing: _Chevron(),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// === helper widgets ===
class _DrawerSection extends StatelessWidget {
  final String title;
  final Color headerColor;
  final List<Widget> children;
  final bool isFloating;

  const _DrawerSection({
    required this.title,
    required this.headerColor,
    required this.children,
    this.isFloating = false,
  });

  @override
  Widget build(BuildContext context) {
    if (!isFloating) {
      // 🔹 Default PROFILE SETTINGS style
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 26),
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(children: children),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: headerColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.6,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      // 🔹 Floating CALLING LISTS style
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            // Navy Header
            Container(
              height: 44,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Color(0xFF0C2F6B),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), // ⬅️ more rounded
                  topRight: Radius.circular(24),
                ),
              ),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.6,
                ),
              ),
            ),
            // White Floating Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24), // ⬅️ more rounded
                  bottomRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(children: children),
            ),
          ],
        ),
      );
    }
  }
}

class _PillRow extends StatelessWidget {
  final IconData? leadingIcon;
  final String text;
  final Widget trailing;
  final Color fillColor;

  const _PillRow({
    this.leadingIcon,
    required this.text,
    required this.trailing,
    required this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          if (leadingIcon != null) ...[
            Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(leadingIcon, color: Colors.black54, size: 22),
            ),
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}

class _Chevron extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 38,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: Color(0xFFE5E9F2)),
      ),
      child: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.black87),
    );
  }
}

class _RefreshButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.refresh, size: 16, color: Colors.white),
      label: const Text(
        'Refresh',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Color(0xFF1E4BB8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
