import 'package:flutter/material.dart';

class MenuValues {
  const MenuValues(
      {required this.title,
      required this.icon,
      required this.items,
      required this.color});

  final String title;
  final IconData icon;
  final Color color;
  final List<MenuValues> items;
}

const myMenuValue = const [
  MenuValues(icon: Icons.close, title: "close", color: Colors.white, items: []),
  MenuValues(
    icon: Icons.music_note_rounded,
    title: 'Music',
    color: Colors.white,
    items: const [
      MenuValues(
          icon: Icons.music_note,
          items: [],
          title: 'Songs',
          color: Color(0xFF5863F8)),
      MenuValues(
          icon: Icons.play_arrow,
          title: 'Now Playing',
          items: [],
          color: Color(0xFFFF3366)),
      MenuValues(
          icon: Icons.album,
          items: [],
          title: 'Albums',
          color: Color(0xFFFFE433)),
    ],
  ),
  MenuValues(
    icon: Icons.phone_bluetooth_speaker_rounded,
    title: 'Calls',
    color: Colors.white,
    items: const [
      MenuValues(
          icon: Icons.phone_callback_rounded,
          title: 'Incoming',
          items: [],
          color: Color(0xFF2CDA9D)),
      MenuValues(
          icon: Icons.phone_missed_rounded,
          title: 'Missing',
          items: [],
          color: Color(0xFF7678ED)),
      MenuValues(
          icon: Icons.phone_disabled_rounded,
          title: 'Outgoing ',
          items: [],
          color: Color(0xFF446DF6)),
    ],
  ),
  MenuValues(
    icon: Icons.cloud,
    title: 'Cloud',
    color: Colors.white,
    items: const [
      MenuValues(
          icon: Icons.download_rounded,
          title: 'Downloading',
          items: [],
          color: Color(0xFFFF4669)),
      MenuValues(
          icon: Icons.upload_file,
          items: [],
          title: 'Done',
          color: Color(0xFFFF69EB)),
      MenuValues(
          icon: Icons.cloud_upload,
          items: [],
          title: 'Upload',
          color: Color(0xFF2CDA9D)),
    ],
  ),
  MenuValues(
    icon: Icons.wifi,
    title: 'Wifi',
    color: Colors.white,
    items: const [
      MenuValues(
          icon: Icons.wifi_off_rounded,
          items: [],
          title: 'Off',
          color: Color(0xFF5AD2F4)),
      MenuValues(
          icon: Icons.signal_wifi_4_bar_lock_sharp,
          title: 'Lock',
          items: [],
          color: Color(0xFFFF3366)),
      MenuValues(
          icon: Icons.perm_scan_wifi_rounded,
          title: 'Limit',
          items: [],
          color: Color(0xFFFFC07F)),
    ],
  ),
  MenuValues(
    icon: Icons.favorite,
    title: 'Favorites',
    color: Colors.white,
    items: const [
      MenuValues(
          icon: Icons.favorite,
          items: [],
          title: 'Favorite',
          color: Color(0xFF5863F8)),
      MenuValues(
          icon: Icons.favorite_border,
          title: 'Not Favorite',
          items: [],
          color: Color(0xFFF7C548)),
      MenuValues(
          icon: Icons.volunteer_activism,
          title: 'Activism',
          items: [],
          color: Color(0xFF00A878)),
    ],
  ),
  MenuValues(
    icon: Icons.network_cell,
    title: 'Networks',
    color: Colors.white,
    items: const [
      MenuValues(
          icon: Icons.wifi, title: 'Wifi', color: Color(0xFF96858F), items: []),
      MenuValues(
          icon: Icons.network_cell,
          title: 'Network',
          color: Color(0xFF6D7993),
          items: []),
      MenuValues(
          icon: Icons.bluetooth,
          items: [],
          title: 'Bluetooth',
          color: Color(0xFF9099A2)),
    ],
  ),
];
