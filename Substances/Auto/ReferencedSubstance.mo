within GenKinetics.Substances.Auto;
model ReferencedSubstance
  "Node with additional parameter for a value at reference steady state"
  extends Substance;
  parameter Units.Concentration c_steady "concentration value at a reference steady state";
end ReferencedSubstance;
