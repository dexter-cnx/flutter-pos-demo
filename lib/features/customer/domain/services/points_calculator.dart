class PointsCalculator {
  static const double defaultPointsPerBaht = 1 / 25;

  static double calculatePointsEarned(double totalAmount, {double rate = defaultPointsPerBaht}) {
    return (totalAmount * rate).floorToDouble();
  }

  static String calculateTier(double totalSpent) {
    if (totalSpent >= 50000) return 'vip';
    if (totalSpent >= 20000) return 'gold';
    if (totalSpent >= 5000) return 'silver';
    return 'regular';
  }

  static double getTierDiscount(String tier) {
    switch (tier) {
      case 'vip': return 0.15;
      case 'gold': return 0.10;
      case 'silver': return 0.05;
      default: return 0.0;
    }
  }
}
