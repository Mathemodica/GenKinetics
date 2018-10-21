within GenKinetics.UnitTests;
model TestSpirallusDynTypes "Testing DynamicTypes package"
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
  Examples.Spirallus spirallus;

  Examples.SpirallusDynTypes spDynTypes;

  Internal.AssertContinuousTrajectory checkV2(MaxAccErr=1e-3);
  Internal.AssertContinuousTrajectory checkV3(MaxAccErr=1e-3);
  Internal.AssertContinuousTrajectory checkV5(MaxAccErr=1e-5);

equation

  checkV2.T1 = spirallus.v2.v;
  checkV2.T2 = spDynTypes.v2.v;

  checkV3.T1 = spirallus.v3.v;
  checkV3.T2 = spDynTypes.v3.v;

  checkV5.T1 = spirallus.v5.v;
  checkV5.T2 = spDynTypes.v5.v;


end TestSpirallusDynTypes;
