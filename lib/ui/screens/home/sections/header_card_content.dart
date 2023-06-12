part of '../home.dart';

class _HeaderCardContent extends StatelessWidget {
  static const double height = 500;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
      ),
      child: PokeballBackground(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                constraints: const BoxConstraints.expand(),
                padding: const EdgeInsets.all(28),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Hi Nabin \nHow are you?',
                  style: TextStyle(
                    fontSize: 30,
                    height: 1.6,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            const SearchBar(),
            const CategoryGrid(),
          ],
        ),
      ),
    );
  }
}
