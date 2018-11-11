within GenKinetics.Substances.Dynamic;
model ReferencedAmbientSubstance
  "additional parameter for a value at a referenced steady state "
  extends AmbientSubstance;
  parameter Units.Concentration c_steady "concentration value at a reference steady state";

end ReferencedAmbientSubstance;
