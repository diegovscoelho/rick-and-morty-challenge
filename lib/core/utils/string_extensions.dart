extension StringCasingExtension on String {
  String capitalizeIfUnknown() => toLowerCase() == 'unknown' ? 'Unknown' : this;
}