import 'package:bonus_app_admin/exports.dart';
import 'package:bonus_app_admin/models/home/status_market.dart';
import 'package:bonus_app_admin/pages/home/change_status_market.dart';

class MarketStatus extends StatelessWidget {
  const MarketStatus({super.key, required this.info});
  final StatusMarket info;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  info.marketName,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  info.phone,
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    TimeSection(
                      text: "Ochilish vaqti",
                      time: info.openMarket,
                    ),
                    const SizedBox(width: 10),
                    TimeSection(
                      text: "Yopilish vaqti",
                      time: info.closeMarket,
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                IconButton(onPressed: () {
                  Get.to(()=>const ChangeStatusMarket());
                }, icon: const Icon(Icons.settings)),
                Chip(
                  label: Text(info.active == 1 ? "Open" : "Close"),
                  backgroundColor: info.active == 1 ? Colors.green : Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TimeSection extends StatelessWidget {
  const TimeSection({super.key, required this.text, required this.time});
  final String text, time;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        ),
        Row(
          children: [
            const Icon(
              Icons.access_time_rounded,
              size: 18,
              color: Colors.grey,
            ),
            const SizedBox(width: 5),
            Text(time),
          ],
        ),
      ],
    );
  }
}
