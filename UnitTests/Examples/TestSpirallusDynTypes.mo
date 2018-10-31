within GenKinetics.UnitTests.Examples;
model TestSpirallusDynTypes "Testing DynamicTypes package"
  .GenKinetics.Examples.Spirallus spirallus;

  .GenKinetics.Examples.SpirallusDynTypes spDynTypes;

  AssertContinuousTrajectory checkV2(MaxAccErr=1e-3);
  AssertContinuousTrajectory checkV3(MaxAccErr=1e-3);
  AssertContinuousTrajectory checkV5(MaxAccErr=1e-5);

equation

  checkV2.T1 = spirallus.v2.v;
  checkV2.T2 = spDynTypes.v2.v;

  checkV3.T1 = spirallus.v3.v;
  checkV3.T2 = spDynTypes.v3.v;

  checkV5.T1 = spirallus.v5.v;
  checkV5.T2 = spDynTypes.v5.v;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end TestSpirallusDynTypes;
