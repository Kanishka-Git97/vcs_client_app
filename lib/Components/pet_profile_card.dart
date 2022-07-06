import 'package:flutter/material.dart';

class PetProfileCard extends StatelessWidget {
  //const PetProfileCard({Key? key}) : super(key: key);

  Color _themeColor;
  String _petName;
  String _doctorName;

  PetProfileCard(this._themeColor, this._petName, this._doctorName);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: _themeColor,
      ),
      height: 150,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://th.bing.com/th/id/OIP.DWU7_SVU8-phEQKj49AiZwHaE7?pid=ImgDet&w=800&h=533&rs=1'),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _petName,
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      _doctorName,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SizedBox(
                    height: 45,
                    width: 45,
                    child: CircleAvatar(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.video_call),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SizedBox(
                    height: 45,
                    width: 45,
                    child: CircleAvatar(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.chat_bubble),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SizedBox(
                    height: 45,
                    width: 45,
                    child: CircleAvatar(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.account_box),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SizedBox(
                    height: 45,
                    width: 45,
                    child: CircleAvatar(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.leaderboard),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                    width: 140,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 235, 235, 235),
                    ),
                    child: Column(
                      children: const [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Next Consultation on',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'April 21',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
