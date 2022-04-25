import 'package:flutter/material.dart';

class PlaylistFavotiresWidget extends StatelessWidget {
  const PlaylistFavotiresWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 110,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) => Padding(
              padding: const EdgeInsets.only(right: 12), child: _buildCard())),
          itemCount: 3,
          physics: const BouncingScrollPhysics(),
        ),
      ),
    ));
  }

  Widget _buildCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.network(
        'https://s3-alpha-sig.figma.com/img/0b5f/e1ed/589f57698125f1a98419ba8de6d62562?Expires=1651449600&Signature=JnSldRwKWYu6ryZIdHQPbtw6Z~~yjr9-gFnZONWPghjxzm247AFqkt3Bedb8cnRo5hezpJ9G4TVDuqALj-aagGa2tAu4RUIwVt7eHwWxZ2jA3SQWPqUf75xJBLyDXlxqo9Q1wn3BP6eYmr5UQaNbN9MOh9ndoYYF3v79vT4t41S6L5XWdCepw5FMyHgkfOPHPYj8-5kli1WvWBbhJkURjjbfDBPP~Bp7U9713x1MrVSJdiE4sEREVzwCIsyueMA8c4p0001dtjt-qMo~fRRYvOWro5WkA7GKxKSH4q2Idwq34WtM4ytzMLUx57Fd-M0VDaJq11rFT~OtQYtAc0smsg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
        height: 114.0,
        width: 115.0,
        fit: BoxFit.fill,
      ),
    );
  }
}
