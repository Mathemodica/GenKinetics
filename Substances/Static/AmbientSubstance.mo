within GenKinetics.Substances.Static;
model AmbientSubstance "Metabolite with fixed concentration"
  extends BasicSubstance;
equation
  c = c_0;
end AmbientSubstance;
