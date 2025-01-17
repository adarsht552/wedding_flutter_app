import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedLabelStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontFamily: 'Inter',
                fontSize: 14,
              ),
          unselectedLabelStyle:
              Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontFamily: 'Inter',
                  ),
        ),
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/svg/home.svg",
              colorFilter: ColorFilter.mode(
                  currentIndex == 0 ? const Color(0xff9A2143) : Colors.black87,
                  BlendMode.srcIn),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/svg/dashboard.svg",
              colorFilter: ColorFilter.mode(
                  currentIndex == 1 ? const Color(0xff9A2143) : Colors.black87,
                  BlendMode.srcIn),
            ),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/svg/inspire.svg",
              colorFilter: ColorFilter.mode(
                  currentIndex == 2 ? const Color(0xff9A2143) : Colors.black87,
                  BlendMode.srcIn),
            ),
            label: 'Inspire',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/svg/bookings.svg",
              colorFilter: ColorFilter.mode(
                  currentIndex == 3 ? const Color(0xff9A2143) : Colors.black87,
                  BlendMode.srcIn),
            ),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/svg/account.svg",
              colorFilter: ColorFilter.mode(
                  currentIndex == 4 ? const Color(0xff9A2143) : Colors.black87,
                  BlendMode.srcIn),
            ),
            label: 'Account',
          ),
        ],
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: currentIndex,
        selectedItemColor: const Color(0xff9A2143),
        unselectedItemColor: Colors.black87,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
      ),
    );
  }
}
