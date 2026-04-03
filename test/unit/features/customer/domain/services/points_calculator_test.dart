import 'package:flutter_test/flutter_test.dart';
import 'package:thai_pos_demo/features/customer/domain/services/points_calculator.dart';

void main() {
  group('PointsCalculator', () {
    test('calculatePointsEarned should return 4 points for 100 THB (at 25 THB per point)', () {
      final points = PointsCalculator.calculatePointsEarned(100.0);
      expect(points, 4.0);
    });

    test('calculatePointsEarned should floor correctly (e.g., 99 THB -> 3.96 -> 3.0)', () {
      final points = PointsCalculator.calculatePointsEarned(99.0);
      expect(points, 3.0);
    });

    test('calculateTier should return correct tiers based on spending', () {
      expect(PointsCalculator.calculateTier(0), 'regular');
      expect(PointsCalculator.calculateTier(4999), 'regular');
      expect(PointsCalculator.calculateTier(5000), 'silver');
      expect(PointsCalculator.calculateTier(19999), 'silver');
      expect(PointsCalculator.calculateTier(20000), 'gold');
      expect(PointsCalculator.calculateTier(49999), 'gold');
      expect(PointsCalculator.calculateTier(50000), 'vip');
      expect(PointsCalculator.calculateTier(100000), 'vip');
    });

    test('getTierDiscount should return correct percentage based on tier', () {
      expect(PointsCalculator.getTierDiscount('regular'), 0.0);
      expect(PointsCalculator.getTierDiscount('silver'), 0.05);
      expect(PointsCalculator.getTierDiscount('gold'), 0.10);
      expect(PointsCalculator.getTierDiscount('vip'), 0.15);
      expect(PointsCalculator.getTierDiscount('other'), 0.0);
    });
  });
}
