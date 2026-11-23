import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_meyve_kesme/oyun_meyve_kesme.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(meyveConfig.title.length, 33);
    expect(meyveConfig.tagline.length, 33);
    for (final s in meyveConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(meyveRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: meyveId, optionalMechanics: meyveRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(meyveRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
